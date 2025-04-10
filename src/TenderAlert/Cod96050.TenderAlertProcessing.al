codeunit 96050 "Tender Alert Processing"
{
    trigger OnRun()
    begin
        fnUpdateExpiredUserSubscriptions();
    end;

    var
        PortalUsers: Record "Tender Alert Portal Users";
        OTPSender: Codeunit "OTP Sender";
        OTP: Record OTP;
        CompInfo: Record "Company Information";
        CryptoMgmt: Codeunit "Cryptography Management";
        LicenceCodeunit: Codeunit "Licensing Portal";
        Preferences: Record "Tender Alert Preferences";
        Subscriptions: Record "Tender Alert Subscriptions";
        SubscriptionPref: Record "Subscription Preferences";
        Alerts: Record "Received Alerts";
        AlertTransEntries: Record "Alert Transaction Entries";
        UserPreferences: Record "User Alert Preferences";
        UserPlans: Record "User Tender Subscriptions";
        Tenders: Record "Tender Notices";
        AlertSetup: Record "Tender Alert Setups";
        Payments: Record "E-Citizen Payment Entries";

    procedure fnRegistration(userName: Text; email: Text; phone: Text; password: Text) status: Text
    var
        PassConfirmErr: Label 'danger*The Passwords do not match!';
        IDExistsErr: Label 'found*The ID Number provided already exists!';
        EmailExistsErr: Label 'found*The Email provided already exists!';
        PhoneExistsErr: Label 'found*The Phone Number provided already exists!';
        RegSuccessMsg: Label 'success*Account Registration was successfull. Please enter the code sent to your email for account activation!';
        // RegSuccessMsg: Label 'success*Account Registration was successfull.';
        RegFailErr: Label 'danger*Unable to create Account at this time. Please ensure your details are correct and try again. If this error persists please contact us for help!';
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("E-Mail", email);
        if PortalUsers.FindFirst() then begin
            status := EmailExistsErr;
            exit(status);
        end;

        PortalUsers.Reset();
        PortalUsers.SetRange("Phone No.", phone);
        if PortalUsers.FindFirst() then begin
            status := PhoneExistsErr;
            exit(status);
        end;

        PortalUsers.Init();
        PortalUsers."User Name" := userName;
        PortalUsers.Validate("E-Mail", email);
        PortalUsers.Validate("Phone No.", phone);
        PortalUsers.Password := CryptoMgmt.GenerateHash(password, 4);
        if PortalUsers.Insert(true) then begin
            if sendVerificationEmail(PortalUsers) then
                status := RegSuccessMsg
            else
                status := RegFailErr;
            // if sendAccountRegistrationSuccessEmail(PortalUsers) then
            //     status := RegSuccessMsg
            // else
            //     status := RegFailErr;
        end else begin
            status := RegFailErr;
        end;

        exit(status);
    end;

    procedure sendAccountRegistrationSuccessEmail(User: Record "Tender Alert Portal Users"): Boolean
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        OTPCode: Text;
        RecRef: RecordRef;
    begin
        CompInfo.Get();
        EmailSubject := 'Successful Account Creation';

        User.TestField("E-Mail");
        EmailRecepient.Add(User."E-Mail");


        EmailBody := 'Hello ' + User."User Name" + ',';
        EmailBody += '<BR><BR>Guess What?';
        EmailBody += '<BR><BR>Your account is now officially registed! Your User ID is: <B>' + User."User ID" + '</B>';
        EmailBody += '<BR><BR>Regards,';
        EmailBody += '<BR><BR>' + CompInfo.Name;

        EmailMessage.Create(
            EmailRecepient,
            EmailSubject,
            EmailBody,
            true
        );

        if Email.Send(EmailMessage) then
            exit(true);
    end;

    procedure sendVerificationEmail(User: Record "Tender Alert Portal Users"): Boolean
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        OTPCode: Text;
        RecRef: RecordRef;
    begin
        CompInfo.Get();
        EmailSubject := 'Verify your Email Address for Account Activation';

        User.TestField("E-Mail");
        EmailRecepient.Add(User."E-Mail");

        Clear(OTPCode);
        OTPCode := LicenceCodeunit.fnGenerateOTP();

        RecRef.GetTable(User);

        if LicenceCodeunit.fnStoreOTP(User."User ID", User."E-Mail", User."Phone No.", User."User ID", OTPCode, OTP."OTP Type"::Registration, RecRef.Number) then begin

            EmailBody := 'Hello ' + User."User Name" + ',';
            EmailBody += '<BR><BR>Thanks for verifying your email address!';
            EmailBody += '<BR><BR>Your code is: <B>' + OTPCode + '</B>';
            EmailBody += '<BR><BR>Regards,';
            EmailBody += '<BR>' + CompInfo.Name;

            EmailMessage.Create(
                EmailRecepient,
                EmailSubject,
                EmailBody,
                true
            );

            Email.Send(EmailMessage);

            exit(true);
        end;
    end;

    procedure fnVerifyEmailAddress(userID: Code[20]; email: Text; otpCode: Text[10]) status: Text;
    var
        CurrentDT: DateTime;
        ExpiredErr: Label 'danger*The OTP Code entered has already expired. Please request another.';
        OTPFailErr: Label 'danger*OTP verification failed. Please enter valid OTP or request another code.';
        SuccMsg: Label 'success*Email verified successfully.';
    begin
        OTP.Reset();
        OTP.SetRange("User ID", userID);
        OTP.SetRange("E-Mail", email);
        OTP.SetRange("Used", false);
        if OTP.FindLast() then begin
            OTP.Validate(enteredOtp, otpCode);
            if OTP.Modify() then begin
                if OTP."OTP Code" = OTP.enteredOtp then begin
                    Clear(CurrentDT);
                    CurrentDT := CurrentDateTime;
                    if CurrentDT >= OTP."Expiration Time" then begin
                        status := ExpiredErr;
                    end else begin
                        PortalUsers.Reset();
                        PortalUsers.SetRange("User ID", userID);
                        if PortalUsers.FindFirst() then begin
                            PortalUsers."Email Verified" := true;
                            PortalUsers."Email Verified At" := CurrentDateTime;
                            PortalUsers.Modify(true);
                            status := SuccMsg;
                        end;
                    end;
                end else begin
                    status := OTPFailErr;
                end;
            end else begin
                status := OTPFailErr;
            end;
        end else begin
            status := OTPFailErr;
        end;

        exit(status);
    end;

    procedure fnRequestEmailVerificationOTP(email: Text) status: Text
    var
        NotFoundErr: Label 'danger*User not found.';
        SuccMsg: Label 'success*Verification Email sent successfully.';
        FailErr: Label 'danger*Email not send. Please try again.';
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("E-Mail", email);
        if PortalUsers.FindFirst() then begin
            if sendVerificationEmail(PortalUsers) then
                status := SuccMsg
            else
                status := FailErr
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnCheckEmailVerified(var User: Record "Tender Alert Portal Users"): Boolean
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("E-Mail", User."E-Mail");
        if PortalUsers.FindFirst() then begin
            if PortalUsers."Email Verified" = true then
                exit(true)
        end;
    end;

    procedure fnLogin(email: Text; passKey: Text) Status: Text
    var
        EmailReqErr: Label 'danger*The email field is required.';
        PassReqErr: Label 'danger*The password field is required.';
        LoginSuccMsg: Label 'success*Log in OTP sent successfully.';
        FailErr: Label 'danger*Login failed. Please try again.';
        InvalidErr: Label 'danger*You have entered wrong credentials. Please check and try again.';
        UnVerEmailErr: Label 'danger*Your email has not been verified. Please verify in order to activate your account.';
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("E-Mail", email);
        PortalUsers.SetRange(Password, CryptoMgmt.GenerateHash(passKey, 4));
        if PortalUsers.FindFirst() then begin
            if fnCheckEmailVerified(PortalUsers) = true then begin
                if fnSendLoginOTP(PortalUsers) = true then begin
                    status := LoginSuccMsg;
                end else begin
                    status := FailErr;
                end;
            end else begin
                status := UnVerEmailErr;
            end;
        end else begin
            status := InvalidErr;
        end;

        exit(status);
    end;

    procedure fnRequestLoginOTP(email: Text) Status: Text
    var
        NotFoundErr: Label 'danger*User not found.';
        SuccMsg: Label 'success*OTP sent successfully.';
        FailErr: Label 'danger*OTP not send. Please try again.';
        CurrUserID: Code[20];
    begin

        CurrUserID := fnGetUserID(email);

        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", CurrUserID);
        if PortalUsers.FindFirst() then begin
            if fnSendLoginOTP(PortalUsers) then
                status := SuccMsg
            else
                status := FailErr
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnSendLoginOTP(var User: Record "Tender Alert Portal Users"): Boolean
    var
        OTPCode: Text;
        RecRef: RecordRef;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
    begin
        CompInfo.Get();
        EmailSubject := 'Tender Alert Portal Login OTP';

        User.TestField("E-Mail");
        EmailRecepient.Add(User."E-Mail");

        Clear(OTPCode);
        OTPCode := LicenceCodeunit.fnGenerateOTP();

        RecRef.GetTable(User);

        if LicenceCodeunit.fnStoreOTP(User."User ID", User."E-Mail", User."Phone No.", User."User ID", OTPCode, OTP."OTP Type"::Login, RecRef.Number) then begin

            EmailBody := 'Hello ' + User."User Name" + ',';
            EmailBody += '<BR><BR>Your OTP Code is: <B>' + OTPCode + '</B>';
            EmailBody += '<BR><BR>Regards,';
            EmailBody += '<BR>' + CompInfo.Name;

            EmailMessage.Create(
                EmailRecepient,
                EmailSubject,
                EmailBody,
                true
            );

            Email.Send(EmailMessage);

            exit(true);
        end;
    end;

    procedure fnVerifyLoginOTP(email: Text; otpCode: Text[10]) Status: Text
    var
        CurrentDT: DateTime;
        ExpiredErr: Label 'danger*The OTP Code entered has already expired. Please request another.';
        OTPFailErr: Label 'danger*OTP verification failed. Please enter valid OTP or request another code.';
        SuccMsg: Label 'success*OTP verification successful.';
        CurrUserID: Code[20];
    begin

        CurrUserID := fnGetUserID(email);

        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", CurrUserID);
        if PortalUsers.FindFirst() then begin
            OTP.Reset();
            OTP.SetRange("User ID", PortalUsers."User ID");
            OTP.SetRange("E-Mail", PortalUsers."E-Mail");
            OTP.SetRange("Phone Number", PortalUsers."Phone No.");
            OTP.SetRange("Used", false);
            if OTP.FindLast() then begin
                OTP.Validate(enteredOtp, otpCode);
                if OTP.Modify() then begin
                    if OTP."OTP Code" = OTP.enteredOtp then begin
                        Clear(CurrentDT);
                        CurrentDT := CurrentDateTime;
                        if CurrentDT >= OTP."Expiration Time" then begin
                            status := ExpiredErr;
                        end else begin
                            OTP.Used := true;
                            if OTP.Modify() then
                                status := SuccMsg
                            else
                                status := OTPFailErr
                        end;
                    end else begin
                        status := OTPFailErr;
                    end;
                end else begin
                    status := OTPFailErr;
                end;
            end else begin
                status := OTPFailErr;
            end;
        end else begin
            status := OTPFailErr
        end;

        exit(status);
    end;


    procedure fnGetUserID(email: Text) userID: Code[20]
    begin
        Clear(userID);

        PortalUsers.Reset();
        PortalUsers.SetRange("E-Mail", email);
        if PortalUsers.FindFirst() then begin
            userID := PortalUsers."User ID";
        end else begin
            PortalUsers.Reset();
            PortalUsers.SetRange("ID Number", email);
            if PortalUsers.FindFirst() then
                userID := PortalUsers."User ID";
        end;

        exit(userID);
    end;

    procedure fnGetUserProfile(userId: Code[20]) data: Text
    var
        NotFoundErr: Label 'danger*The User could not be found.';
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", userId);
        if PortalUsers.FindFirst() then
            data += PortalUsers."User ID" + '*' + PortalUsers."User Name" + '*' + '*' + PortalUsers."E-Mail" + '*' + PortalUsers."Phone No." + '::::'
        else
            data := NotFoundErr;

        exit(data);
    end;

    procedure fnPasswordReset(email: Text): Boolean
    var
        Email1: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        RandomDigit: Text;
        LicenceSetup: Record "Licensing Setup";
    begin
        CompInfo.Get();
        LicenceSetup.Get();

        EmailSubject := 'Password Reset Request';

        PortalUsers.Reset();
        PortalUsers.SetRange("E-Mail", email);
        if PortalUsers.FindFirst() then begin
            PortalUsers.TestField("E-Mail");
            EmailRecepient.Add(PortalUsers."E-Mail");

            RandomDigit := CreateGuid;
            RandomDigit := DelChr(RandomDigit, '=', '{}-01');
            RandomDigit := CopyStr(RandomDigit, 1, 8);

            PortalUsers.Password := CryptoMgmt.GenerateHash(RandomDigit, 4);

            if PortalUsers.Modify(true) then begin
                EmailBody := 'Hello ' + PortalUsers."User Name" + ',';
                EmailBody += '<BR><BR>Your password has been reset successfully. Kindly login to the Tender Alert Portal using the credentials below and change your password.';
                EmailBody += '<BR><BR>Your New Credentials are:';
                EmailBody += '<BR><BR>Username: <B>' + PortalUsers."E-Mail" + '</B>';
                EmailBody += '<BR><BR>Password: <B>' + RandomDigit + '</B>';
                EmailBody += '<BR><BR>Regards,';
                EmailBody += '<BR>' + CompInfo.Name;

                EmailMessage.Create(
                    EmailRecepient,
                    EmailSubject,
                    EmailBody,
                    true
                );

                if Email1.Send(EmailMessage) then
                    exit(true)

            end;
        end;
    end;

    procedure fnChangePassword(userID: Code[20]; currPassword: Text; newPassword: Text): Boolean
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", userID);
        PortalUsers.SetRange(Password, CryptoMgmt.GenerateHash(currPassword, 4));
        if PortalUsers.FindFirst() then begin
            PortalUsers.Password := CryptoMgmt.GenerateHash(newPassword, 4);
            if PortalUsers.Modify(true) then
                exit(true)
        end;
    end;

    procedure fnGetUserAccountBalance(UserID: Code[20]) balance: Decimal
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", UserID);
        if PortalUsers.FindFirst() then begin
            PortalUsers.CalcFields("Account Balance");
            balance := PortalUsers."Account Balance";
        end;

        exit(balance);
    end;

    procedure fnGetUserSMSNotificationSent(UserID: Code[20]) count: integer
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", UserID);
        if PortalUsers.FindFirst() then begin
            PortalUsers.CalcFields("No. of SMS");
            count := PortalUsers."No. of SMS";
        end;

        exit(count);
    end;

    procedure fnGetUserEmailNotificationSent(UserID: Code[20]) count: integer
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", UserID);
        if PortalUsers.FindFirst() then begin
            PortalUsers.CalcFields("No. of E-Mails");
            count := PortalUsers."No. of E-Mails";
        end;

        exit(count);
    end;

    procedure fnGetUserNotificationSent(UserID: Code[20]) count: integer
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", UserID);
        if PortalUsers.FindFirst() then begin
            PortalUsers.CalcFields("No. of Notifications");
            count := PortalUsers."No. of Notifications";
        end;

        exit(count);
    end;

    procedure fnGetUserSMSNotificationsCost(UserID: Code[20]) cost: Decimal
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", UserID);
        if PortalUsers.FindFirst() then begin
            PortalUsers.CalcFields("Total Cost of SMS");
            cost := PortalUsers."Total Cost of SMS";
        end;

        exit(cost);
    end;

    procedure fnGetUserEmailNotificationsCost(UserID: Code[20]) cost: Decimal
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", UserID);
        if PortalUsers.FindFirst() then begin
            PortalUsers.CalcFields("Total Cost of E-Mails");
            cost := PortalUsers."Total Cost of E-Mails";
        end;

        exit(cost);
    end;

    procedure fnGetUserNotificationsCost(UserID: Code[20]) cost: Decimal
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", UserID);
        if PortalUsers.FindFirst() then begin
            PortalUsers.CalcFields("Total Cost");
            cost := PortalUsers."Total Cost";
        end;

        exit(cost);
    end;

    procedure fnCreatePlan(userID: Code[20]; subscriptionID: Code[20]) status: Text
    var
        FailErr: Label 'danger*Failed to create plan. Please try again.';
        ExistsErr: Label 'danger*Plan already exists.';
    begin
        UserPlans.Reset();
        UserPlans.SetRange("User ID", userID);
        UserPlans.SetRange("Subscription ID", subscriptionID);
        if UserPlans.FindFirst() then begin
            status := UserPlans."No."
        end else begin
            Subscriptions.Reset();
            Subscriptions.SetRange("No.", subscriptionID);
            if Subscriptions.FindFirst() then begin
                UserPlans.Init();
                UserPlans."No." := '';
                UserPlans."User ID" := userID;
                UserPlans."Subscription ID" := subscriptionID;
                UserPlans."Subscription Date" := CurrentDateTime;
                if Subscriptions."Has Expiry" then
                    UserPlans."Expiry Date" := CalcDate(Subscriptions."Expiry Period", Today);
                UserPlans."Document Date" := Today;
                UserPlans.Status := UserPlans.Status::Active;
                if UserPlans.Insert(true) then begin
                    SubscriptionPref.Reset();
                    SubscriptionPref.SetRange("Document No.", subscriptionID);
                    if SubscriptionPref.FindSet() then begin
                        repeat
                            UserPreferences.Init();
                            UserPreferences."Document No." := UserPlans."No.";
                            UserPreferences."Preference Code" := SubscriptionPref."Preference Code";
                            UserPreferences.Validate("Preference Code");
                            // UserPreferences."Preference Name" := SubscriptionPref."Preference Name";
                            // UserPreferences."Preference Type" := SubscriptionPref."Preference Type";
                            // UserPreferences."Preference Type Name" := SubscriptionPref."Preference Type Name";
                            UserPreferences.Insert(true);
                        until SubscriptionPref.Next() = 0;
                        status := UserPlans."No."
                        // end else begin
                        //     status := FailErr;
                    end;
                end else begin
                    status := FailErr;
                end;
            end else begin

            end;
        end;

        exit(status)
    end;

    procedure fnCreateSubscriptionLines(userID: Code[20]; planID: Code[20]; preferenceID: Code[50]; selected: Boolean) status: Text
    var
        SuccMsg: Label 'success*Plan updated successfully.';
        NotFoundErr: Label 'danger*The Plan was not found.';
        FailErr: Label 'danger*Failed to update Plan. Please try again.';
        NoLineErr: Label 'danger*The Preference was not found';
    begin
        UserPlans.Reset();
        UserPlans.SetRange("User ID", userID);
        UserPlans.SetRange("No.", planID);
        if UserPlans.FindFirst() then begin
            UserPreferences.Reset();
            UserPreferences.SetRange("Document No.", UserPlans."No.");
            UserPreferences.SetRange("Preference Code", preferenceID);
            if UserPreferences.FindSet() then begin
                UserPreferences.Selected := true;
                if UserPreferences.Modify() then
                    status := SuccMsg
                else
                    status := FailErr
            end else begin
                status := NoLineErr
            end;
        end else begin
            status := NotFoundErr
        end;

        exit(status)
    end;

    procedure fnCreateTenderNotices(docNo: Text; OCID: Text; tenderNo: Text; title: Text; procMethod: Text; procCategory: Text; subMethod: Text; openVenue: Text; pubDate: Date; closeDt: DateTime; TenderFee: Decimal; TenderValidity: Decimal; finYear: Text; prefScheme: Text; pubLink: Text) status: Text
    var
        SuccMsg: Label 'success*Tender Notice inserted successfully.';
        FailErr: Label 'danger*Failed to insert Tender Notice. Please try again.';
    begin
        Tenders.Reset();
        Tenders.SetRange("No.", docNo);
        if Tenders.FindFirst() then begin
            Tenders."No." := docNo;
            Tenders.OCID := OCID;
            Tenders."Tender No." := tenderNo;
            Tenders.Title := title;
            Tenders."Procurement Method" := procMethod;
            Tenders."Procurement Category" := procCategory;
            Tenders."Submission Methods" := subMethod;
            Tenders."Opening Venue" := openVenue;
            Tenders."Published Date" := pubDate;
            Tenders."Close DateTime" := closeDt;
            Tenders."Tender Fee" := TenderFee;
            Tenders."Tender Validity in Days" := TenderValidity;
            Tenders."Financial Year" := finYear;
            Tenders."Preference & Reserve Scheme" := prefScheme;
            Tenders."Public Link" := pubLink;
            if Tenders.Modify() then
                status := SuccMsg
            else
                status := FailErr
        end else begin
            Tenders."No." := docNo;
            Tenders.OCID := OCID;
            Tenders."Tender No." := tenderNo;
            Tenders.Title := title;
            Tenders."Procurement Method" := procMethod;
            Tenders."Procurement Category" := procCategory;
            Tenders."Submission Methods" := subMethod;
            Tenders."Opening Venue" := openVenue;
            Tenders."Published Date" := pubDate;
            Tenders."Close DateTime" := closeDt;
            Tenders."Tender Fee" := TenderFee;
            Tenders."Tender Validity in Days" := TenderValidity;
            Tenders."Financial Year" := finYear;
            Tenders."Preference & Reserve Scheme" := prefScheme;
            Tenders."Public Link" := pubLink;
            if Tenders.Insert(true) then
                status := SuccMsg
            else
                status := FailErr
        end;

        exit(status);
    end;

    procedure fnGeneratePaymentInvoice(UserID: Code[20]; Amount: Decimal) status: Text
    var
        InvGenErr: Label 'danger*Invoice generation failed. Please try again.';
        InvNo: Text;
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", UserID);
        if PortalUsers.FindFirst() then begin
            InvNo := fnCreateProformaInvoice(PortalUsers, Amount);
            if InvNo <> '' then
                status := InvNo
            else
                status := InvGenErr
        end else begin
            status := InvGenErr
        end;

        exit(status);
    end;

    procedure fnUpdatePaymentEntries(UserID: Code[20]; InvoiceNo: Code[20]; TransCode: Code[20]; TransDate: DateTime; Amount: Decimal; Currency: Text; BillDesc: Text; BillRefNo: Text; msisdn: Text; clientName: Text; clientEmail: Text/* ; clientIdNo: Text */) Status: Text
    var
        SuccMsg: Label 'success*Payment was successful.';
        ErrMsg: Label 'danger*Payment failed.';
        NotFoundErr: Label 'danger*Invoice not found.';
        SInv: Record "Sales Header";
    begin
        SInv.Reset();
        SInv.SetRange("No.", InvoiceNo);
        SInv.SetRange("Sell-to Customer No.", UserID);
        if SInv.FindFirst() then begin
            // Payments.Init();
            // Payments."Transaction Code" := TransCode;
            // Payments.Validate("Transaction Code");
            // Payments."Transaction Date" := TransDate;
            // Payments.Amount := Amount;
            // Payments."Invoice No." := InvoiceNo;
            // Payments."Document Date" := CurrentDateTime;
            // Payments."Payment Type" := 2;
            // Payments."User ID" := UserID;
            // if Payments.Insert(true) then begin
            AlertTransEntries.Init();
            AlertTransEntries."Transaction Code" := TransCode;
            AlertTransEntries.Validate("Transaction Code");
            AlertTransEntries."User ID" := UserID;
            AlertTransEntries."Bill Description" := BillDesc;
            AlertTransEntries."Bill Ref No." := BillRefNo;
            AlertTransEntries."Client E-Mail" := clientEmail;
            // AlertTransEntries."Client ID No." := clientIdNo;
            AlertTransEntries."Client MSISDN" := msisdn;
            AlertTransEntries."Client Name" := clientName;
            AlertTransEntries.Currency := Currency;
            AlertTransEntries."Invoice No." := SInv."No.";
            AlertTransEntries.Amount := amount;
            AlertTransEntries."Transaction Type" := AlertTransEntries."Transaction Type"::Credit;
            // AlertTransEntries.Status := AlertTransEntries.Status::Pending;
            if AlertTransEntries.Insert(true) then begin
                // exit(true);
                status := SuccMsg
            end else begin
                status := ErrMsg
            end;
        end else begin
            status := NotFoundErr
        end;

        exit(Status);
    end;

    procedure fnCreateUserAsCustomer(var User: Record "Tender Alert Portal Users"): Boolean
    var
        Cust: Record Customer;
    begin
        AlertSetup.Get();

        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", User."User ID");
        if PortalUsers.FindFirst() then begin
            Cust.Reset();
            Cust.SetRange("No.", PortalUsers."User ID");
            if Cust.FindFirst() then begin
                Cust."No." := PortalUsers."User ID";
                Cust.Name := PortalUsers."User Name";
                Cust."Customer Type" := Cust."Customer Type"::"Tender Alert";
                Cust."Phone No." := PortalUsers."Phone No.";
                Cust."E-Mail" := PortalUsers."E-Mail";
                Cust."Gen. Bus. Posting Group" := AlertSetup."Gen. Bus. Posting Group";
                Cust."Customer Posting Group" := AlertSetup."Customer Posting Group";
                if Cust.Modify(true) then
                    exit(true)
            end else begin
                Cust.Init();
                Cust."No." := PortalUsers."User ID";
                Cust.Name := PortalUsers."User Name";
                Cust."Customer Type" := Cust."Customer Type"::"Tender Alert";
                Cust."Phone No." := PortalUsers."Phone No.";
                Cust."E-Mail" := PortalUsers."E-Mail";
                Cust."Gen. Bus. Posting Group" := AlertSetup."Gen. Bus. Posting Group";
                Cust."Customer Posting Group" := AlertSetup."Customer Posting Group";
                if Cust.Insert(true) then
                    exit(true)
            end;
        end;
    end;

    procedure fnCreateProformaInvoice(var AlertPortUsers: Record "Tender Alert Portal Users"; Amount: Decimal) InvoiceNo: Text
    var
        SalesHead: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Cust: Record Customer;
        Item: Record Item;
    begin
        AlertSetup.Get();

        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", AlertPortUsers."User ID");
        if PortalUsers.FindFirst() then
            fnCreateUserAsCustomer(PortalUsers);

        Cust.Reset();
        Cust.SetRange("No.", PortalUsers."User ID");
        if Cust.FindFirst() then begin
            SalesHead.Init();
            SalesHead."No." := '';
            SalesHead."Document Type" := SalesHead."Document Type"::Order;
            SalesHead.Validate("Sell-to Customer Name", Cust.Name);
            SalesHead."Sell-to Phone No." := cust."Phone No.";
            SalesHead."Sell-to E-Mail" := Cust."E-Mail";
            // SalesHead."Sell-to Customer No." := Cust."No.";
            // SalesHead.Validate("Sell-to Customer No.");
            // SalesHead."Bill-to Customer No." := Cust."No.";
            // SalesHead.Validate("Bill-to Customer No.");
            if SalesHead.Insert(true) then begin
                SalesLine.Init();
                SalesLine."Document No." := SalesHead."No.";
                // SalesLine.Validate("Document No.");
                SalesLine."Document Type" := SalesHead."Document Type";
                // SalesLine.Validate("Document Type");
                SalesLine.Type := SalesLine.Type::Item;
                SalesLine.Validate(Type);
                SalesLine."No." := AlertSetup."Item No.";
                SalesLine.Validate("No.");
                SalesLine.Quantity := 1;
                SalesLine.Validate(Quantity);
                SalesLine."Unit Price" := Amount;
                SalesLine.Validate("Unit Price");
                SalesLine."Line No." := 1000;
                if SalesLine.Insert(true) then
                    InvoiceNo := SalesHead."No."
            end;
        end;

        exit(InvoiceNo);
    end;

    procedure fnCreateSalesInvoice(var AlertPortUsers: Record "Tender Alert Portal Users"; Amount: Decimal) InvoiceNo: Text
    var
        SalesHead: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Cust: Record Customer;
        Item: Record Item;
    begin
        AlertSetup.Get();

        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", AlertPortUsers."User ID");
        if PortalUsers.FindFirst() then
            fnCreateUserAsCustomer(PortalUsers);

        Cust.Reset();
        Cust.SetRange("No.", PortalUsers."User ID");
        if Cust.FindFirst() then begin
            // SalesHead.Reset();
            // SalesHead.SetRange("Bill-to Customer No.", Cust."No.");
            // SalesHead.SetRange("Sell-to Customer No.", Cust."No.");
            // SalesHead.SetRange("Document Type", SalesHead."Document Type"::Invoice);
            // if SalesHead.FindSet() then begin
            //     InvoiceNo := SalesHead."No.";
            // end else begin
            SalesHead.Init();
            SalesHead."No." := '';
            SalesHead."Document Type" := SalesHead."Document Type"::Invoice;
            SalesHead.Validate("Sell-to Customer Name", Cust.Name);
            SalesHead."Sell-to Phone No." := cust."Phone No.";
            SalesHead."Sell-to E-Mail" := Cust."E-Mail";
            // SalesHead."Sell-to Customer No." := Cust."No.";
            // SalesHead.Validate("Sell-to Customer No.");
            // SalesHead."Bill-to Customer No." := Cust."No.";
            // SalesHead.Validate("Bill-to Customer No.");
            if SalesHead.Insert(true) then begin
                SalesLine.Init();
                SalesLine."Document No." := SalesHead."No.";
                // SalesLine.Validate("Document No.");
                SalesLine."Document Type" := SalesHead."Document Type";
                // SalesLine.Validate("Document Type");
                SalesLine.Type := SalesLine.Type::Item;
                SalesLine.Validate(Type);
                SalesLine."No." := AlertSetup."Item No.";
                SalesLine.Validate("No.");
                SalesLine.Quantity := 1;
                SalesLine.Validate(Quantity);
                SalesLine."Unit Price" := Amount;
                SalesLine.Validate("Unit Price");
                SalesLine."Line No." := 1000;
                if SalesLine.Insert(true) then
                    InvoiceNo := SalesHead."No."
                // end else begin

                // end;
            end;
        end else begin

        end;

        exit(InvoiceNo);
    end;

    procedure fnQueueUserAlerts(TenderNo: Code[50]; UserID: Code[20]; Type: Integer; TenderDescription: Text; TenderCloseDate: DateTime; TenderPubDate: DateTime; planID: Code[20]): Boolean
    var
        Balance: Decimal;
        Cost: Decimal;
        AllowQueue: Boolean;
    begin
        UserPlans.Reset();
        UserPlans.SetRange("No.", planID);
        if UserPlans.FindFirst() then begin
            Subscriptions.Reset();
            Subscriptions.SetRange("No.", UserPlans."Subscription ID");
            if Subscriptions.FindFirst() then begin
                if Subscriptions."Subscription Type" = Subscriptions."Subscription Type"::Premium then begin
                    Balance := fnGetUserAccountBalance(Alerts."User ID");
                    Cost := fnGetCost(Alerts);
                    if Balance >= Cost then begin
                        AllowQueue := true;
                    end;
                end else if Subscriptions."Subscription Type" = Subscriptions."Subscription Type"::"Free Trial" then begin
                    if UserPlans."Expiry Date" > Today then begin
                        AllowQueue := true;
                    end;
                end;
            end;
        end;

        if AllowQueue then begin
            Alerts.Reset();
            Alerts.SetRange("No.", TenderNo);
            Alerts.SetRange("User ID", UserID);
            Alerts.SetRange("Alert Type", Type);
            if not Alerts.FindSet() then begin
                Alerts.Init();
                Alerts."No." := TenderNo;
                Alerts."User ID" := UserID;
                Alerts.Validate("User ID");
                Alerts."Sent Content" := fnCreateAlertContent(TenderNo, TenderDescription, TenderCloseDate, TenderPubDate);
                Alerts."Alert Type" := Type;
                Alerts."Document Date" := Today;
                Alerts.Status := Alerts.Status::Queued;
                Alerts."Plan ID" := planID;
                if Alerts.Insert() then
                    exit(true)
            end;
        end;
    end;

    procedure fnCreateAlertContent(TenderNo: Code[50]; TenderDescription: Text; TenderCloseDate: DateTime; TenderPubDate: DateTime) Content: Text
    var

    begin
        Content += '<BR><BR>This is a formal notification regarding the tender opportunity for <B>' + TenderDescription + '</B>, identified by Tender Number: <B>' + TenderNo + '</B>. The details of the tender and its requirements are as follows:';
        Content += '<BR><BR><B>No:</B> ' + TenderNo;
        Content += '<BR><B>Description:</B> ' + TenderDescription;
        Content += '<BR><B>Publish Date:</B> ' + format(TenderPubDate);
        Content += '<BR><B>Closing Date:</B> ' + format(TenderCloseDate);
        Content += '<BR><BR>Please refer to the following link for full specifications, requirements, and instructions on how to submit your bid. As always, we encourage you to submit your proposal before the deadline to ensure it is considered.';

        exit(Content);
    end;

    procedure fnSendTenderAlerts(): Boolean
    var
        Balance: Decimal;
        Cost: Decimal;
    begin
        Alerts.Reset();
        Alerts.SetRange(Status, Alerts.Status::Queued);
        if Alerts.FindSet() then begin
            repeat
                UserPlans.Reset();
                UserPlans.SetRange("No.", Alerts."Plan ID");
                if UserPlans.FindFirst() then begin
                    Subscriptions.Reset();
                    Subscriptions.SetRange("No.", UserPlans."Subscription ID");
                    if Subscriptions.FindFirst() then begin
                        if Subscriptions."Subscription Type" = Subscriptions."Subscription Type"::Premium then begin
                            Balance := fnGetUserAccountBalance(Alerts."User ID");
                            Cost := fnGetCost(Alerts);
                            if Balance >= Cost then begin
                                if fnSendAlert(Alerts) then begin
                                    Alerts.Status := Alerts.Status::Sent;
                                    Alerts."Date Received" := CurrentDateTime;
                                    if Alerts.Modify(true) then
                                        if fnInvoiceAlertSent(Alerts) then
                                            exit(true);
                                end;
                            end;
                        end else if Subscriptions."Subscription Type" = Subscriptions."Subscription Type"::"Free Trial" then begin
                            if UserPlans."Expiry Date" > Today then begin
                                if fnSendAlert(Alerts) then begin
                                    Alerts.Status := Alerts.Status::Sent;
                                    Alerts."Date Received" := CurrentDateTime;
                                    if Alerts.Modify(true) then
                                        exit(true);
                                end;
                            end;
                        end;
                    end;
                end;
            until Alerts.Next() = 0;
        end;
    end;

    procedure fnSendAlert(var TAlerts: Record "Received Alerts"): Boolean
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
    begin
        CompInfo.Get();

        if TAlerts."Alert Type" = TAlerts."Alert Type"::"E-Mail" then begin
            EmailSubject := 'Tender Alert: ' + TAlerts."No.";

            TAlerts.TestField("E-Mail");
            EmailRecepient.Add(TAlerts."E-Mail");

            EmailBody += TAlerts."Sent Content";
            EmailBody += '<BR><BR>Regards,';
            EmailBody += '<BR><BR>' + CompInfo.Name;

            EmailMessage.Create(
                EmailRecepient,
                EmailSubject,
                EmailBody,
                true
            );

            if Email.Send(EmailMessage) then
                exit(true);

        end else if TAlerts."Alert Type" = TAlerts."Alert Type"::SMS then begin

        end;
    end;

    procedure fnInvoiceAlertSent(var TAlerts: Record "Received Alerts"): Boolean
    var
        Amount: Decimal;
    begin

        Amount := fnGetCost(TAlerts);

        if TAlerts.Status = TAlerts.Status::Sent then begin
            PortalUsers.Reset();
            PortalUsers.SetRange("User ID", TAlerts."User ID");
            if PortalUsers.FindFirst() then begin
                if fnDeductWallet(PortalUsers."User ID", TAlerts."No.", Amount) then
                    exit(true);
            end;
        end;
    end;

    procedure fnDeductWallet(UserID: Code[20]; AlertNo: Code[20]; Amount: Decimal): Boolean
    var

    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", UserID);
        if PortalUsers.FindFirst() then begin
            AlertTransEntries.Init();
            AlertTransEntries."User ID" := UserID;
            AlertTransEntries."Invoice No." := fnCreateSalesInvoice(PortalUsers, Amount);
            AlertTransEntries.Amount := -Amount;
            AlertTransEntries."Transaction Type" := AlertTransEntries."Transaction Type"::Debit;
            AlertTransEntries."Alert No." := AlertNo;
            if AlertTransEntries.Insert(true) then begin
                Payments.Init();
                Payments."Transaction Code" := AlertTransEntries."Invoice No.";
                Payments.Validate("Transaction Code");
                Payments."Transaction Date" := CurrentDateTime;
                Payments.Amount := Amount;
                Payments."Invoice No." := AlertTransEntries."Invoice No.";
                Payments."Document Date" := CurrentDateTime;
                Payments."Payment Type" := 2;
                Payments."User ID" := UserID;
                if Payments.Insert(true) then begin
                    exit(true);
                end;
            end;
        end;
    end;

    procedure fnGetCost(var TAlerts: Record "Received Alerts") Cost: Decimal
    begin
        AlertSetup.Get();
        AlertSetup.TestField("SMS Cost");
        AlertSetup.TestField("E-Mail Cost");

        if TAlerts."Alert Type" = TAlerts."Alert Type"::SMS then
            Cost := AlertSetup."SMS Cost"
        else if TAlerts."Alert Type" = TAlerts."Alert Type"::"E-Mail" then
            Cost := AlertSetup."E-Mail Cost";

        exit(Cost);
    end;

    procedure fnUpdateExpiredUserSubscriptions()
    begin
        UserPlans.Reset();
        UserPlans.SetFilter("Expiry Date", '<=%1', Today);
        UserPlans.SetRange(Status, UserPlans.Status::Active);
        if UserPlans.FindSet() then begin
            repeat
                UserPlans.Status := UserPlans.Status::Expired;
                UserPlans.Modify();
            until UserPlans.Next() = 0;
        end;
    end;
}
