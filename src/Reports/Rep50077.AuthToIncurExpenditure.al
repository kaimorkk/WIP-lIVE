report 50077 "Auth To Incur Expenditure"
{
    Caption = 'Authority To Incur Expenditure';
    //DataAccessIntent = ReadOnly;
    DefaultLayout = RDLC;
    RDLCLayout = './src/report/Rep50077.AuthToIncurExpenditure.rdl';

    dataset
    {
        dataitem(AuthIncExpendHeader; "Auth. Inc. Expend. Header")
        {
            Calcfields = "Amount to Authorize";
            column(No_; "No.")
            {
            }
            column(AIERefNo; GetAIERefNo(AuthIncExpendHeader))
            {
            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {
            }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {
            }
            column(Address; GetCourtAddress(AuthIncExpendHeader))
            {
            }
            column(Quarter; GetQuarterNarration(AuthIncExpendHeader))
            {
            }
            column(Reporting_Period; "Reporting Period")
            {
            }
            column(Amount_to_Authorize; "Amount to Authorize")
            {
            }
            column(PreparedBy; PreparedBy.GetFullName(PreparedBy."User ID"))
            {
            }
            // column(PreparedByDesignation; PreparedBy."Job Tittle")
            // {
            // }
            // column(PreparedBySignature; CashMgnt."Sender QR Code")
            // {
            // }
            column(PreparedByDateTime; ApprovalDates[1])
            {
            }
            column(ApprovedBy; ApprovedBy.GetFullName(ApprovedBy."User ID"))
            {
            }
            column(ApprovedByDesignation; JobTitle)
            {
            }
            // column(ApprovedBySignature; CashMgnt."Approver 1 QR Code")
            // {
            // }
            column(ApprovedByDateTime; ApprovalDates[2])
            {
            }
            column(CourtStation; CourtStation)
            {
            }
            column(AmountInWords; AmountInWords)
            {
            }
            dataitem("Auth. Inc Expend. Line"; "Auth. Inc Expend. Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = AuthIncExpendHeader;
                column(G_L_Account; "G/L Account")
                {
                }
                column(G_L_Account_Name; "G/L Account Name")
                {
                }
                column(Amount_to_Authorize_Lines; "Amount to Authorize")
                {
                }
                column(Global_Dimension_1_Code_Lines; "Global Dimension 1 Code")
                {
                }
                column(Global_Dimension_2_Code_Lines; "Global Dimension 2 Code")
                {
                }
                column(Shortcut_Dimension_3_Code; "Shortcut Dimension 3 Code")
                {
                }
                column(Shortcut_Dimension_4_Code; "Shortcut Dimension 4 Code")
                {
                }
                column(Shortcut_Dimension_5_Code; "Shortcut Dimension 5 Code")
                {
                }
                column(Shortcut_Dimension_6_Code; "Shortcut Dimension 6 Code")
                {
                }
                column(Shortcut_Dimension_7_Code; "Shortcut Dimension 7 Code")
                {
                }
                column(Shortcut_Dimension_8_Code; "Shortcut Dimension 8 Code")
                {
                }
                trigger OnAfterGetRecord()
                begin
                    //For the special AIE, the details are from the lines.
                    if AuthIncExpendHeader.Type = AuthIncExpendHeader.Type::Custom then begin
                        AuthIncExpendHeader."Global Dimension 1 Code" := "Global Dimension 1 Code";
                        AuthIncExpendHeader."Global Dimension 2 Code" := "Global Dimension 2 Code";
                    end;
                end;
            }
            trigger OnAfterGetRecord()
            var
                NoText: array[2] of Text;
                BatchAIE: Record "Batch. Auth to Incur Expend";
                Txt: Text;
            begin
                GetQRCodes(AuthIncExpendHeader."No.");
                Clear(ApprovalDates);
                Clear(PreparedBy);
                Clear(ApprovedBy);
                clear(CourtStation);
                if "Batch No." <> '' then begin
                    BatchAIE.Get("Batch No.");
                    ApprovalsMgt.GetDocApprovers(AuthIncExpendHeader.RecordId, PreparedBy, ApprovedBy, ApprovalDates);
                end else
                    ApprovalsMgt.GetDocApprovers(AuthIncExpendHeader.RecordId, PreparedBy, ApprovedBy, ApprovalDates);
                if Emp.Get(ApprovedBy."Employee No.") then
                    JobTitle := Emp."Job Title2";
                // PayMgt.InitTextVariable();
                // PayMgt.FormatNoText(NoText, "Amount to Authorize", '');
                // AmountInWords := NoText[1];
                Txt := CopyStr(AmountInWords, strlen(AmountInWords) - 9, 10);
                if Txt = ' AND 0/100' then begin

                    AmountInWords := CopyStr(AmountInWords, 6, strlen(AmountInWords) - 15);
                end else begin
                    Txt := CopyStr(AmountInWords, strlen(AmountInWords) - 3, 4);
                    if Txt = ' AND' then begin
                        AmountInWords := CopyStr(AmountInWords, 6, strlen(AmountInWords) - 9);
                    end;
                end;

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        WorkplanMgt: Codeunit "Workplan Management";
        Emp: Record "Employee";
        JobTitle: Text[250];
        PreparedBy: Record "User Setup";
        ApprovedBy: Record "User Setup";
        ApprovalDates: array[2] of DateTime;
        ApprovalsMgt: Codeunit "Custom Approvals Codeunit";
        // PayMgt: Codeunit "Payments-Post";
        AmountInWords, CourtStation, PreparedByUser : Text;
    // CashMgnt: Record "Digital Signature";

    local procedure GetAIERefNo(AuthIncExp: Record "Auth. Inc. Expend. Header"): Text
    var
        Quarter: Text;
        AIEType: Text;
    begin
        Quarter := getQuarterNarration(AuthIncExp);
        if AuthIncExp.Type = AuthIncExp.Type::Default then
            AIEType := 'Quarterly AIE'
        else
            AIEType := 'Special AIE';

        exit(StrSubstNo('JUD/%1/%2/%3/000', AuthIncExp."Reporting Period", Quarter, AIEType));
    end;

    local procedure GetQuarterNarration(AuthIncExp: Record "Auth. Inc. Expend. Header") Quarter: Text;
    begin
        case
             AuthIncExp.Quarter of
            AuthIncExp.Quarter::"Quarter 1":
                Quarter := 'First Quarter';
            AuthIncExp.Quarter::"Quarter 2":
                Quarter := 'Second Quarter';
            AuthIncExp.Quarter::"Quarter 3":
                Quarter := 'Third Quarter';
            AuthIncExp.Quarter::"Quarter 4":
                Quarter := 'Fourth Quarter';
        end;
    end;

    procedure GetCourtAddress(AuthIncExp: Record "Auth. Inc. Expend. Header"): Text
    var
        RespCenter: Record "Responsibility Center";
        TextBuild: TextBuilder;
        JobPosition: Record "Company Positions";
        DimensionValues: Record "Dimension Value";
        AIELine: Record "Auth. Inc Expend. Line";
    begin
        RespCenter.Reset();

        if AuthIncExp.Type = AuthIncExp.Type::Default then begin
            RespCenter.SetRange("Global Dimension 1 Code", AuthIncExp."Global Dimension 1 Code");
            RespCenter.SetRange("Global Dimension 2 Code", AuthIncExp."Global Dimension 2 Code");
        end else begin
            AIELine.Reset();
            AIELine.SetRange("Document No.", AuthIncExp."No.");
            AIELine.FindFirst();
            if AuthIncExp.Mobile then begin
                RespCenter.SetRange("Global Dimension 2 Code", AuthIncExp."Funded Unit");
            end else begin
                RespCenter.SetRange("Global Dimension 1 Code", AIELine."Global Dimension 1 Code");
                RespCenter.SetRange("Global Dimension 2 Code", AIELine."Global Dimension 2 Code");
            end;
        end;
        if RespCenter.FindFirst() then begin
            CourtStation := RespCenter.Name;
            if JobPosition.Get(RespCenter."Headed By (Title)") then;
            Clear(TextBuild);
            TextBuild.AppendLine(StrSubstNo('%1 ,', JobPosition."Job Title"));
            //TextBuild.AppendLine(StrSubstNo('%1 ,', RespCenter."Address 2"));
            TextBuild.AppendLine(StrSubstNo('%1 ,', RespCenter.Name));
            TextBuild.AppendLine(StrSubstNo('%1 - %2', RespCenter.Address, RespCenter."Post Code"));
            TextBuild.AppendLine(RespCenter.City);
            exit(TextBuild.ToText());
        end else
            Error('There is no responsibility center setup for %1 %2 %3 %4', RespCenter.FieldCaption("Global Dimension 1 Code"),
                    AuthIncExp."Global Dimension 1 Code", RespCenter.FieldCaption("Global Dimension 2 Code"), AuthIncExp."Global Dimension 2 Code");
    end;

    procedure GetQRCodes(PvNo: Text)
    var
        // MemoryStream: dotnet MemoryStream;
        Ostream: OutStream;
        // Bytes: dotnet Array;
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        OutStream: OutStream;
        HrEmp: Record Employee;
        EmpName: Text;
        B64: BigText;
        ByteCount: Integer;
        Base64Convert: Codeunit "Base64 Convert";
        // QRCodeUnit: Codeunit QRCodeUnit;
        // Convert: dotnet Convert/;
        OTP: Record Otp;
        ApprovalEntry: Record "Approval Entry";
        PVHeader: Record "Auth. Inc. Expend. Header";
        ApprovalEntries: Record "Approval Entry";
        i: Integer;
        ApprovalsMgt: Codeunit "Approvals Mgmt.";
        UserSetup: Record "User Setup";
    begin
        PVHeader.Get(PvNo);
        ApprovalEntry.Reset();
        ApprovalEntry.setrange(ApprovalEntry."Document No.", PvNo);
        //ApprovalEntry.setrange(ApprovalEntry.Status, ApprovalEntry.Status::Approved);
        // if ApprovalEntry.find('-') then begin
        //     CashMgnt.DeleteAll();
        //     CashMgnt.Init();
        //     if UserSetup.Get(ApprovalEntry."Sender ID") then
        //         if HrEmp.Get(UserSetup."Employee No.") then EmpName := '; Initiator:  PJ: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
        //     B64 := QRCodeUnit.GenerateApprovalQRCode(50106, PvNo, EmpName, ApprovalEntry."Date-Time Sent for Approval", '', HrEmp."Phone No.");
        //     Bytes := Convert.FromBase64String(B64);
        //     MemoryStream := MemoryStream.MemoryStream(Bytes);
        //     CashMgnt."Sender QR Code".CreateOutStream(OutStream);
        //     Base64Convert.FromBase64(Format(B64), OutStream);
        //     // EXR.Reset;
        //     // EXR.SetRange("No.", PVHeader."Expenditure Requisition Code");
        //     // if EXR.FindFirst() then
        //     //     if UserSetup.Get(EXRApprovers[3]."User ID") then
        //     //         if HrEmp.Get(UserSetup."Employee No.") then EmpName := '; AIE Holder:  PJ: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
        //     // B64 := QRCodeUnit.GenerateApprovalQRCode(50110, EXR."No.", EmpName, EXRApprovalDates[3], OTP."OTP Code", HrEmp."Phone No.");
        //     // Bytes := Convert.FromBase64String(B64);
        //     // MemoryStream := MemoryStream.MemoryStream(Bytes);
        //     // CashMgnt."AIE QR Code".CreateOutStream(OutStream);
        //     // Base64Convert.FromBase64(Format(B64), OutStream);

        //     ApprovalEntries.Reset;
        //     ApprovalEntries.SetRange("Table ID", 50106);
        //     ApprovalEntries.SetRange("Document No.", PvNo);
        //     ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
        //     if ApprovalEntries.FindSet() then begin
        //         i := 0;
        //         repeat
        //             i := i + 1;
        //             if ApprovalEntries."Sequence No." = 1 then begin
        //                 PreparedByUser := ApprovalEntries."Sender ID";
        //                 if UserSetup.Get(ApprovalEntries."Approver ID") then
        //                     if HrEmp.Get(UserSetup."Employee No.") then EmpName := '; Approver:  PJ: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
        //                 B64 := QRCodeUnit.GenerateApprovalQRCode(50106, PvNo, EmpName, ApprovalEntries."Last Date-Time Modified", '', HrEmp."Phone No.");
        //                 Bytes := Convert.FromBase64String(B64);
        //                 MemoryStream := MemoryStream.MemoryStream(Bytes);
        //                 CashMgnt."Approver 1 QR Code".CreateOutStream(OutStream);
        //                 Base64Convert.FromBase64(Format(B64), OutStream)

        //             end;
        //             if ApprovalEntries."Sequence No." = 2 then begin

        //                 if UserSetup.Get(ApprovalEntries."Approver ID") then
        //                     if HrEmp.Get(UserSetup."Employee No.") then EmpName := '; Approver:  PJ: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
        //                 B64 := QRCodeUnit.GenerateApprovalQRCode(50106, PvNo, EmpName, ApprovalEntries."Last Date-Time Modified", '', HrEmp."Phone No.");
        //                 Bytes := Convert.FromBase64String(B64);
        //                 MemoryStream := MemoryStream.MemoryStream(Bytes);
        //                 CashMgnt."Approver 2 QR Code".CreateOutStream(OutStream);
        //                 Base64Convert.FromBase64(Format(B64), OutStream)
        //             end;

        //             if ApprovalEntries."Sequence No." = 3 then begin

        //                 if UserSetup.Get(ApprovalEntries."Approver ID") then
        //                     if HrEmp.Get(UserSetup."Employee No.") then EmpName := '; Approver:  PJ: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
        //                 B64 := QRCodeUnit.GenerateApprovalQRCode(50106, PvNo, EmpName, ApprovalEntries."Last Date-Time Modified", '', HrEmp."Phone No.");
        //                 Bytes := Convert.FromBase64String(B64);
        //                 MemoryStream := MemoryStream.MemoryStream(Bytes);
        //                 CashMgnt."Approver 3 QR Code".CreateOutStream(OutStream);
        //                 Base64Convert.FromBase64(Format(B64), OutStream)

        //             end;
        //         until
        //        ApprovalEntries.Next = 0;
        //     end;
        //     CashMgnt.Insert();
        //     if CashMgnt.Get() then begin
        //         CashMgnt.CalcFields("Sender QR Code");
        //         CashMgnt.CalcFields("Approver 1 QR Code");
        //         CashMgnt.CalcFields("AIE QR Code");
        //         CashMgnt.CalcFields("Approver 2 QR Code");
        //         CashMgnt.CalcFields("Approver 3 QR Code");
        //     end;
        // end else begin
        //     CashMgnt.Delete();
        // end;
    end;
}
