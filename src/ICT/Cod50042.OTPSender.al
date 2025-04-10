codeunit 52193428 "OTP Sender"
{



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeApproveSelectedApprovalRequest', '', false, false)]
    local procedure BypassUserIDCheck(ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)
    var
        EftHeader: Record "EFT Header";
        SentOTP: Text[10];
        InputOTP: Text[10];
        IsValidOTP: Boolean;
        OTPDialogPage: page "OTP Dialog";
        EmployeeMngt: Record Employee;
        MessageLabel: Label 'EFT Document Approval';
        OTPCode: Text;

        PvLines: Record "PV Lines";
        Payment: Record "Payments";

        IsBankValid: Boolean;
        // OutwardPayment: Codeunit OutwardPayment;
        Progress: Dialog;
        Text00: Label 'Validating Bank Account For ....#';
        Counter: Integer;

    begin
        IsHandled := false;

        if ApprovalEntry."Approver ID" = UserId then begin
            if ApprovalEntry."Table ID" = 57018 then begin
                EftHeader.Reset();
                EftHeader.SetRange(No, ApprovalEntry."Document No.");
                if EftHeader.FindFirst() then begin
                    EmployeeMngt.Reset();
                    EmployeeMngt.SetRange("User ID", ApprovalEntry."Approver ID");
                    EmployeeMngt.FindFirst();
                    EmployeeMngt.TestField("Phone No.");

                    //EmployeeMngt."Phone No."


                    SentOTP := GenerateAndSendOTP(ApprovalEntry."Approver ID", EmployeeMngt."Phone No.", ApprovalEntry."Document No.");

                    if OTPDialogPage.RunModal() = Action::OK then begin
                        OTPCode := OTPDialogPage.getOTP();
                        if OTPCode = '' then
                            Error('Invalid OTP code');
                        IsValidOTP := ValidateOTP(OTPCode, SentOTP);


                        if IsValidOTP then begin
                            Message('OTP Code Validated');
                            IsHandled := true;

                            ApprovalEntry."Approval OTP" := SentOTP;
                            ApprovalEntry."OTP Expiry" := CurrentDateTime + 300000;
                            //ApprovalEntry.Modify(false);
                            StoreOTP(ApprovalEntry."Approver ID", EmployeeMngt."Phone No.", ApprovalEntry."Document No.", SentOTP, 57018, 2, ApprovalEntry."Sequence No.");
                        end else begin
                            Error('Invalid OTP code or OTP has expired.');
                        end;


                    end
                    else begin
                        Error('OTP input was cancelled.');
                    end;

                end;
            end;

            if ApprovalEntry."Table ID" = 57000 then begin
                Payment.Reset();
                // Payment.SetRange("No.", ApprovalEntry."Document No.");
                if Payment.FindFirst() then begin
                    // PvLines.Reset();
                    // PVLines.SetRange(No, Payment."No.");
                    // Progress.Open(Text00, Counter);
                    // if PvLines.FindSet() then
                    //     repeat
                    //         IsBankValid := OutwardPayment.validateBankAccount(PvLines."Payee Bank Account No.", PvLines."Payee Bank Code");
                    //         if IsBankValid then begin
                    //             IsHandled := true;
                    //             PvLines.isBankValid := 'Valid Bank Account';
                    //         end
                    //         else begin
                    //             PvLines.isBankValid := 'Invalid Bank Account';



                    //         end;
                    //         Counter := Counter + 1;
                    //         Progress.UPDATE();
                    //         SLEEP(50);
                    //         PvLines.Modify();
                    //     until PvLines.Next() = 0;
                    EmployeeMngt.Reset();
                    EmployeeMngt.SetRange("User ID", ApprovalEntry."Approver ID");
                    EmployeeMngt.FindFirst();
                    EmployeeMngt.TestField("Phone No.");
                    //EmployeeMngt."Phone No."

                    SentOTP := GenerateAndSendOTP(ApprovalEntry."Approver ID", EmployeeMngt."Phone No.", ApprovalEntry."Document No.");

                    if OTPDialogPage.RunModal() = Action::OK then begin
                        OTPCode := OTPDialogPage.getOTP();
                        if OTPCode = '' then
                            Error('Invalid OTP code');
                        IsValidOTP := ValidateOTP(OTPCode, SentOTP);


                        if IsValidOTP then begin
                            Message('OTP Code Validated');
                            IsHandled := true;

                            ApprovalEntry."Approval OTP" := SentOTP;
                            ApprovalEntry."OTP Expiry" := CurrentDateTime + 300000;
                            //ApprovalEntry.Modify(false);
                            StoreOTP(ApprovalEntry."Approver ID", EmployeeMngt."Phone No.", ApprovalEntry."Document No.", SentOTP, 57000, 2, ApprovalEntry."Sequence No.");
                        end else begin
                            Error('Invalid OTP code or OTP has expired.');
                        end;


                    end
                    else begin
                        Error('OTP input was cancelled.');
                    end;

                end;
            end;

        end;
        // Sleep(1);
        // Progress.Close();
    end;


    /// <summary>
    /// sendOTPToSender.
    /// </summary>
    /// <param name="DocNo">Code[20].</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure sendOTPToSender(DocNo: Code[20]): Boolean;
    var
        EmployeeMngt: Record Employee;
        SentOTP: Text[10];
        InputOTP: Text[10];
        IsValidOTP: Boolean;
        OTPDialogPage: page "OTP Dialog";
        MessageLabel: Label 'EFT Document Approval';
        OTPCode: Text;
        isValid: Boolean;
        ApprovalEntry: Record "Approval Entry";




    begin
        isValid := false;
        ApprovalEntry.reset();
        ApprovalEntry.setRange("Document No.", DocNo);


        if ApprovalEntry.FindFirst() then begin

            EmployeeMngt.Reset();
            EmployeeMngt.SetRange("User ID", UserId);
            EmployeeMngt.FindFirst();
            EmployeeMngt.TestField("Phone No.");

            SentOTP := GenerateAndSendOTP(ApprovalEntry."Sender ID", EmployeeMngt."Phone No.", ApprovalEntry."Document No.");
            if OTPDialogPage.RunModal() = Action::OK then begin
                OTPCode := OTPDialogPage.getOTP();
                if OTPCode = '' then
                    Error('Invalid OTP code');
                IsValidOTP := ValidateOTP(OTPCode, SentOTP);


                if IsValidOTP then begin
                    Message('OTP Code Validated');

                    ApprovalEntry."Approval OTP" := SentOTP;
                    ApprovalEntry."OTP Expiry" := CurrentDateTime + 300000;
                    StoreOTP(ApprovalEntry."Sender ID", EmployeeMngt."Phone No.", ApprovalEntry."Document No.", SentOTP, 57000, 2, ApprovalEntry."Sequence No.");
                    isValid := true;
                end else begin
                    Error('Invalid OTP code or OTP has expired.');
                end;


            end
            else begin
                Error('OTP input was cancelled.');
            end;


        end;

        exit(isValid);


    end;











    /// <summary>
    /// GenerateRandomOTPCode.
    /// </summary>
    /// <param name="CodeLength">Integer.</param>
    /// <returns>Return value of type Text.</returns>
    procedure GenerateRandomOTPCode(CodeLength: Integer): Text
    var
        OTP: Text;
        Characters: Text;
        RandomIndex: Integer;
        I: Integer;
    begin
        Characters := '0123456789';
        OTP := '';

        if CodeLength <= 0 then
            Error('Code length must be greater than zero.');

        // Initialize the random number generator
        Randomize;

        // Generate the OTP code
        for I := 1 to CodeLength do begin
            RandomIndex := Random(StrLen(Characters));
            OTP := OTP + CopyStr(Characters, RandomIndex, 1);
        end;

        exit(OTP);
    end;






    /// <summary>
    /// GenerateAndSendOTP.
    /// </summary>
    /// <param name="UserID">Code[20].</param>
    /// <param name="PhoneNumber">Text[14].</param>
    /// <param name="DocumentNo">Code[20].</param>
    /// <returns>Return value of type Text[10].</returns>
    procedure GenerateAndSendVendorOTP(VendorNum: Code[20]): Text[10]
    var
        OTPCode: Text[10];

        SMSService: Codeunit "SMS Integration Management";
        MaskedPhoneNumber: Text;
        VendorsRec: Record Vendor;
    begin
        VendorsRec.Reset();
        VendorsRec.SetRange("No.", VendorNum);
        if VendorsRec.FindFirst() then begin
            OTPCode := GenerateRandomOTPCode(6);
            ExpirationTime := CurrentDateTime + 300000;
            MaskedPhoneNumber := '********' + CopyStr(VendorsRec."Phone No.", 9, 6);
            // Send the OTP code via SMS
            if SMSService.SendSMS(VendorsRec."Phone No.", OTPCode) then begin
                Message('OTP sent successfully to %1', MaskedPhoneNumber);
                exit(OTPCode);
            end else begin
                Error('Failed to send OTP to %1', MaskedPhoneNumber);
                exit('');
            end;
        end;
    end;


    procedure GenerateAndSendOTP(UserID: Code[20]; PhoneNumber: Text[14]; DocumentNo: Code[20]): Text[10]
    var
        OTPCode: Text[10];

        SMSService: Codeunit "SMS Integration Management";
        MaskedPhoneNumber: Text;

    begin
        OTPCode := GenerateRandomOTPCode(6);
        ExpirationTime := CurrentDateTime + 300000;
        MaskedPhoneNumber := '********' + CopyStr(PhoneNumber, 9, 6);

        // Send the OTP code via SMS
        if SMSService.SendSMS(PhoneNumber, OTPCode) then begin
            Message('OTP sent successfully to %1', MaskedPhoneNumber);
            exit(OTPCode);
        end else begin
            Error('Failed to send OTP to %1', MaskedPhoneNumber);
            exit('');
        end;
    end;

    /// <summary>
    /// ValidateOTP.
    /// </summary>
    /// <param name="UserEnteredOTP">Text[10].</param>
    /// <param name="SentOTP">Text[10].</param>
    /// <returns>Return value of type Boolean.</returns>

    procedure ValidateOTP(UserEnteredOTP: Text[10]; SentOTP: Text[10]): Boolean
    begin
        if (UserEnteredOTP = SentOTP) and (CurrentDateTime <= ExpirationTime) then
            exit(true)
        else
            exit(false);
    end;





    /// <summary>
    /// StoreOTP.
    /// </summary>
    /// <param name="UserID">Code[20].</param>
    /// <param name="PhoneNumber">Text[14].</param>
    /// <param name="DocumentNo">Code[20].</param>
    procedure StoreOTP(UserID: Code[20]; PhoneNumber: Text[14]; DocumentNo: Code[20]; OTPCode: Text; TableID: Integer; OTPType: Option; SequenceNo: Integer)
    var
        //OTPCode: Code[10];
        ExpirationTime: DateTime;
        // OTPTable: Record "OTP";
        SMSSetup: Record "SMS Setup";
        lapseTime: Duration;
        // QRCodeUnit: Codeunit QRCodeUnit;
        // //Convert: dotnet Convert;
        // MemoryStream: dotnet MemoryStream;
        Ostream: OutStream;
        // //Bytes: dotnet Array;
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        OutStream: OutStream;
        HrEmp: Record Employee;
        EmpName: Text;
        B64: BigText;
        ByteCount: Integer;
        Base64Convert: Codeunit "Base64 Convert";
    begin
        //OTPCode := GenerateRandomOTPCode(6);
        // Message('INSIDE otp store');
        // Message(OTPCode);
        // Message(PhoneNumber);
        // Message(DocumentNo);
        lapseTime := 300000;
        ExpirationTime := CurrentDateTime + lapseTime;
        // OTPTable.Reset();
        // if OTPTable.FindLast() then begin

        //     OTPTable.Init();
        //     // OTPTable."Entry No" := GetNextEntryNo();
        //     OTPTable."Entry No" := OTPTable."Entry No" + 1;
        //     OTPTable."User ID" := UserID;
        //     OTPTable."OTP Code" := OTPCode;
        //     OTPTable."Creation Time" := CurrentDateTime;
        //     OTPTable."Expiration Time" := ExpirationTime;
        //     OTPTable."Used" := false;
        //     OTPTable."Phone Number" := PhoneNumber;
        //     OTPTable."Document No" := DocumentNo;
        //     OTPTable."Table ID" := TableID;
        //     OTPTable."OTP Type" := OTPType;
        //     OTPTable."Approval Sequence" := SequenceNo;
        //     if OTPType = 2 then begin
        //         HrEmp.Reset();
        //         HrEmp.SetRange(HrEmp."User ID", UserID);
        //         if HrEmp.Find('-') then
        //             EmpName := HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
        //         B64 := QRCodeUnit.GenerateApprovalQRCode(TableID, DocumentNo, EmpName, CurrentDateTime, OTPCode, HrEmp."Phone No.");
        //         Bytes := Convert.FromBase64String(B64);
        //         MemoryStream := MemoryStream.MemoryStream(Bytes);
        //         ByteCount := StrLen(ConvertBigTextToText(B64)) / 4 * 3;
        //         //OutStream.Write(Bytes, ByteCount);
        //         OTPTable."Approval QR Code".CreateOutStream(OutStream);
        //         Base64Convert.FromBase64(Format(B64), OutStream);
        //     end;
        //     // MemoryStream := MemoryStream.MemoryStream(Bytes);
        //     // OTPTable."Approval QR Code".ImportStream(MemoryStream, '', DocumentNo);
        //     OTPTable.Insert();

        // end
        // else begin
        //     OTPTable.Init();
        //     // OTPTable."Entry No" := GetNextEntryNo();
        //     OTPTable."User ID" := UserID;
        //     OTPTable."OTP Code" := OTPCode;
        //     OTPTable."Creation Time" := CurrentDateTime;
        //     OTPTable."Expiration Time" := ExpirationTime;
        //     OTPTable."Used" := false;
        //     OTPTable."Phone Number" := PhoneNumber;
        //     OTPTable."Document No" := DocumentNo;
        //     OTPTable."Table ID" := TableID;
        //     HrEmp.Reset();
        //     HrEmp.SetRange(HrEmp."User ID", UserID);
        //     if HrEmp.Find('-') then
        //         EmpName := '; Approver: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";

        //     B64 := QRCodeUnit.GenerateApprovalQRCode(TableID, DocumentNo, EmpName, CurrentDateTime, OTPCode, HrEmp."Phone No.");
        //     Bytes := Convert.FromBase64String(B64);
        //     MemoryStream := MemoryStream.MemoryStream(Bytes);
        //     OTPTable."Approval QR Code".CreateOutStream(MemoryStream);
        //     // OTPTable."Approval QR Code".ImportStream(MemoryStream, '', DocumentNo);           
        //     OTPTable.Insert()

        // end;
    end;


    procedure ConvertBigTextToText(var BigTextData: BigText): Text
    var
        TempText: Text[250];
        ResultText: Text;
        Position: Integer;
    begin
        Position := 1;
        while Position <= BigTextData.Length do begin
            // Extract a chunk of 250 characters
            BigTextData.GetSubText(TempText, Position, 250);
            // Concatenate the extracted text to the result
            ResultText := ResultText + TempText;
            // Move the position forward by 250 characters
            Position := Position + 250;
        end;

        exit(ResultText);
    end;



    procedure StoreOTP(UserID: Code[20]; PhoneNumber: Text[14]; DocumentNo: Code[20])
    var
        OTPCode: Code[10];
        ExpirationTime: DateTime;
        OTPTable: Record "OTP";
        lapseTime: Duration;
        LastEntryNo: Integer;
    begin
        OTPCode := GenerateRandomOTPCode(6);
        lapseTime := 300000;
        ExpirationTime := CurrentDateTime + lapseTime;

        OTPTable.SetRange("User ID", UserID);
        if OTPTable.FindLast() then
            LastEntryNo := OTPTable."Entry No"
        else
            LastEntryNo := 0;

        OTPTable.Init();
        OTPTable."Entry No" := LastEntryNo + 1;
        OTPTable."User ID" := UserID;
        OTPTable."OTP Code" := OTPCode;
        OTPTable."Creation Time" := CurrentDateTime;
        OTPTable."Expiration Time" := ExpirationTime;
        OTPTable."Used" := false;
        OTPTable."Phone Number" := PhoneNumber;
        OTPTable."Document No" := DocumentNo;

        // Insert the OTP record
        if not InsertOTPRecord(OTPTable) then
            Error('Failed to insert OTP.');
    end;

    procedure InsertOTPRecord(var OTPTable: Record "OTP"): Boolean
    begin
        exit(OTPTable.Insert());
    end;


    //  procedure GetNextEntryNo(): Integer
    //     var
    //         OTPTable: Record "OTP";
    //         MaxEntryNo: Integer;
    //     begin
    //         MaxEntryNo := 0;

    //         if OTPTable.FindLast() then
    //             MaxEntryNo := OTPTable."Entry No";

    //         exit(MaxEntryNo + 1);
    //     end;


    // procedure GetOTPForUser(UserId: Code[20]; ReceivedOTP: Text[10]): Boolean;
    //     var
    //         OTPTable: Record 50140;
    //         StoredOTP: Text[10];
    //         ExpirationTime: DateTime;
    //         IsUsed: Boolean;
    //         IsValidOTP: Boolean;
    //     begin
    //         IsValidOTP := false;

    //         OTPTable.SetRange("User ID", UserId);
    //         OTPTable.SetRange("Used", false);
    //         OTPTable.SetFilter("Expiration Time", '<=%1', CurrentDateTime);

    //         if OTPTable.FindLast() then begin
    //             StoredOTP := OTPTable."OTP Code";
    //             ExpirationTime := OTPTable."Expiration Time";
    //             IsUsed := OTPTable."Used";

    //             IsValidOTP := (ReceivedOTP = StoredOTP) and (ExpirationTime >= CurrentDateTime) and not IsUsed;
    //         end;

    //         Exit(IsValidOTP);

    //     end;










    var
        ExpirationTime: DateTime;
}