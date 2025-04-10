codeunit 96000 "Licensing Portal"
{
    trigger OnRun()
    begin
        fnNotifyLicenceExpiry();
        fnUpdateLicenceExpiry();
    end;

    var
        PCategories: Record "Licence Practice Categories";
        RegPCategories: Record "Licence Reg. Pract. Categories";
        EducationInfo: Record "Licence Reg. Education Info";
        Membership: Record "Professional Inst. Membership";
        EmpHist: Record "Licence Reg. Employment Hist";
        Agencies: Record "Licence Reg. Practice Agencies";
        Prof: Record "Licence Reg Proc Professionals";
        Referees: Record "Licence Restoration Referees";
        PortalUsers: Record "Licensing Portal Users";
        NoSeries: Codeunit "No. Series";
        LicenceSetup: Record "Licensing Setup";
        LicenceRegForm: Record "Licence Registration Form";
        CompInfo: Record "Company Information";
        CryptoMgmt: Codeunit "Cryptography Management";
        Licence: Record Licences;
        OTPSender: Codeunit "OTP Sender";
        OTP: Record OTP;
        CtgLines: Record "Licence Category Lines";
        Payments: Record "E-Citizen Payment Entries";

    procedure fnRegistration(fName: Text; lName: Text; idNo: Text; email: Text; phone: Text; password: Text) status: Text
    var
        PassConfirmErr: Label 'danger*The Passwords do not match!';
        IDExistsErr: Label 'found*The ID Number provided already exists!';
        EmailExistsErr: Label 'found*The Email provided already exists!';
        PhoneExistsErr: Label 'found*The Phone Number provided already exists!';
        // RegSuccessMsg: Label 'success*Account Registration was successfull. Please enter the code sent to your email for account activation!';
        RegSuccessMsg: Label 'success*Account Registration was successfull.';
        RegFailErr: Label 'danger*Unable to create Account at this time. Please ensure your details are correct and try again. If this error persists please contact us for help!';
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("ID Number", idNo);
        if PortalUsers.FindFirst() then begin
            status := IDExistsErr;
            exit(status);
        end;

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
        PortalUsers."First Name" := fName;
        PortalUsers."Last Name" := lName;
        PortalUsers.Validate("ID Number", idNo);
        PortalUsers.Validate("E-Mail", email);
        PortalUsers.Validate("Phone No.", phone);
        PortalUsers.Password := CryptoMgmt.GenerateHash(password, 4);
        if PortalUsers.Insert(true) then begin
            // if sendVerificationEmail(PortalUsers) then
            //     status := RegSuccessMsg
            // else
            //     status := RegFailErr;
            if sendAccountRegistrationSuccessEmail(PortalUsers) then
                status := RegSuccessMsg
            else
                status := RegFailErr;
        end else begin
            status := RegFailErr;
        end;

        exit(status);
    end;

    procedure sendAccountRegistrationSuccessEmail(User: Record "Licensing Portal Users"): Boolean
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


        EmailBody := 'Hello ' + User."First Name" + ',';
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

    procedure sendVerificationEmail(User: Record "Licensing Portal Users"): Boolean
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
        OTPCode := fnGenerateOTP();

        RecRef.GetTable(User);

        if fnStoreOTP(User."User ID", User."E-Mail", User."Phone No.", User."User ID", OTPCode, OTP."OTP Type"::Registration, RecRef.Number) then begin

            EmailBody := 'Hello ' + User."First Name" + ',';
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

    procedure fnRequestEmailVerificationOTP(userID: Code[20]) status: Text
    var
        NotFoundErr: Label 'danger*User not found.';
        SuccMsg: Label 'success*Verification Email sent successfully.';
        FailErr: Label 'danger*Email not send. Please try again.';
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", userID);
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

    procedure fnLogin(email: Text; passKey: Text): Boolean
    var
        EmailReqErr: Label 'danger*The email field is required.';
        PassReqErr: Label 'danger*The password field is required.';
        LoginSuccMsg: Label 'success*User logged in successfully.';
        FailErr: Label 'danger*Login failed. Please try again.';
        InvalidErr: Label 'danger*You have entered wrong credentials. Please check and try again.';
        UnVerEmailErr: Label 'danger*Your email has not been verified. Please verify in order to activate your account.';
    begin

        // if email = '' then begin
        //     status += EmailReqErr;

        //     if passKey = '' then
        //         status += PassReqErr;

        //     exit(status);
        // end else if passKey = '' then begin
        //     status := PassReqErr;
        //     exit(status);
        // end;

        PortalUsers.Reset();
        PortalUsers.SetRange("E-Mail", email);
        PortalUsers.SetRange(Password, CryptoMgmt.GenerateHash(passKey, 4));
        if PortalUsers.FindFirst() then begin
            // if fnCheckEmailVerified(PortalUsers) = true then begin
            //     status := LoginSuccMsg;
            // end else begin
            //     status := UnVerEmailErr;
            // end;
            // if fnSendLoginOTP(PortalUsers) = true then begin
            //     status := LoginSuccMsg;
            // end else begin
            //     status := FailErr;
            // end;
            // status := LoginSuccMsg;
            exit(true)
        end else begin
            PortalUsers.Reset();
            PortalUsers.SetRange("ID Number", email);
            PortalUsers.SetRange(Password, CryptoMgmt.GenerateHash(passKey, 4));
            if PortalUsers.FindFirst() then begin
                exit(true)
                // if fnCheckEmailVerified(PortalUsers) = true then begin
                //     status := LoginSuccMsg;
                // end else begin
                //     status := UnVerEmailErr;
                // end;
                //     if fnSendLoginOTP(PortalUsers) = true then begin
                //         status := LoginSuccMsg;
                //     end else begin
                //         status := FailErr;
                //     end;
                //     status := LoginSuccMsg;
                // end else begin
                //     status := InvalidErr;
            end;
        end;

        // exit(status);
    end;

    procedure fnRequestLoginOTP(email: Text): Boolean
    var
        // NotFoundErr: Label 'danger*User not found.';
        // SuccMsg: Label 'success*OTP sent successfully.';
        // FailErr: Label 'danger*OTP not send. Please try again.';
        CurrUserID: Code[20];
    begin

        CurrUserID := fnGetUserID(email);

        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", CurrUserID);
        if PortalUsers.FindFirst() then begin
            if fnSendLoginOTP(PortalUsers) then
                exit(true)
            //     else
            //         status := FailErr
            // end else begin
            //     status := NotFoundErr;
        end;

        // exit(status);
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

    procedure fnSendLoginOTP(var User: Record "Licensing Portal Users"): Boolean
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
        EmailSubject := 'PPRA Licensing Portal Login OTP';

        User.TestField("E-Mail");
        EmailRecepient.Add(User."E-Mail");

        Clear(OTPCode);
        OTPCode := fnGenerateOTP();

        RecRef.GetTable(User);

        if fnStoreOTP(User."User ID", User."E-Mail", User."Phone No.", User."User ID", OTPCode, OTP."OTP Type"::Login, RecRef.Number) then begin

            EmailBody := 'Hello ' + User."First Name" + ',';
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

    procedure fnVerifyLoginOTP(email: Text; otpCode: Text[10]): Boolean
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
                            // status := ExpiredErr;
                        end else begin
                            OTP.Used := true;
                            if OTP.Modify() then
                                exit(true)
                            //     status := SuccMsg
                            // else
                            //     status := OTPFailErr
                        end;
                    end else begin
                        // status := OTPFailErr;
                    end;
                end else begin
                    // status := OTPFailErr;
                end;
            end else begin
                // status := OTPFailErr;
            end;
        end else begin
            // status := OTPFailErr
        end;

        // exit(status);
    end;

    procedure fnGenerateOTP() OTPCode: Text
    begin
        OTPCode := OTPSender.GenerateRandomOTPCode(6);
        exit(OTPCode);
    end;

    procedure fnStoreOTP(userID: Code[20]; email: Text; phone: Text; DocumentNo: Code[20]; otpCode: Code[10]; otpType: Option; tableID: Integer): Boolean
    var
        ExpirationTime: DateTime;
        lapseTime: Duration;
        NextEntryNo: Integer;
        ErrMsg: Label 'OTP was unable to insert.';
    begin
        lapseTime := 150000;
        ExpirationTime := CurrentDateTime + lapseTime;

        OTP.Reset();
        if OTP.FindLast() then
            NextEntryNo := OTP."Entry No" + 1
        else
            NextEntryNo := 0;

        OTP.Init();
        OTP."Entry No" := NextEntryNo;
        OTP."User ID" := userID;
        OTP."OTP Code" := otpCode;
        OTP."Creation Time" := CurrentDateTime;
        OTP."Expiration Time" := ExpirationTime;
        OTP."Phone Number" := phone;
        OTP."Document No" := DocumentNo;
        OTP."OTP Type" := otpType;
        OTP."E-Mail" := email;
        OTP."Table ID" := tableID;
        if OTPSender.InsertOTPRecord(OTP) then
            exit(true)
    end;

    procedure fnCheckEmailVerified(var User: Record "Licensing Portal Users"): Boolean
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("E-Mail", User."E-Mail");
        if PortalUsers.FindFirst() then begin
            if PortalUsers."Email Verified" = true then
                exit(true)
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
                EmailBody := 'Hello ' + PortalUsers."First Name" + ',';
                EmailBody += '<BR><BR>Your password has been reset successfully. Kindly login to the Licensing Portal using the credentials below and change your password.';
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

    procedure fnUpdateUserProfile(userId: Code[20]; fName: Text; lName: Text; nationality: Text; town: Text; street: Text; building: Text; postalAddress: Text; postalCode: Text) status: Text
    var
        NotFoundErr: Label 'danger*The document could not be found.';
        ErrMsg: Label 'danger*User Profile could not be updated. Please try again!';
        SuccessMsg: Label 'success*User Profile was updated successfully.';
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", userId);
        if PortalUsers.FindFirst() then begin
            PortalUsers."First Name" := fName;
            PortalUsers."Last Name" := lName;
            PortalUsers.Nationality := nationality;
            PortalUsers.Town := town;
            PortalUsers.Street := street;
            PortalUsers.Building := building;
            PortalUsers."Postal Address" := postalAddress;
            PortalUsers."Postal Code" := postalCode;
            if PortalUsers.Modify(true) then
                if fnUpdateUserPracticeCategories(PortalUsers) then
                    status := SuccessMsg
                else
                    status := ErrMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnUpdateUserAgreement(userId: Code[20]; competent: Boolean; notCorrupt: Boolean; noInducements: Boolean; noCorrosivePrac: Boolean; allAbove: Boolean; understand: Boolean; abide: Boolean; nonGovernment: Boolean) status: Text
    var
        NotFoundErr: Label 'danger*The document could not be found.';
        ErrMsg: Label 'danger*User Profile could not be updated. Please try again!';
        SuccessMsg: Label 'success*User Profile was updated successfully.';
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", userId);
        if PortalUsers.FindFirst() then begin
            PortalUsers."Competency Agreement" := competent;
            PortalUsers."Not Corrupt" := notCorrupt;
            PortalUsers."Not Offer Inducements" := noInducements;
            PortalUsers."Not Engaged in Corrosive Prac" := noCorrosivePrac;
            PortalUsers."All Above is True" := allAbove;
            PortalUsers."Fully Read and Understood" := understand;
            PortalUsers."Commit to Abide" := abide;
            PortalUsers."Not Working for Govt" := nonGovernment;
            if PortalUsers.Modify(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnUpdateUserBankruptcyOrConviction(userId: Code[20]; bankrupt: Boolean; bankruptReason: Text) status: Text
    var
        NotFoundErr: Label 'danger*The document could not be found.';
        ErrMsg: Label 'danger*User Profile could not be updated. Please try again!';
        SuccessMsg: Label 'success*User Profile was updated successfully.';
        BankruptReasonErr: Label 'danger*The bankruptcy or convictions details field is required.';
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", userId);
        if PortalUsers.FindFirst() then begin
            PortalUsers."Has Bankruptcy/Conviction" := bankrupt;
            PortalUsers."Bankruptcy/Conviction Details" := bankruptReason;
            if PortalUsers."Has Bankruptcy/Conviction" = true then begin
                if PortalUsers."Bankruptcy/Conviction Details" = '' then begin
                    status := BankruptReasonErr;
                    exit(status);
                end;
            end else begin
                PortalUsers."Bankruptcy/Conviction Details" := '';
            end;
            if PortalUsers.Modify(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnUpdateUserOtherPractices(userId: Code[20]; otherPractices: Boolean) status: Text
    var
        NotFoundErr: Label 'danger*The document could not be found.';
        ErrMsg: Label 'danger*User Profile could not be updated. Please try again!';
        SuccessMsg: Label 'success*User Profile was updated successfully.';
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", userId);
        if PortalUsers.FindFirst() then begin
            PortalUsers."Has Other Prof. Practices" := otherPractices;
            if PortalUsers.Modify(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnUpdateUserEmploymentHist(userId: Code[20]; workExperience: Boolean) status: Text
    var
        NotFoundErr: Label 'danger*The document could not be found.';
        ErrMsg: Label 'danger*User Profile could not be updated. Please try again!';
        SuccessMsg: Label 'success*User Profile was updated successfully.';
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", userId);
        if PortalUsers.FindFirst() then begin
            PortalUsers."Has Work Experience" := workExperience;
            if PortalUsers.Modify(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnUpdateUserSelfEmployed(userId: Code[20]; selfEmployed: Boolean) status: Text
    var
        NotFoundErr: Label 'danger*The document could not be found.';
        ErrMsg: Label 'danger*User Profile could not be updated. Please try again!';
        SuccessMsg: Label 'success*User Profile was updated successfully.';
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", userId);
        if PortalUsers.FindFirst() then begin
            PortalUsers."Self Employed" := selfEmployed;
            if PortalUsers.Modify(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnUpdateUserMembership(userId: Code[20]; instMember: Boolean) status: Text
    var
        NotFoundErr: Label 'danger*The document could not be found.';
        ErrMsg: Label 'danger*User Profile could not be updated. Please try again!';
        SuccessMsg: Label 'success*User Profile was updated successfully.';
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", userId);
        if PortalUsers.FindFirst() then begin
            PortalUsers."Prof. Institutions Member" := instMember;
            if PortalUsers.Modify(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnSelectPracticeCatgeories(userId: Code[20]; categoryCode: Code[50]; selected: Boolean) status: Text
    var
        NotFoundErr: Label 'danger*The document selected could not be found.';
        ErrMsg: Label 'danger*Practice Category could not be selected. Please try again!';
        SuccessMsg: Label 'success*Practice Category selected successfully.';
    begin
        RegPCategories.Reset();
        RegPCategories.SetRange("Document No.", userId);
        RegPCategories.SetRange("Practice Category Code", categoryCode);
        if RegPCategories.FindFirst() then begin
            RegPCategories.Selected := selected;
            if RegPCategories.Modify(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnInsertEducationInfo(userId: Code[20]; educationLevel: Integer; qualification: Integer; institution: Text; course: Text; otherEducation: Text; otherQualification: Text) status: Text
    var
        ErrMsg: Label 'danger*Educational Information could not be inserted. Please try again!';
        SuccessMsg: Label 'success*Educational Information was inserted successfully.';
    begin
        EducationInfo.Init();
        EducationInfo."Document No." := userId;
        EducationInfo."Education Level" := educationLevel;
        EducationInfo.Qualification := qualification;
        EducationInfo.Institution := institution;
        EducationInfo.Course := course;
        EducationInfo."Other Education Level" := otherEducation;
        EducationInfo."Other Qualification" := otherQualification;
        if EducationInfo.Insert(true) then
            status := SuccessMsg
        else
            status := ErrMsg;

        exit(status);
    end;

    procedure fnUpdateEducationInfo(userId: Code[20]; lineNo: Integer; educationLevel: Integer; qualification: Integer; institution: Text; course: Text; otherEducation: Text; otherQualification: Text) status: Text
    var
        ErrMsg: Label 'danger*Educational Information could not be updated. Please try again!';
        SuccessMsg: Label 'success*Educational Information was updated successfully.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
    begin
        EducationInfo.Reset();
        EducationInfo.SetRange("Document No.", userId);
        EducationInfo.SetRange("Line No.", lineNo);
        if EducationInfo.FindSet() then begin
            EducationInfo."Education Level" := educationLevel;
            EducationInfo.Qualification := qualification;
            EducationInfo.Institution := institution;
            EducationInfo.Course := course;
            EducationInfo."Other Education Level" := otherEducation;
            EducationInfo."Other Qualification" := otherQualification;
            if EducationInfo.Modify(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnRemoveEducationInfo(userId: Code[20]; lineNo: Integer) status: Text
    var
        ErrMsg: Label 'danger*Educational Information could not be deleted. Please try again!';
        SuccessMsg: Label 'success*Educational Information was deleted successfully.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
    begin
        EducationInfo.Reset();
        EducationInfo.SetRange("Document No.", userId);
        EducationInfo.SetRange("Line No.", lineNo);
        if EducationInfo.FindSet() then begin
            if EducationInfo.Delete(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnInsertMembershipSummary(userId: Code[20]; memberName: Text; memberNo: Code[50]; regDate: Date; licenceNo: Code[50]; annualLicenceDate: Date) status: Text
    var
        ErrMsg: Label 'danger*Membership Information could not be inserted. Please try again!';
        SuccessMsg: Label 'success*Membership Information was inserted successfully.';
    begin
        Membership.Init();
        Membership."Document No." := userId;
        Membership."Membership Name" := memberName;
        Membership."Membership Number" := memberNo;
        Membership."Registration Date" := regDate;
        Membership."Licence Number" := licenceNo;
        Membership."Annual Licence Date" := annualLicenceDate;
        if Membership.Insert(true) then
            status := SuccessMsg
        else
            status := ErrMsg;

        exit(status);
    end;

    procedure fnUpdateMembershipSummary(userId: Code[20]; lineNo: Integer; memberName: Text; memberNo: Code[50]; regDate: Date; licenceNo: Code[50]; annualLicenceDate: Date) status: Text
    var
        ErrMsg: Label 'danger*Membership Information could not be updated. Please try again!';
        SuccessMsg: Label 'success*Membership Information was updated successfully.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
    begin
        Membership.Reset();
        Membership.SetRange("Document No.", userId);
        Membership.SetRange("Line No.", lineNo);
        if Membership.FindSet() then begin
            Membership."Membership Name" := memberName;
            Membership."Membership Number" := memberNo;
            Membership."Registration Date" := regDate;
            Membership."Licence Number" := licenceNo;
            Membership."Annual Licence Date" := annualLicenceDate;
            if Membership.Modify(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnRemoveMembershipSummary(userId: Code[20]; lineNo: Integer) status: Text
    var
        ErrMsg: Label 'danger*Membership Information could not be deleted. Please try again!';
        SuccessMsg: Label 'success*Membership Information was deleted successfully.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
    begin
        Membership.Reset();
        Membership.SetRange("Document No.", userId);
        Membership.SetRange("Line No.", lineNo);
        if Membership.FindSet() then begin
            if Membership.Delete(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnInsertEmploymentHist(userId: Code[20]; employer: Text; designation: Text; startDate: Date; endDate: Date; currently: Boolean; empType: Integer) status: Text
    var
        ErrMsg: Label 'danger*Employment Information could not be inserted. Please try again!';
        SuccessMsg: Label 'success*Employment Information was inserted successfully.';
    begin
        EmpHist.Init();
        EmpHist."Document No." := userId;
        EmpHist.Employer := employer;
        EmpHist.Designation := designation;
        EmpHist."Start Date" := startDate;
        EmpHist."End Date" := endDate;
        EmpHist."Currently Work Here" := currently;
        EmpHist."Employment Type" := empType;
        if EmpHist.Insert(true) then
            status := SuccessMsg
        else
            status := ErrMsg;

        exit(status);
    end;

    procedure fnUpdateEmploymentHist(userId: Code[20]; lineNo: Integer; employer: Text; designation: Text; startDate: Date; endDate: Date; currently: Boolean; empType: Integer) status: Text
    var
        ErrMsg: Label 'danger*Employment Information could not be updated. Please try again!';
        SuccessMsg: Label 'success*Employment Information was updated successfully.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
    begin
        EmpHist.Reset();
        EmpHist.SetRange("Document No.", userId);
        EmpHist.SetRange("Line No.", lineNo);
        if EmpHist.FindSet() then begin
            EmpHist.Employer := employer;
            EmpHist.Designation := designation;
            EmpHist."Start Date" := startDate;
            EmpHist."End Date" := endDate;
            EmpHist."Currently Work Here" := currently;
            EmpHist."Employment Type" := empType;
            if EmpHist.Modify(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr
        end;

        exit(status);
    end;

    procedure fnRemoveEmploymentHist(userId: Code[20]; lineNo: Integer) status: Text
    var
        ErrMsg: Label 'danger*Employment Information could not be deleted. Please try again!';
        SuccessMsg: Label 'success*Employment Information was deleted successfully.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
    begin
        EmpHist.Reset();
        EmpHist.SetRange("Document No.", userId);
        EmpHist.SetRange("Line No.", lineNo);
        if EmpHist.FindSet() then begin
            if EmpHist.Delete(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr
        end;

        exit(status);
    end;

    procedure fnInsertAgencies(userId: Code[20]; agencyName: Text; firmNo: Code[50]; designation: Text; agencyRegNo: Code[50]; firmLicenceNo: Code[50]; firmAnnualLicNo: Code[50]) status: Text
    var
        ErrMsg: Label 'danger*Agency Information could not be inserted. Please try again!';
        SuccessMsg: Label 'success*Agency Information was inserted successfully.';
    begin
        Agencies.Init();
        Agencies."Document No." := userId;
        Agencies."Agency Name" := agencyName;
        Agencies."Firm No." := firmNo;
        Agencies.Designation := designation;
        Agencies."Agency Registration No." := agencyRegNo;
        Agencies."Firm Licence No." := firmLicenceNo;
        Agencies."Firm Annual Licence No." := firmAnnualLicNo;
        if Agencies.Insert(true) then
            status := SuccessMsg
        else
            status := ErrMsg;

        exit(status);
    end;

    procedure fnUpdateAgencies(userId: Code[20]; lineNo: Integer; agencyName: Text; firmNo: Code[50]; designation: Text; agencyRegNo: Code[50]; firmLicenceNo: Code[50]; firmAnnualLicNo: Code[50]) status: Text
    var
        ErrMsg: Label 'danger*Agency Information could not be updated. Please try again!';
        SuccessMsg: Label 'success*Agency Information was updated successfully.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
    begin
        Agencies.Reset();
        Agencies.SetRange("Document No.", userId);
        Agencies.SetRange("Line No.", lineNo);
        if Agencies.FindSet() then begin
            Agencies."Agency Name" := agencyName;
            Agencies."Firm No." := firmNo;
            Agencies.Designation := designation;
            Agencies."Agency Registration No." := agencyRegNo;
            Agencies."Firm Licence No." := firmLicenceNo;
            Agencies."Firm Annual Licence No." := firmAnnualLicNo;
            if Agencies.Modify(true) then
                status := SuccessMsg
            else
                status := ErrMsg;

        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnRemoveAgencies(userId: Code[20]; lineNo: Integer) status: Text
    var
        ErrMsg: Label 'danger*Agency Information could not be deleted. Please try again!';
        SuccessMsg: Label 'success*Agency Information was deleted successfully.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
    begin
        Agencies.Reset();
        Agencies.SetRange("Document No.", userId);
        Agencies.SetRange("Line No.", lineNo);
        if Agencies.FindSet() then begin
            if Agencies.Delete(true) then
                status := SuccessMsg
            else
                status := ErrMsg;

        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnInsertProcurementProfessionals(userId: Code[20]; name: Text; address: Text; phone: Text; profession: Text; email: Text) status: Text
    var
        ErrMsg: Label 'danger*Procurement Professional could not be inserted. Please try again!';
        SuccessMsg: Label 'success*Procurement Professional was inserted successfully.';
    begin
        Prof.Init();
        Prof."Document No." := userId;
        Prof.Name := name;
        Prof.Address := address;
        Prof."Phone No." := phone;
        Prof.Profession := profession;
        Prof."E-Mail" := email;
        if Prof.Insert(true) then
            status := SuccessMsg
        else
            status := ErrMsg;

        exit(status);
    end;

    procedure fnUpdateProcurementProfessionals(userId: Code[20]; lineNo: Integer; name: Text; address: Text; phone: Text; profession: Text; email: Text) status: Text
    var
        ErrMsg: Label 'danger*Procurement Professional could not be updated. Please try again!';
        SuccessMsg: Label 'success*Procurement Professional was updated successfully.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
    begin
        Prof.Reset();
        Prof.SetRange("Document No.", userId);
        Prof.SetRange("Line No.", lineNo);
        if Prof.FindSet() then begin
            Prof.Name := name;
            Prof.Address := address;
            Prof."Phone No." := phone;
            Prof.Profession := profession;
            Prof."E-Mail" := email;
            if Prof.Modify(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnRemoveProcurementProfessionals(userId: Code[20]; lineNo: Integer) status: Text
    var
        ErrMsg: Label 'danger*Procurement Professional could not be deleted. Please try again!';
        SuccessMsg: Label 'success*Procurement Professional was deleted successfully.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
    begin
        Prof.Reset();
        Prof.SetRange("Document No.", userId);
        Prof.SetRange("Line No.", lineNo);
        if Prof.FindSet() then begin
            if Prof.Delete(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnUploadLicenceRegistrationDocs(docNo: Code[20]; docType: Integer; FileName: Text[250]; Attachment: BigText; TableID: Integer)
    var
        DocAttachment: Record "Document Attachment";
        AttachDocType: Enum "Attachment Document Type";
        FileManagement: Codeunit "File Management";
        //Bytes: dotnet Array;
        //Convert: dotnet Convert;
        //MemoryStream: dotnet MemoryStream;
        Ostream: OutStream;
        tableFound: Boolean;
        FromRecRef: RecordRef;
        NoUploadErr: Label 'No file to upload';
        UploadFailErr: Label 'File not uploaded. No table filter found';
    begin
        tableFound := false;

        if DeleteDocumentAttachment(docNo, docType, TableID) then begin

        end;

        if TableID = Database::"Licensing Portal Users" then begin
            PortalUsers.Reset();
            PortalUsers.SetRange("User ID", docNo);
            if PortalUsers.Find() then
                FromRecRef.GetTable(PortalUsers);
            tableFound := true;
        end;

        if TableID = Database::"Licence Registration Form" then begin
            LicenceRegForm.Reset();
            LicenceRegForm.SetRange("No.", docNo);
            if LicenceRegForm.Find() then
                FromRecRef.GetTable(LicenceRegForm);
            tableFound := true;
        end;

        if tableFound = true then begin
            if FileName <> '' then begin
                Clear(DocAttachment);

                // if DeleteDocumentAttachment(docNo, docType, TableID) then begin
                DocAttachment.Init();
                DocAttachment.Validate("File Extension", FileManagement.GetExtension(FileName));
                DocAttachment.Validate("File Name", CopyStr(FileManagement.GetFileNameWithoutExtension(FileName), 1, MaxStrLen(FileName)));
                DocAttachment.Validate("Table ID", /* FromRecRef.Number */TableID);
                DocAttachment.Validate("No.", docNo);
                DocAttachment.Validate("Document Type", docType);
                // Bytes := Convert.FromBase64String(Attachment);
                // MemoryStream := MemoryStream.MemoryStream(Bytes);
                // DocAttachment."Document Reference ID".ImportStream(MemoryStream, '', FileName);
                if DocAttachment.Insert(true) then begin
                    DocAttachment."Table ID" := TableID;
                    DocAttachment.Modify();
                end;
                // if FileManagement.DeleteServerFile(FileName) then;
                // end;
            end else
                Error(NoUploadErr);
        end else
            Error(UploadFailErr);
    end;

    procedure GetDocumentAttachment(tableId: Integer; docType: Integer; No: Code[20]/* ; RecID: Integer */) BaseImage: Text
    var
        IStream: InStream;
        // //Bytes: dotnet Array;
        // //Convert: dotnet Convert;
        // //MemoryStream: dotnet MemoryStream;
        TenantMedia: Record "Tenant Media";
        imageID: GUID;
        docAttachment: Record "Document Attachment";
    begin
        docAttachment.Reset();
        docAttachment.SetRange("Table ID", tableId);
        docAttachment.SetRange("No.", No);
        // docAttachment.SetRange(ID, RecID);
        if docAttachment.FindSet() then begin
            if docAttachment."Document Reference ID".Hasvalue then begin
                imageID := docAttachment."Document Reference ID".MediaId;
                IF TenantMedia.GET(imageID) THEN BEGIN
                    TenantMedia.CALCFIELDS(Content);
                    TenantMedia.Content.CreateInstream(IStream);
                    // MemoryStream := MemoryStream.MemoryStream();
                    // CopyStream(MemoryStream, IStream);
                    // Bytes := MemoryStream.GetBuffer();
                    // BaseImage := Convert.ToBase64String(Bytes);

                END;
            end;
        end;
    end;

    procedure DeleteDocumentAttachment(DocNo: Code[20]; docType: Integer; TableID: Integer/* ; DocID: Integer */): Boolean
    var
        DocAttachment: Record "Document Attachment";
    begin
        DocAttachment.Reset();
        DocAttachment.SetRange("Table ID", TableID);
        DocAttachment.SetRange("No.", DocNo);
        // DocAttachment.SetRange(ID, DocID);
        DocAttachment.SetRange("Document Type", docType);
        if DocAttachment.FindSet() then begin
            if DocAttachment.Delete() then
                exit(true)
        end;
    end;

    procedure CheckAttachmentExists(DocNo: Code[20]; docType: Integer; TableID: Integer; DocID: Integer): Boolean
    var
        DocAttachment: Record "Document Attachment";
    begin
        DocAttachment.Reset();
        DocAttachment.SetRange("Table ID", TableID);
        DocAttachment.SetRange("No.", DocNo);
        DocAttachment.SetRange(ID, DocID);
        DocAttachment.SetRange("Document Type", docType);
        if DocAttachment.Find() then
            exit(true)
    end;

    procedure fnGenerateApplicationForm(userId: Code[20]) BaseImage: Text
    var
        RecRef: RecordRef;
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        FileMgmt: Codeunit "File Management";
        Base64Convert: Codeunit "Base64 Convert";
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", userId);
        if PortalUsers.FindFirst() then begin
            RecRef.GetTable(PortalUsers);
            TempBlob.CreateOutStream(OutStr);
            Report.SaveAs(Report::"Application For Registration", '', ReportFormat::Pdf, OutStr, RecRef);
            FileMgmt.BLOBExport(TempBlob, StrSubstNo('%1-REGISTRATION AND LICENSING AS A PROCURING OR DISPOSAL AGENT FORM.pdf', PortalUsers."User ID"), true);
            TempBlob.CreateInStream(InStr, TextEncoding::UTF8);
            BaseImage := Base64Convert.ToBase64(InStr);
        end;
    end;

    procedure fnGenerateLicenceOrCertificate(userId: Code[20]; docID: Code[20]) BaseImage: Text
    var
        RecRef: RecordRef;
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        FileMgmt: Codeunit "File Management";
        Base64Convert: Codeunit "Base64 Convert";
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", userId);
        if PortalUsers.FindFirst() then begin
            Licence.Reset();
            Licence.SetRange("Licence ID", docID);
            if Licence.FindSet() then begin
                RecRef.GetTable(Licence);
                TempBlob.CreateOutStream(OutStr);
                Report.SaveAs(Report::"Practicing License", '', ReportFormat::Pdf, OutStr, RecRef);
                FileMgmt.BLOBExport(TempBlob, StrSubstNo('Practicing Licence - %1.pdf', Licence."Licence ID"), true);
                TempBlob.CreateInStream(InStr, TextEncoding::UTF8);
                BaseImage := Base64Convert.ToBase64(InStr);
            end else begin
                Licence.Reset();
                Licence.SetRange("Registration No.", docID);
                if Licence.FindSet() then begin
                    RecRef.GetTable(Licence);
                    TempBlob.CreateOutStream(OutStr);
                    Report.SaveAs(Report::"Certificate of Registration", '', ReportFormat::Pdf, OutStr, RecRef);
                    FileMgmt.BLOBExport(TempBlob, StrSubstNo('Certificate of Registration - %1.pdf', Licence."Registration No."), true);
                    TempBlob.CreateInStream(InStr, TextEncoding::UTF8);
                    BaseImage := Base64Convert.ToBase64(InStr);
                end;
            end;
        end;
    end;

    procedure fnInsertLicenceRestorationReferees(userId: Code[20]; name: Text; email: Text; phone: Text) status: Text
    var
        ErrMsg: Label 'danger*Referee could not be inserted. Please try again!';
        SuccessMsg: Label 'success*Referee was inserted successfully.';
    begin
        Referees.Init();
        Referees."Document No." := userId;
        Referees.Name := name;
        Referees."E-Mail" := email;
        Referees."Phone No." := phone;
        if Referees.Insert(true) then
            status := SuccessMsg
        else
            status := ErrMsg;

        exit(status);
    end;

    procedure fnUpdateLicenceRestorationReferees(userId: Code[20]; lineNo: Integer; name: Text; email: Text; phone: Text) status: Text
    var
        ErrMsg: Label 'danger*Referee could not be updated. Please try again!';
        SuccessMsg: Label 'success*Referee was updated successfully.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
    begin
        Referees.Reset();
        Referees.SetRange("Document No.", userId);
        Referees.SetRange("Line No.", lineNo);
        if Referees.FindSet() then begin
            Referees.Name := name;
            Referees."E-Mail" := email;
            Referees."Phone No." := phone;
            if Referees.Modify(true) then begin
                status := SuccessMsg;
            end else begin
                status := ErrMsg;
            end;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnRemoveLicenceRestorationReferees(userId: Code[20]; lineNo: Integer) status: Text
    var
        ErrMsg: Label 'danger*Referee could not be deleted. Please try again!';
        SuccessMsg: Label 'success*Referee was deleted successfully.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
    begin
        Referees.Reset();
        Referees.SetRange("Document No.", userId);
        Referees.SetRange("Line No.", lineNo);
        if Referees.FindSet() then begin
            if Referees.Delete(true) then begin
                status := SuccessMsg;
            end else begin
                status := ErrMsg;
            end;
        end else begin
            status := NotFoundErr
        end;

        exit(status);
    end;

    procedure fnSubmitApplication(userId: Code[20]; applicationType: Integer) status: Text
    var
        SelectedCatNo: Integer;
        EducationInfoCount: Integer;
        SupportGroundCount: Integer;
        SignedDocument: Integer;
        OtherDocuments: Integer;
        IdentificationCard: Integer;
        QualificationCopies: Integer;
        CurrentKISMPracticeLicence: Integer;
        KISMMembershipCard: Integer;
        PassportPhoto: Integer;
        ProfessionalIndemnityCover: Integer;
        BankruptcyOrConvictionDoc: Integer;
        InvoiceAmt: Decimal;
        RecRef: RecordRef;
        docType: Option "Bankruptcy/Conviction","Current KISM Practice Licence","Identification Card","KISM Membership Card","Passport Photo","Professional Indemnity Cover","Qualification Copies","Signed Document";
        NoSelectedCatErr: Label 'danger*No selected categories found.';
        NoEducationErr: Label 'danger*No Education Background found.';
        NoSupportGroundErr: Label 'danger*No Other Support Grounds for the application found.';
        MissingDocumentErr: Label 'danger*Missing document required.';
        SuccessMsg: Label 'success*Application was submitted successfully.';
        ErrMsg: Label 'danger*Application was not sent. Please try again';
        UserNotFoundErr: Label 'danger*The user could not be found.';
        NoWorkflowEnabledErr: label 'danger*No related approval workflow is enabled.';
        CustomApproval: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        LicenceRegForm1: Record "Licence Registration Form";
        ApprovalSendFail: Label 'danger*Failed to send document for approval.';
        DuplicateErr: Label 'danger*Another application is underway. The application must be closed in order to proceed.';
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", userId);
        if PortalUsers.FindFirst() then begin

            PortalUsers.TestField("First Name");
            PortalUsers.TestField("Last Name");
            PortalUsers.TestField("ID Number");
            PortalUsers.TestField(Nationality);
            PortalUsers.TestField(Town);
            PortalUsers.TestField(Street);
            PortalUsers.TestField(Building);
            PortalUsers.TestField("Postal Address");
            PortalUsers.TestField("Postal Code");
            PortalUsers.TestField("Phone No.");
            PortalUsers.TestField("E-Mail");

            Clear(SelectedCatNo);
            Clear(EducationInfoCount);
            Clear(SupportGroundCount);
            Clear(SignedDocument);
            Clear(OtherDocuments);
            Clear(BankruptcyOrConvictionDoc);
            Clear(IdentificationCard);
            Clear(QualificationCopies);
            Clear(CurrentKISMPracticeLicence);
            Clear(KISMMembershipCard);
            Clear(PassportPhoto);
            Clear(ProfessionalIndemnityCover);

            RecRef.GetTable(PortalUsers);

            SelectedCatNo := fnCheckSelectedLicencePracticeCategories(PortalUsers."User ID");
            EducationInfoCount := fnCheckUserEducationInfo(PortalUsers."User ID");
            SupportGroundCount := fnCheckUserOtherSupportGrounds(PortalUsers."User ID");
            BankruptcyOrConvictionDoc := fnCheckRequiredDocuments(PortalUsers."User ID", RecRef.Number, 50000);
            ProfessionalIndemnityCover := fnCheckRequiredDocuments(PortalUsers."User ID", RecRef.Number, 50001);
            PassportPhoto := fnCheckRequiredDocuments(PortalUsers."User ID", RecRef.Number, 50002);
            KISMMembershipCard := fnCheckRequiredDocuments(PortalUsers."User ID", RecRef.Number, 50003);
            QualificationCopies := fnCheckRequiredDocuments(PortalUsers."User ID", RecRef.Number, 50005);
            CurrentKISMPracticeLicence := fnCheckRequiredDocuments(PortalUsers."User ID", RecRef.Number, 50004);
            IdentificationCard := fnCheckRequiredDocuments(PortalUsers."User ID", RecRef.Number, 50006);
            SignedDocument := fnCheckRequiredDocuments(PortalUsers."User ID", RecRef.Number, 50007);
            OtherDocuments := fnCheckRequiredDocuments(PortalUsers."User ID", RecRef.Number, 50008);

            if SelectedCatNo < 1 then begin
                status := NoSelectedCatErr;
                exit(status);
            end;

            if EducationInfoCount < 1 then begin
                status := NoEducationErr;
                exit(status);
            end;

            if SupportGroundCount < 1 then begin
                status := NoSupportGroundErr;
                exit(status);
            end;

            if PortalUsers.HasBankruptcyOrConviction() then begin
                PortalUsers.TestField("Bankruptcy/Conviction Details");
                if BankruptcyOrConvictionDoc < 1 then begin
                    status := 'danger*Missing Bankruptcy or Conviction Document.';
                    exit(status);
                end;
            end;

            if CurrentKISMPracticeLicence < 1 then begin
                status := 'danger*Missing Current KISM Practice Licence Document.';
                exit(status);
            end;

            if IdentificationCard < 1 then begin
                status := 'danger*Missing Identification Document.';
                exit(status);
            end;

            if KISMMembershipCard < 1 then begin
                status := 'danger*Missing KISM Membership Card Document.';
                exit(status);
            end;

            if PassportPhoto < 1 then begin
                status := 'danger*Missing Passport Photo Document.';
                exit(status);
            end;

            if ProfessionalIndemnityCover < 1 then begin
                status := 'danger*Missing Professional Indemnity Cover document.';
                exit(status);
            end;

            if QualificationCopies < 1 then begin
                status := 'danger*Missing Qualification Copies document.';
                exit(status);
            end;

            if SignedDocument < 1 then begin
                status := 'danger*Missing the final Signed document.';
                exit(status);
            end;

            if fnUpdateUserPracticeCategories(PortalUsers) then begin
                if applicationType = LicenceRegForm."Application Type"::Registration then begin
                    LicenceRegForm.Reset();
                    LicenceRegForm.SetRange("User ID", PortalUsers."User ID");
                    LicenceRegForm.SetRange("Application Type", LicenceRegForm."Application Type"::Registration);
                    LicenceRegForm.SetRange(Closed, false);
                    if LicenceRegForm.FindSet() then begin
                        status := DuplicateErr;
                    end else begin

                        RegPCategories.Reset();
                        RegPCategories.SetRange("Document No.", PortalUsers."User ID");
                        RegPCategories.SetRange(Selected, true);
                        RegPCategories.SetRange(Approve, false);
                        if RegPCategories.FindSet() then begin
                            RegPCategories.CalcSums("Practice Fee");
                            InvoiceAmt := RegPCategories."Practice Fee";
                        end;

                        LicenceRegForm.Init();
                        LicenceRegForm."User ID" := PortalUsers."User ID";
                        LicenceRegForm."Application Type" := LicenceRegForm."Application Type"::Registration;
                        LicenceRegForm.Submitted := true;
                        LicenceRegForm.Amount := InvoiceAmt;
                        if LicenceRegForm.Insert(true) then begin

                            RegPCategories.Reset();
                            RegPCategories.SetRange("Document No.", PortalUsers."User ID");
                            RegPCategories.SetRange(Selected, true);
                            RegPCategories.SetRange(Approve, false);
                            RegPCategories.SetRange(Deregistered, false);
                            if RegPCategories.FindSet() then begin
                                repeat
                                    CtgLines.Init();
                                    CtgLines."Document No." := LicenceRegForm."No.";
                                    CtgLines."Practice Category Code" := RegPCategories."Practice Category Code";
                                    CtgLines."Practice Category Name" := RegPCategories."Practice Category Name";
                                    CtgLines."Practice Fee" := RegPCategories."Practice Fee";
                                    CtgLines.Selected := RegPCategories.Selected;
                                    CtgLines.Insert(true);
                                until RegPCategories.Next() = 0;
                            end;

                            VarVariant := LicenceRegForm;
                            if CustomApproval.CheckApprovalsWorkflowEnabled(VarVariant) then begin
                                CustomApproval.OnSendDocForApproval(VarVariant);
                                LicenceRegForm1.Reset();
                                LicenceRegForm1.SetRange("No.", LicenceRegForm."No.");
                                LicenceRegForm1.SetRange(Status, LicenceRegForm1.Status::"Pending Approval");
                                if LicenceRegForm1.FindFirst() then begin
                                    if fnNotifyApplicantOnSuccessfulSubmission(LicenceRegForm1) then
                                        status := SuccessMsg
                                    else
                                        status := ErrMsg
                                end else begin
                                    status := ApprovalSendFail
                                end;

                            end else begin
                                status := NoWorkflowEnabledErr;
                            end;
                        end else begin
                            status := ErrMsg
                        end;
                    end;
                end else begin
                    status := ErrMsg
                end;
            end else begin
                status := ErrMsg;
                exit(status);
            end;

        end else begin
            status := UserNotFoundErr;
        end;

        exit(status);
    end;

    procedure fnRenewLicence(licenceNo: Code[20]; selected: Boolean) status: Text
    var
        ErrMsg: Label 'danger*Licence could not be updated. Please try again!';
        SuccessMsg: Label 'success*Licence was updated successfully.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
        DuplicateErr: Label 'danger*Another application is underway. The application must be closed in order to proceed.';
    begin
        Licence.Reset();
        Licence.SetRange("Licence ID", licenceNo);
        // Licence.SetRange(Status, Licence.Status::Expired);
        if Licence.FindFirst() then begin
            LicenceRegForm.Reset();
            LicenceRegForm.SetRange("User ID", Licence."User ID");
            LicenceRegForm.SetRange("Application Type", LicenceRegForm."Application Type"::Renewal);
            LicenceRegForm.SetRange(Closed, false);
            if LicenceRegForm.FindSet() then begin
                status := DuplicateErr
            end else begin
                Licence.Renew := selected;
                if Licence.Modify(true) then
                    status := SuccessMsg
                else
                    status := ErrMsg
            end;
        end else begin
            status := NotFoundErr
        end;

        exit(status);
    end;

    procedure fnSubmitRenewalApplication(userID: Code[20]; IndemnityCoverName: Text[250]; IndemnityCoverAttachment: BigText; KismCardName: Text[250]; KismCardAttachment: BigText; KismLicenceName: Text[250]; KismLicenceAttachment: BigText; IDCardName: Text[250]; IDCardAttachment: BigText) status: Text
    var
        RenewalLines: Record "Licence Renewal Lines";
        DocAttach: Record "Document Attachment";
        LicenceRegForm1: Record "Licence Registration Form";
        CustomApproval: Codeunit "Custom Approvals Codeunit";
        RecRef: RecordRef;
        NoWorkflowEnabledErr: label 'danger*No related approval workflow is enabled.';
        VarVariant: Variant;
        DuplicateErr: Label 'danger*Another application is underway. The application must be closed in order to proceed.';
        SuccMsg: Label 'success*Application submitted successfully.';
        NotSubmitErr: Label 'danger*Application not submitted. Please try again.';
        NoSelectedErr: Label 'danger*No licences selected to renew';
        ApprovalSendFail: Label 'danger*Failed to send document for approval.';
    begin
        LicenceRegForm.Reset();
        LicenceRegForm.SetRange("User ID", userID);
        LicenceRegForm.SetRange("Application Type", LicenceRegForm."Application Type"::Renewal);
        LicenceRegForm.SetRange(Closed, false);
        if LicenceRegForm.FindSet() then begin
            status := DuplicateErr;
        end else begin
            Licence.Reset();
            Licence.SetRange("User ID", userID);
            Licence.SetRange(Renew, true);
            if not Licence.FindSet() then begin
                status := NoSelectedErr;
                exit(status);
            end;

            if IndemnityCoverName = '' then begin
                status := 'danger*Missing Professional Indemnity Cover document.';
                exit(status);
            end;

            if KismCardName = '' then begin
                status := 'danger*Missing KISM Membership Card Document.';
                exit(status);
            end;

            if KismLicenceName = '' then begin
                status := 'danger*Missing Current KISM Practice Licence Document.';
                exit(status);
            end;

            if IDCardName = '' then begin
                status := 'danger*Missing Identification Document.';
                exit(status);
            end;

            LicenceRegForm.Init();
            LicenceRegForm."User ID" := userID;
            LicenceRegForm."Application Type" := LicenceRegForm."Application Type"::Renewal;
            LicenceRegForm.Submitted := true;
            if LicenceRegForm.Insert(true) then begin

                Licence.Reset();
                Licence.SetRange("User ID", userID);
                Licence.SetRange(Renew, true);
                if Licence.FindSet() then begin
                    repeat
                        RenewalLines.Init();
                        RenewalLines."Document No." := LicenceRegForm."No.";
                        RenewalLines."Category Code" := Licence."Category ID";
                        RenewalLines."Category Name" := Licence."Category Name";
                        RenewalLines."User ID" := userID;
                        RenewalLines."Licence ID" := Licence."Licence ID";
                        RenewalLines."Registration No." := Licence."Registration No.";
                        RenewalLines."Licence Start Date" := Licence."Licence Start Date";
                        RenewalLines."Licence Expiry Date" := Licence."Licence Expiry Date";
                        PCategories.Reset();
                        PCategories.SetRange(Code, Licence."Category ID");
                        if PCategories.FindFirst() then
                            RenewalLines.Amount := PCategories."Renewal Fees";
                        RenewalLines.Insert(true);
                    until Licence.Next() = 0;

                    Licence.ModifyAll(Renew, false, true);

                    RecRef.GetTable(LicenceRegForm);

                    fnUploadLicenceRegistrationDocs(LicenceRegForm."No.", DocAttach."Document Type"::"Professional Indemnity Cover", IndemnityCoverName, IndemnityCoverAttachment, RecRef.Number);
                    fnUploadLicenceRegistrationDocs(LicenceRegForm."No.", DocAttach."Document Type"::"KISM Membership Card", KismCardName, KismCardAttachment, RecRef.Number);
                    fnUploadLicenceRegistrationDocs(LicenceRegForm."No.", DocAttach."Document Type"::"Current KISM Practice Licence", KismLicenceName, KismLicenceAttachment, RecRef.Number);
                    fnUploadLicenceRegistrationDocs(LicenceRegForm."No.", DocAttach."Document Type"::"Identification Card", IDCardName, IDCardAttachment, RecRef.Number);

                    VarVariant := LicenceRegForm;
                    if CustomApproval.CheckApprovalsWorkflowEnabled(VarVariant) then begin
                        CustomApproval.OnSendDocForApproval(VarVariant);
                        LicenceRegForm1.Reset();
                        LicenceRegForm1.SetRange("No.", LicenceRegForm."No.");
                        LicenceRegForm1.SetRange(Status, LicenceRegForm1.Status::"Pending Approval");
                        if LicenceRegForm1.FindFirst() then begin
                            if fnNotifyApplicantOnSuccessfulSubmission(LicenceRegForm1) then
                                status := SuccMsg
                            else
                                status := NotSubmitErr
                        end else begin
                            status := ApprovalSendFail
                        end;
                    end else begin
                        status := NoWorkflowEnabledErr;
                    end;

                end else begin
                    status := NoSelectedErr;
                end;
            end else begin
                status := NotSubmitErr;
            end;
        end;
    end;

    procedure fnRestoreLicence(licenceNo: Code[20]; selected: Boolean) status: Text
    var
        ErrMsg: Label 'danger*Licence could not be updated. Please try again!';
        SuccessMsg: Label 'success*Licence was updated successfully.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
    begin
        Licence.Reset();
        Licence.SetRange("Licence ID", licenceNo);
        // Licence.SetRange(Status, Licence.Status::Deregistered);
        if Licence.FindFirst() then begin
            Licence.Restore := selected;
            if Licence.Modify(true) then
                status := SuccessMsg
            else
                status := ErrMsg
        end else begin
            status := NotFoundErr
        end;

        exit(status);
    end;

    procedure fnSubmitRestorationApplication(UserID: Code[20]; Residence: Text; Occupation: Text; applicationGround: Text) status: Text
    var
        LicenceRegForm1: Record "Licence Registration Form";
        CustomApproval: Codeunit "Custom Approvals Codeunit";
        RecRef: RecordRef;
        NoWorkflowEnabledErr: label 'danger*No related approval workflow is enabled.';
        VarVariant: Variant;
        DuplicateErr: Label 'danger*Another application is underway. The application must be closed in order to proceed.';
        SuccMsg: Label 'success*Application submitted successfully.';
        NotSubmitErr: Label 'danger*Application not submitted. Please try again.';
        NoSelectedErr: Label 'danger*No licences selected to renew';
        ApprovalSendFail: Label 'danger*Failed to send document for approval.';
        UserNotFound: Label 'danger*User was not found';
        RestoreLines: Record "Licence Restoration Lines";
    begin
        LicenceRegForm.Reset();
        LicenceRegForm.SetRange("User ID", UserID);
        LicenceRegForm.SetRange("Application Type", LicenceRegForm."Application Type"::Restoration);
        LicenceRegForm.SetRange(Closed, false);
        if LicenceRegForm.FindSet() then begin
            status := DuplicateErr
        end else begin

            Licence.Reset();
            Licence.SetRange("User ID", UserID);
            Licence.SetRange(Restore, true);
            if not Licence.FindSet() then begin
                status := NoSelectedErr;
                exit(status);
            end;

            if Residence = '' then begin
                status := 'danger*The Current Residence field is required.';
                exit(status);
            end;

            if Occupation = '' then begin
                status := 'danger*The Current Occupation field is required.';
                exit(status);
            end;

            if applicationGround = '' then begin
                status := 'danger*The Grounds of Application field is required.';
                exit(status);
            end;

            LicenceRegForm.Init();
            LicenceRegForm."User ID" := UserID;
            LicenceRegForm."Application Type" := LicenceRegForm."Application Type"::Restoration;
            LicenceRegForm."Grounds of Application" := applicationGround;
            LicenceRegForm."Current Occupation" := Occupation;
            LicenceRegForm."Current Residence" := Residence;
            LicenceRegForm.Submitted := true;
            if LicenceRegForm.Insert(true) then begin
                PortalUsers.Reset();
                PortalUsers.SetRange("User ID", UserID);
                if PortalUsers.FindFirst() then begin
                    PortalUsers."Current Occupation" := Occupation;
                    PortalUsers."Current Residence" := Residence;
                    if PortalUsers.Modify(true) then begin

                        Licence.Reset();
                        Licence.SetRange("User ID", UserID);
                        Licence.SetRange(Restore, true);
                        if Licence.FindSet() then begin
                            repeat
                                RestoreLines.Init();
                                RestoreLines."Document No." := LicenceRegForm."No.";
                                RestoreLines."Category Code" := Licence."Category ID";
                                RestoreLines."Category Name" := Licence."Category Name";
                                RestoreLines."User ID" := UserID;
                                RestoreLines."License No." := Licence."Licence ID";
                                RestoreLines."Licence Start Date" := Licence."Licence Start Date";
                                RestoreLines."Licence Expiry Date" := Licence."Licence Expiry Date";
                                RestoreLines."Deregistered Date" := Licence."Deregister Date";
                                RestoreLines."Grounds for Removal" := Licence."Grounds of Removal";
                                PCategories.Reset();
                                PCategories.SetRange(Code, Licence."Category ID");
                                if PCategories.FindFirst() then
                                    RestoreLines.Amount := PCategories."Restoration Fees";
                                RestoreLines.Insert(true);
                            until Licence.Next() = 0;

                            Licence.ModifyAll(Restore, false, true);
                        end;

                        VarVariant := LicenceRegForm;

                        if CustomApproval.CheckApprovalsWorkflowEnabled(VarVariant) then begin
                            CustomApproval.OnSendDocForApproval(VarVariant);
                            LicenceRegForm1.Reset();
                            LicenceRegForm1.SetRange("No.", LicenceRegForm."No.");
                            LicenceRegForm1.SetRange(Status, LicenceRegForm1.Status::"Pending Approval");
                            if LicenceRegForm1.FindFirst() then begin
                                if fnNotifyApplicantOnSuccessfulSubmission(LicenceRegForm1) then
                                    status := SuccMsg
                                else
                                    status := NotSubmitErr
                            end else begin
                                status := ApprovalSendFail
                            end;
                        end else begin
                            status := NoWorkflowEnabledErr;
                        end;
                    end else begin
                        status := NotSubmitErr
                    end;
                end else begin
                    status := UserNotFound
                end;
            end else begin
                status := NotSubmitErr
            end;
        end;

        exit(status);
    end;

    procedure fnCreateLicences(var LicenceReg: Record "Licence Registration Form"): Boolean
    var
        UnsubmittedErr: Label 'The Licence Form No: %1 has not been submitted.';
        ClosedErr: Label 'The Licence Form No: %1 has already been closed.';
        ApprovedErr: Label 'The Licence Form No: %1 must be approved in order to proceed.';
        NoCategErr: Label 'At least 1 Practice Category must be approved in order to proceed.';
        CategoryCount: Integer;
        FormNotFoundErr: Label 'The record was not found.';
        LicenceCreateSuccessMsg: Label 'Licence No: %1 was created successfully.';
    begin
        LicenceRegForm.Reset();
        LicenceRegForm.SetRange("No.", LicenceReg."No.");
        if LicenceRegForm.FindFirst() then begin

            LicenceRegForm.TestField(Submitted, true);
            LicenceRegForm.TestField(Closed, false);
            LicenceRegForm.TestField(Status, LicenceRegForm.Status::Approved);

            CtgLines.Reset();
            CtgLines.SetRange("Document No.", LicenceRegForm."No.");
            CtgLines.SetRange(Selected, true);
            CtgLines.SetRange(Approve, true);
            if CtgLines.FindSet() then begin
                repeat
                    Licence.Init();
                    Licence."Licence ID" := '';
                    Licence."Registration No." := '';
                    Licence."Application ID" := LicenceRegForm."No.";
                    Licence."Category ID" := CtgLines."Practice Category Code";
                    Licence."Category Name" := CtgLines."Practice Category Name";
                    Licence."User ID" := LicenceRegForm."User ID";
                    Licence.Status := Licence.Status::Active;
                    Licence."Document Date" := Today;
                    Licence."Licence Start Date" := Today;
                    Licence."Licence Expiry Date" := CalcDate('1Y', Today);
                    Licence."Issue Date" := Today;
                    Licence."Issued By" := UserId;
                    if Licence.Insert(true) then
                        fnSendLicenceAndCert(Licence)
                until CtgLines.Next() = 0;
            end else begin
                Error(NoCategErr);
            end;

            RegPCategories.Reset();
            RegPCategories.SetRange("Document No.", LicenceRegForm."User ID");
            RegPCategories.SetRange(Selected, true);
            RegPCategories.SetRange(Approve, false);
            if RegPCategories.FindSet() then
                RegPCategories.ModifyAll(Selected, false, true);

            LicenceRegForm.Closed := true;
            LicenceRegForm."Closed By" := UserId;
            if LicenceRegForm.Modify(true) then
                exit(true);
        end;
    end;

    procedure fnRenewLicences(var LicenceReg: Record "Licence Registration Form"): Boolean
    var
        RenewLines: Record "Licence Renewal Lines";
    begin
        LicenceRegForm.Reset();
        LicenceRegForm.SetRange("No.", LicenceReg."No.");
        if LicenceRegForm.FindFirst() then begin

            LicenceRegForm.TestField(Submitted, true);
            LicenceRegForm.TestField(Closed, false);
            LicenceRegForm.TestField(Status, LicenceRegForm.Status::Approved);

            RenewLines.Reset();
            RenewLines.SetRange("Document No.", LicenceRegForm."No.");
            if RenewLines.FindSet() then begin
                repeat
                    Licence.Reset();
                    Licence.SetRange("Licence ID", RenewLines."Licence ID");
                    if Licence.FindFirst() then begin
                        Licence.Status := Licence.Status::Active;
                        Licence."Licence Start Date" := Today;
                        Licence."Licence Expiry Date" := CalcDate('1Y', Today);
                        if Licence.Modify(true) then
                            fnSendLicenceAndCert(Licence)
                    end;
                until RenewLines.Next() = 0;
            end;

            LicenceRegForm.Closed := true;
            LicenceRegForm."Closed By" := UserId;
            if LicenceRegForm.Modify(true) then
                exit(true);
        end;
    end;

    procedure fnRestoreLicences(var LicenceReg: Record "Licence Registration Form"): Boolean
    var
        RestoreLines: Record "Licence Restoration Lines";
    begin
        LicenceRegForm.Reset();
        LicenceRegForm.SetRange("No.", LicenceReg."No.");
        if LicenceRegForm.FindFirst() then begin

            LicenceRegForm.TestField(Submitted, true);
            LicenceRegForm.TestField(Closed, false);
            LicenceRegForm.TestField(Status, LicenceRegForm.Status::Approved);

            RestoreLines.Reset();
            RestoreLines.SetRange("Document No.", LicenceRegForm."No.");
            if RestoreLines.FindSet() then begin
                repeat
                    Licence.Reset();
                    Licence.SetRange("Licence ID", RestoreLines."License No.");
                    if Licence.FindFirst() then begin
                        Licence."Grounds of Removal" := '';
                        Licence."Deregister Date" := 0D;
                        Licence."Licence Start Date" := Today;
                        Licence."Licence Expiry Date" := CalcDate('1Y', Today);
                        Licence.Status := Licence.Status::Active;
                        if Licence.Modify(true) then begin
                            RegPCategories.Reset();
                            RegPCategories.SetRange("Document No.", Licence."User ID");
                            RegPCategories.SetRange("Practice Category Code", Licence."Category ID");
                            if RegPCategories.FindSet() then begin
                                RegPCategories.Deregistered := false;
                                if RegPCategories.Modify() then
                                    fnSendLicenceAndCert(Licence)
                            end;
                        end;
                    end;
                until RestoreLines.Next() = 0;
            end;

            LicenceRegForm.Closed := true;
            LicenceRegForm."Closed By" := UserId;
            if LicenceRegForm.Modify(true) then
                exit(true);
        end;
    end;

    procedure fnCheckSelectedLicencePracticeCategories(userId: Code[20]) Count: Integer
    begin
        RegPCategories.Reset();
        RegPCategories.SetRange("Document No.", userId);
        RegPCategories.SetRange(Selected, true);
        if RegPCategories.FindSet() then
            Count := RegPCategories.Count
        else
            Count := 0;

        exit(Count);
    end;

    procedure fnCheckUserEducationInfo(userId: Code[20]) Count: Integer
    begin
        EducationInfo.Reset();
        EducationInfo.SetRange("Document No.", userId);
        if EducationInfo.FindSet() then
            Count := EducationInfo.Count
        else
            Count := 0;

        exit(Count);
    end;

    procedure fnCheckUserOtherSupportGrounds(userId: Code[20]) Count: Integer
    begin
        Prof.Reset();
        Prof.SetRange("Document No.", userId);
        if Prof.FindSet() then
            Count := Prof.Count
        else
            Count := 0;

        exit(Count);
    end;

    procedure fnCheckRequiredDocuments(docNo: Code[20]; tableID: Integer; docType: Option "Bankruptcy/Conviction","Current KISM Practice Licence","Identification Card","KISM Membership Card","Passport Photo","Professional Indemnity Cover","Qualification Copies","Signed Document") Count: Integer
    var
        DocAttach: Record "Document Attachment";
    begin
        DocAttach.Reset();
        DocAttach.SetRange("Table ID", tableID);
        DocAttach.SetRange("No.", docNo);
        DocAttach.SetRange("Document Type", docType);
        if DocAttach.FindSet() then
            Count := DocAttach.Count
        else
            Count := 0;

        exit(Count);
    end;

    procedure fnUpdateUserPracticeCategories(var User: Record "Licensing Portal Users"): Boolean
    begin
        RegPCategories.Reset();
        RegPCategories.SetRange("Document No.", PortalUsers."User ID");
        if RegPCategories.FindSet() then begin
            repeat
                PCategories.Reset();
                PCategories.SetRange(Code, RegPCategories."Practice Category Code");
                // PCategories.SetRange(Blocked, false);
                if PCategories.FindFirst() then begin
                    RegPCategories."Practice Fee" := PCategories."Practice Fees";
                    RegPCategories.Modify(true);
                end else begin
                    if PCategories.Blocked = false then begin
                        RegPCategories.Init();
                        RegPCategories."Document No." := PortalUsers."User ID";
                        RegPCategories."Practice Category Code" := PCategories.Code;
                        RegPCategories."Practice Category Name" := PCategories.Name;
                        RegPCategories."Practice Fee" := PCategories."Practice Fees";
                        RegPCategories.Insert(true);
                    end;
                end;
            until RegPCategories.Next() = 0;
            exit(true);
        end else begin
            PCategories.Reset();
            PCategories.SetRange(Blocked, false);
            if PCategories.FindSet() then begin
                repeat
                    RegPCategories.Init();
                    RegPCategories."Document No." := PortalUsers."User ID";
                    RegPCategories."Practice Category Code" := PCategories.Code;
                    RegPCategories."Practice Category Name" := PCategories.Name;
                    RegPCategories."Practice Fee" := PCategories."Practice Fees";
                    RegPCategories.Insert(true);
                until PCategories.Next() = 0;
                exit(true);
            end;
        end;
    end;

    procedure fnUpdateLicenceFeePayment(UserID: Code[20]; DocNo: Code[20]; TransCode: Code[50]; TransDate: DateTime; TransAmount: Decimal) status: Text
    var
        NotFoundErr: Label 'danger*The document was not found.';
        FailErr: Label 'danger*Failed to update payment status. Please again later.';
        SuccMsg: Label 'success*Payment status updated successfully.';
        AmtErr: Label 'danger*No partial payment allowed.';
    begin
        LicenceRegForm.Reset();
        LicenceRegForm.SetRange("No.", DocNo);
        LicenceRegForm.SetRange("User ID", UserID);
        LicenceRegForm.SetRange(Closed, false);
        // LicenceRegForm.SetRange(Submitted, true);
        if LicenceRegForm.FindFirst() then begin
            LicenceRegForm."Transaction Code" := TransCode;
            LicenceRegForm."Transaction Date" := TransDate;
            LicenceRegForm."Amount Received" := TransAmount;
            LicenceRegForm."Payment Status" := LicenceRegForm."Payment Status"::Paid;
            if LicenceRegForm.Modify(true) then
                if fnCreateLicencePaymentEntry(LicenceRegForm) then
                    status := SuccMsg
                else
                    status := FailErr
            else
                status := FailErr
        end else begin
            status := NotFoundErr
        end;

        exit(status);
    end;

    procedure fnCreateLicencePaymentEntry(var LRegForm: Record "Licence Registration Form"): Boolean
    var
        RenewLines: Record "Licence Renewal Lines";
        RestoreLines: Record "Licence Restoration Lines";
        ReceiptType: Enum "Receipt Types";
    begin
        LicenceRegForm.Reset();
        LicenceRegForm.SetRange("No.", LRegForm."No.");
        if LicenceRegForm.FindFirst() then begin
            Payments.Init();
            Payments."Transaction Code" := LicenceRegForm."Transaction Code";
            Payments.Validate("Transaction Code");
            Payments."Transaction Date" := LicenceRegForm."Transaction Date";
            Payments.Amount := LicenceRegForm."Amount Received";
            Payments."Invoice No." := LicenceRegForm."Invoice No.";
            Payments."Licence Document No." := LicenceRegForm."No.";
            Payments."Document Date" := CurrentDateTime;
            Payments."Payment Type" := 1;
            if Payments.Insert(true) then begin
                if LicenceRegForm."Application Type" = LicenceRegForm."Application Type"::Registration then begin
                    if fnCreateLicences(LicenceRegForm) then
                        exit(true)
                end else if LicenceRegForm."Application Type" = LicenceRegForm."Application Type"::Renewal then begin
                    if fnRenewLicences(LicenceRegForm) then
                        exit(true)
                end else if LicenceRegForm."Application Type" = LicenceRegForm."Application Type"::Restoration then begin
                    if fnRestoreLicences(LicenceRegForm) then
                        exit(true)
                end;
            end;
        end;
    end;

    procedure fnCreateUserAsCustomer(var User: Record "Licensing Portal Users"): Boolean
    var
        Cust: Record Customer;
    begin
        LicenceSetup.Get();

        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", User."User ID");
        if PortalUsers.FindFirst() then begin
            Cust.Reset();
            Cust.SetRange("No.", PortalUsers."User ID");
            if Cust.FindFirst() then begin
                Cust."No." := PortalUsers."User ID";
                Cust.Name := PortalUsers.FullName();
                Cust."Customer Type" := Cust."Customer Type"::Licensing;
                Cust."Phone No." := PortalUsers."Phone No.";
                Cust."E-Mail" := PortalUsers."E-Mail";
                Cust."Gen. Bus. Posting Group" := LicenceSetup."Gen. Bus. Posting Group";
                Cust."Customer Posting Group" := LicenceSetup."Customer Posting Group";
                if Cust.Modify(true) then
                    exit(true)
            end else begin
                Cust.Init();
                Cust."No." := PortalUsers."User ID";
                Cust.Name := PortalUsers.FullName();
                Cust."Customer Type" := Cust."Customer Type"::Licensing;
                Cust."Phone No." := PortalUsers."Phone No.";
                Cust."E-Mail" := PortalUsers."E-Mail";
                Cust."Gen. Bus. Posting Group" := LicenceSetup."Gen. Bus. Posting Group";
                Cust."Customer Posting Group" := LicenceSetup."Customer Posting Group";
                if Cust.Insert(true) then
                    exit(true)
            end;
        end;
    end;

    procedure fnCreateCategoryAsItem(var Category: Record "Licence Practice Categories"): Boolean
    var
        Item: Record Item;
        ItemUnitOfMeasure: Record "Item Unit of Measure";
    begin
        LicenceSetup.Get();

        Item.Reset();
        Item.SetRange("No.", Category.Code);
        if Item.FindFirst() then begin
            Item.Description := Category.Name;
            Item.Type := Item.Type::Service;
            Item."Base Unit of Measure" := LicenceSetup."Base Unit of Measure";
            Item."Gen. Prod. Posting Group" := LicenceSetup."Gen. Prod. Posting Group";
            Item."VAT Prod. Posting Group" := LicenceSetup."VAT Prod. Posting Group";
            Item."Sales Unit of Measure" := LicenceSetup."Base Unit of Measure";
            Item."Purch. Unit of Measure" := LicenceSetup."Base Unit of Measure";
            if Item.Modify(true) then begin
                if not ItemUnitOfMeasure.Get(Item."No.", Item."Base Unit of Measure") then
                    if CreateItemUnitOfMeasure(Item) then
                        exit(true)
            end;
        end else begin
            Item.Init();
            Item."No." := Category.Code;
            Item.Description := Category.Name;
            Item.Type := Item.Type::Service;
            Item."Base Unit of Measure" := LicenceSetup."Base Unit of Measure";
            Item."Gen. Prod. Posting Group" := LicenceSetup."Gen. Prod. Posting Group";
            Item."VAT Prod. Posting Group" := LicenceSetup."VAT Prod. Posting Group";
            Item."Sales Unit of Measure" := LicenceSetup."Base Unit of Measure";
            Item."Purch. Unit of Measure" := LicenceSetup."Base Unit of Measure";
            if Item.Insert(true) then begin
                if CreateItemUnitOfMeasure(Item) then
                    exit(true)
            end;
        end;
    end;

    procedure fnCreateSalesInvoice(var LRegForm: Record "Licence Registration Form")
    var
        SalesHead: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Cust: Record Customer;
        Item: Record Item;
        NextlineNo: Integer;
        RenewLines: Record "Licence Renewal Lines";
        RestoreLines: Record "Licence Restoration Lines";
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", LRegForm."User ID");
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

            // end else begin
            SalesHead.Init();
            SalesHead."No." := '';
            SalesHead."Document Type" := SalesHead."Document Type"::Invoice;
            SalesHead.Validate("Sell-to Customer Name", Cust.Name);
            // SalesHead."Sell-to Customer No." := Cust."No.";
            // SalesHead.Validate("Sell-to Customer No.");
            // SalesHead."Bill-to Customer No." := Cust."No.";
            // SalesHead.Validate("Bill-to Customer No.");
            if SalesHead.Insert(true) then begin
                LicenceRegForm.Reset();
                LicenceRegForm.SetRange("No.", LRegForm."No.");
                if LicenceRegForm.FindFirst() then begin
                    if LicenceRegForm."Application Type" = LicenceRegForm."Application Type"::Registration then begin
                        CtgLines.Reset();
                        CtgLines.SetRange("Document No.", LicenceRegForm."No.");
                        CtgLines.SetRange(Selected, true);
                        CtgLines.SetRange(Approve, true);
                        if CtgLines.FindSet() then begin
                            repeat
                                Item.Reset();
                                Item.SetRange("No.", CtgLines."Practice Category Code");
                                if Item.FindFirst() then begin
                                    SalesLine.Init();
                                    SalesLine."Document No." := SalesHead."No.";
                                    // SalesLine.Validate("Document No.");
                                    SalesLine."Document Type" := SalesHead."Document Type";
                                    // SalesLine.Validate("Document Type");
                                    SalesLine.Type := SalesLine.Type::Item;
                                    SalesLine.Validate(Type);
                                    SalesLine."No." := item."No.";
                                    SalesLine.Validate("No.");
                                    SalesLine.Quantity := 1;
                                    SalesLine.Validate(Quantity);
                                    SalesLine."Unit Price" := CtgLines."Practice Fee";
                                    SalesLine.Validate("Unit Price");
                                    SalesLine."Line No." := CtgLines."Line No.";
                                    SalesLine.Insert(true);
                                    // end else begin

                                end;
                            until CtgLines.Next() = 0;
                            CtgLines.CalcSums("Practice Fee");
                            LicenceRegForm."Invoice No." := SalesHead."No.";
                            LicenceRegForm.Amount := CtgLines."Practice Fee";
                            LicenceRegForm."Amount (LCY)" := CtgLines."Practice Fee";
                            LicenceRegForm.Modify(true);
                            // end else begin

                        end;
                    end else if LicenceRegForm."Application Type" = LicenceRegForm."Application Type"::Renewal then begin
                        RenewLines.Reset();
                        RenewLines.SetRange("Document No.", LicenceRegForm."No.");
                        if RenewLines.FindSet() then begin
                            repeat
                                Item.Reset();
                                Item.SetRange("No.", RenewLines."Category Code");
                                if Item.FindFirst() then begin
                                    SalesLine.Init();
                                    SalesLine."Document No." := SalesHead."No.";
                                    // SalesLine.Validate("Document No.");
                                    SalesLine."Document Type" := SalesHead."Document Type";
                                    // SalesLine.Validate("Document Type");
                                    SalesLine.Type := SalesLine.Type::Item;
                                    SalesLine.Validate(Type);
                                    SalesLine."No." := item."No.";
                                    SalesLine.Validate("No.");
                                    SalesLine.Quantity := 1;
                                    SalesLine.Validate(Quantity);
                                    SalesLine."Unit Price" := RenewLines.Amount;
                                    SalesLine.Validate("Unit Price");
                                    SalesLine."Line No." := RenewLines."Line No.";
                                    SalesLine.Insert(true);
                                    // end else begin

                                end;
                            until RenewLines.Next() = 0;

                            RenewLines.CalcSums(Amount);
                            LicenceRegForm."Invoice No." := SalesHead."No.";
                            LicenceRegForm.Amount := RenewLines.Amount;
                            LicenceRegForm."Amount (LCY)" := RenewLines.Amount;
                            LicenceRegForm.Modify(true);
                        end;
                    end else if LicenceRegForm."Application Type" = LicenceRegForm."Application Type"::Restoration then begin
                        RestoreLines.Reset();
                        RestoreLines.SetRange("Document No.", LicenceRegForm."No.");
                        if RestoreLines.FindSet() then begin
                            repeat
                                Item.Reset();
                                Item.SetRange("No.", RestoreLines."Category Code");
                                if Item.FindFirst() then begin
                                    SalesLine.Init();
                                    SalesLine."Document No." := SalesHead."No.";
                                    // SalesLine.Validate("Document No.");
                                    SalesLine."Document Type" := SalesHead."Document Type";
                                    // SalesLine.Validate("Document Type");
                                    SalesLine.Type := SalesLine.Type::Item;
                                    SalesLine.Validate(Type);
                                    SalesLine."No." := item."No.";
                                    SalesLine.Validate("No.");
                                    SalesLine.Quantity := 1;
                                    SalesLine.Validate(Quantity);
                                    SalesLine."Unit Price" := RestoreLines.Amount;
                                    SalesLine.Validate("Unit Price");
                                    SalesLine."Line No." := RestoreLines."Line No.";
                                    SalesLine.Insert(true);
                                    // end else begin

                                end;
                            until RestoreLines.Next() = 0;

                            RestoreLines.CalcSums(Amount);
                            LicenceRegForm."Invoice No." := SalesHead."No.";
                            LicenceRegForm.Amount := RestoreLines.Amount;
                            LicenceRegForm."Amount (LCY)" := RestoreLines.Amount;
                            LicenceRegForm.Modify(true);
                        end;
                    end;

                end else begin

                end;
            end else begin

            end;
            // end;
        end else begin

        end;
    end;

    procedure CreateItemUnitOfMeasure(var Item: Record Item): Boolean
    var
        ItemUnitOfMeasure: Record "Item Unit of Measure";
    begin
        ItemUnitOfMeasure.Init();
        ItemUnitOfMeasure.Validate("Item No.", Item."No.");
        ItemUnitOfMeasure.Validate(Code, Item."Base Unit of Measure");
        ItemUnitOfMeasure."Qty. per Unit of Measure" := 1;
        if ItemUnitOfMeasure.Insert() then
            exit(true)
    end;

    procedure fnCheckApprovedLicenceLines(var LRForm: Record "Licence Registration Form") Count: Integer
    begin
        LicenceRegForm.Reset();
        LicenceRegForm.SetRange("No.", LRForm."No.");
        if LicenceRegForm.FindFirst() then begin
            CtgLines.Reset();
            CtgLines.SetRange("Document No.", LicenceRegForm."No.");
            CtgLines.SetRange(Selected, true);
            CtgLines.SetRange(Approve, true);
            if CtgLines.FindSet() then
                Count := CtgLines.Count
            else
                Count := 0
        end;

        exit(Count);
    end;

    procedure fnApproveLicenceLines(var LRForm: Record "Licence Registration Form"): Boolean
    begin
        LicenceRegForm.Reset();
        LicenceRegForm.SetRange("No.", LRForm."No.");
        if LicenceRegForm.FindFirst() then begin
            CtgLines.Reset();
            CtgLines.SetRange("Document No.", LicenceRegForm."No.");
            CtgLines.SetRange(Selected, true);
            if CtgLines.FindSet() then begin
                repeat
                    CtgLines.Validate(Approve, true);
                    CtgLines.Modify();
                until CtgLines.Next() = 0;

                exit(true);
            end;
        end;
    end;

    procedure fnNotifyApprovedApplication(var LRForm: Record "Licence Registration Form")
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        SInv: Record "Sales Header";
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", LRForm."User ID");
        if PortalUsers.FindFirst() then begin

            fnCreateSalesInvoice(LRForm);

            // SInv.Reset();
            // SInv.SetRange("No.", LRForm."Invoice No.");
            // if SInv.FindFirst() then begin

            CompInfo.Get();

            // EmailSubject := 'Application for Registration Approval: ' + SInv."No.";
            EmailSubject := 'YOUR APPLICATION HAS BEEN APPROVED: ' + LRForm."No.";

            PortalUsers.TestField("E-Mail");
            EmailRecepient.Add(PortalUsers."E-Mail");

            EmailBody := 'Hello ' + PortalUsers."First Name" + ',';
            EmailBody += '<BR><BR>This is to inform you that your Application No: ' + LRForm."No." + ' submitted on ' + Format(LRForm."Submission Date") + 'has been approved.';
            // EmailBody += '<BR><BR>According to your application the following categories were approved:-';
            // CtgLines.Reset();
            // CtgLines.SetRange("Document No.", LRForm."No.");
            // CtgLines.SetRange(Selected, true);
            // CtgLines.SetRange(Approve, true);
            // if CtgLines.FindSet() then begin
            //     repeat
            //         EmailBody += '<BR><BR>-' + CtgLines."Practice Category Name";
            //     until CtgLines.Next() = 0;
            // end;
            EmailBody += '<BR><BR>Please login to the portal and pay in order to receive your licences and certificates.';
            EmailBody += '<BR><BR>Regards,';
            EmailBody += '<BR><BR>' + CompInfo.Name;

            EmailMessage.Create(
                EmailRecepient,
                EmailSubject,
                EmailBody,
                true
            );

            Email.Send(EmailMessage);

            // end;
        end;
    end;

    procedure fnNotifyRejectedApplication(var LRForm: Record "Licence Registration Form")
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", LRForm."User ID");
        if PortalUsers.FindFirst() then begin

            CompInfo.Get();

            EmailSubject := 'Application for Registration Rejection: ' + LRForm."No.";

            PortalUsers.TestField("E-Mail");
            EmailRecepient.Add(PortalUsers."E-Mail");

            EmailBody := 'Hello ' + PortalUsers."First Name" + ',';
            EmailBody += '<BR><BR>This is to inform you that your Application No: ' + LRForm."No." + ' submitted on ' + Format(LRForm."Submission Date") + 'was rejected.';
            EmailBody += '<BR><BR>Please login to the portal and see possible causes for this.';
            EmailBody += '<BR><BR>Regards,';
            EmailBody += '<BR><BR>' + CompInfo.Name;

            EmailMessage.Create(
                EmailRecepient,
                EmailSubject,
                EmailBody,
                true
            );

            Email.Send(EmailMessage);

        end;
    end;

    procedure createReceipt()
    var
        Buffer: Record "E-Citizen Payment Entries";
    begin
        Buffer.Reset();
        Buffer.SetRange(fetched, false);
        if Buffer.FindSet() then
            repeat
                PostReceipt(Buffer);
            until Buffer.Next() = 0;
    end;

    local procedure PostReceipt(var Buffer: Record "E-Citizen Payment Entries")
    begin
        if not CODEUNIT.Run(CODEUNIT::"Create Receipt", Buffer) then begin
            Buffer.Failed := true;
            Buffer."Error Message" := GetLastErrorText();
            Buffer.Modify();
            Commit();
            exit;
        end;
    end;

    procedure fnUpdateDeregisteredLicence(var Lic: Record Licences)
    begin
        Licence.Reset();
        Licence.SetRange("Licence ID", Lic."Licence ID");
        if Licence.FindFirst() then begin
            Licence.Deregister := true;
            Licence.Status := Licence.Status::Deregistered;
            Licence."Deregister Date" := Today;
            if Licence.Modify(true) then begin
                fnDeregisterPracticeCategories(Lic);
            end;
        end;
    end;

    procedure fnDeregisterPracticeCategories(var Lic: Record Licences)
    begin
        RegPCategories.Reset();
        RegPCategories.SetRange("Document No.", Lic."User ID");
        RegPCategories.SetRange("Practice Category Code", Lic."Category ID");
        if RegPCategories.FindSet() then begin
            RegPCategories.Deregistered := true;
            RegPCategories.Modify();
        end;
    end;

    procedure fnUpdateLicenceExpiry()
    begin
        Licence.Reset();
        Licence.SetFilter("Licence Expiry Date", '<=%1', Today);
        if Licence.FindSet() then
            Licence.ModifyAll(Status, Licence.Status::Expired, true);
    end;

    procedure fnNotifyLicenceExpiry()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
    begin
        Licence.Reset();
        Licence.SetRange(Status, Licence.Status::Active);
        Licence.SetRange("Licence Expiry Date", CalcDate('30D', Today));
        if Licence.FindSet() then begin
            repeat
                PortalUsers.Reset();
                PortalUsers.SetRange("User ID", Licence."User ID");
                if PortalUsers.FindSet() then begin
                    PortalUsers.TestField("E-Mail");

                    EmailRecepient.Add(PortalUsers."E-Mail");

                    EmailSubject := 'LICENCE EXPIRY REMINDER - ' + Licence."Licence ID";

                    EmailBody += 'Hello ' + PortalUsers."First Name" + ',';
                    EmailBody += '<BR><BR>Your licence will be expiring in <B>30 Days.</B>';
                    EmailBody += '<BR><BR>The Licence details are as follows:-';
                    EmailBody += '<BR><B>Licence No :</B> ' + Licence."Licence ID";
                    EmailBody += '<BR><B>Registration No :</B> ' + Licence."Registration No.";
                    EmailBody += '<BR><B>Issue Date :</B> ' + format(Licence."Licence Start Date");
                    EmailBody += '<BR><B>Expiry Date :</B> ' + format(Licence."Licence Expiry Date");
                    EmailBody += '<BR><B>Status :</B> ' + format(Licence.Status);
                    EmailBody += '<BR><BR>Regards,';
                    EmailBody += '<BR><BR>' + CompInfo.Name;

                    EmailMessage.Create(
                        EmailRecepient,
                        EmailSubject,
                        EmailBody,
                        true
                    );

                    Email.Send(EmailMessage);
                end;
            until Licence.Next() = 0;
        end;
    end;

    procedure fnNotifyLicenceDeregistration(var Lic: Record Licences)
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
    begin
        Licence.Reset();
        Licence.SetRange("Licence ID", Lic."Licence ID");
        if Licence.FindSet() then begin
            repeat
                PortalUsers.Reset();
                PortalUsers.SetRange("User ID", Licence."User ID");
                if PortalUsers.FindSet() then begin
                    PortalUsers.TestField("E-Mail");

                    EmailRecepient.Add(PortalUsers."E-Mail");

                    EmailSubject := 'LICENCE DEREGISTERED - ' + Licence."Licence ID";

                    EmailBody += 'Hello ' + PortalUsers."First Name" + ',';
                    EmailBody += '<BR><BR>Your licence has been deregistered. Please follow up with Licensing Managers if you need further clarifications or instructions on how to restore it.';
                    EmailBody += '<BR><BR>The Licence details are as follows:-';
                    EmailBody += '<BR><B>Licence No :</B> ' + Licence."Licence ID";
                    EmailBody += '<BR><B>Registration No :</B> ' + Licence."Registration No.";
                    EmailBody += '<BR><B>Issue Date :</B> ' + format(Licence."Licence Start Date");
                    EmailBody += '<BR><B>Expiry Date :</B> ' + format(Licence."Licence Expiry Date");
                    EmailBody += '<BR><B>Status :</B> ' + format(Licence.Status);
                    EmailBody += '<BR><B>Grounds of Removal :</B> ' + Licence."Grounds of Removal";
                    EmailBody += '<BR><B>Deregistration Date :</B> ' + format(Licence."Deregister Date");
                    EmailBody += '<BR><BR>Regards,';
                    EmailBody += '<BR><BR>' + CompInfo.Name;

                    EmailMessage.Create(
                        EmailRecepient,
                        EmailSubject,
                        EmailBody,
                        true
                    );

                    Email.Send(EmailMessage);
                end;
            until Licence.Next() = 0;
        end;
    end;

    procedure fnCheckApprovedCategories(var LRegForm: Record "Licence Registration Form"): Boolean
    begin
        if LRegForm."Application Type" = LRegForm."Application Type"::Registration then begin
            CtgLines.Reset();
            CtgLines.SetRange("Document No.", LRegForm."No.");
            CtgLines.SetRange(Selected, true);
            CtgLines.SetRange(Approve, true);
            if CtgLines.FindSet() then
                exit(true);
        end else begin
            exit(true);
        end;
    end;

    procedure fnNotifyApplicantOnSuccessfulSubmission(var LRegForm: Record "Licence Registration Form"): Boolean
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
    begin
        CompInfo.Get();

        LicenceRegForm.Reset();
        LicenceRegForm.SetRange("No.", LRegForm."No.");
        // LicenceRegForm.SetRange(Submitted, true);
        // LicenceRegForm.SetRange(Status, LicenceRegForm.Status::"Pending Approval");
        if LicenceRegForm.FindSet() then begin
            PortalUsers.Reset();
            PortalUsers.SetRange("User ID", LicenceRegForm."User ID");
            if PortalUsers.FindSet() then begin

                PortalUsers.TestField("E-Mail");
                EmailRecepient.Add(PortalUsers."E-Mail");

                EmailSubject := 'APPLICATION SUBMITTED SUCCESSFULLY: ' + LicenceRegForm."No.";

                EmailBody += 'Hello ' + PortalUsers."First Name" + ',';
                EmailBody += '<BR><BR>Your application has been submitted successfully and is waiting approval by the Licensing Manager. The Application No. is: <B>' + LicenceRegForm."No." + '</B>.';
                EmailBody += '<BR><BR>You may log in to your account and track the application progress from your application history.';
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
        end;
    end;

    procedure fnNotifyApplicantOnSuccessfulPayment(var LRegForm: Record "Licence Registration Form"): Boolean
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
    begin
        CompInfo.Get();

        LicenceRegForm.Reset();
        LicenceRegForm.SetRange("No.", LRegForm."No.");
        // LicenceRegForm.SetRange(Submitted, true);
        // LicenceRegForm.SetRange(Status, LicenceRegForm.Status::"Pending Approval");
        if LicenceRegForm.FindSet() then begin
            PortalUsers.Reset();
            PortalUsers.SetRange("User ID", LicenceRegForm."User ID");
            if PortalUsers.FindSet() then begin

                PortalUsers.TestField("E-Mail");
                EmailRecepient.Add(PortalUsers."E-Mail");

                EmailSubject := 'PAYMENT RECEIVED SUCCESSFULLY';

                EmailBody += 'Hello ' + PortalUsers."First Name" + ',';
                EmailBody += '<BR><BR>Your payment for the Application with the No: <B>' + LicenceRegForm."No." + '</B>. has been received successfully';
                EmailBody += '<BR><BR>The following are the transaction details:-';
                EmailBody += '<BR><B>Application No. :</B> ' + LicenceRegForm."No.";
                EmailBody += '<BR><B>Transaction Code :</B> ' + LicenceRegForm."Transaction Code";
                EmailBody += '<BR><B>Transaction Date :</B> ' + format(LicenceRegForm."Transaction Date");
                EmailBody += '<BR><B>Transaction Amount :</B> ' + format(LicenceRegForm."Amount Received");
                EmailBody += '<BR><B>Payment Status :</B> ' + format(LicenceRegForm."Payment Status");
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
        end;
    end;

    procedure fnSendLicenceAndCert(var Lic: Record Licences): Boolean
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        RecRef: RecordRef;
        TempBlob: Codeunit "Temp Blob";
        InStr: InStream;
        OutStr: OutStream;
    begin
        Licence.Reset();
        Licence.SetRange("Licence ID", Lic."Licence ID");
        if Licence.FindSet() then begin
            RecRef.GetTable(Licence);

            TempBlob.CreateOutStream(OutStr);

            PortalUsers.Reset();
            PortalUsers.SetRange("User ID", Licence."User ID");
            if PortalUsers.FindSet() then begin
                CompInfo.Get();
                PortalUsers.TestField("E-Mail");
                EmailRecepient.Add(PortalUsers."E-Mail");

                EmailSubject := 'PRACTICING LICENSE - ' + Licence."Licence ID" + ' & CERTIFICATE OF REGISTRATION - ' + Licence."Registration No.";
                EmailBody += 'Hello ' + PortalUsers."First Name";
                EmailBody += '<BR><BR>Please find below the Practicing License and Certificate of Registration for the <B>' + Licence."Category Name" + '</B> practice category.';
                EmailBody += '<BR><BR>Regards,';
                EmailBody += '<BR><BR>' + CompInfo.Name;

                EmailMessage.Create(
                    EmailRecepient,
                    EmailSubject,
                    EmailBody,
                    true
                );

                if Report.SaveAs(Report::"Practicing License", '', ReportFormat::Pdf, OutStr, RecRef) then begin
                    TempBlob.CreateInStream(InStr);

                    EmailMessage.AddAttachment(
                        StrSubstNo('Practicing License - %1.pdf', Licence."Licence ID"),
                        'PDF',
                        InStr
                    );
                end;

                if Report.SaveAs(Report::"Certificate of Registration", '', ReportFormat::Pdf, OutStr, RecRef) then begin
                    TempBlob.CreateInStream(InStr);

                    EmailMessage.AddAttachment(
                        StrSubstNo('Certificate of Registration - %1.pdf', Licence."Registration No."),
                        'PDF',
                        InStr
                    );
                end;

                if Email.Send(EmailMessage) then
                    exit(true)
            end;
        end;
    end;
}
