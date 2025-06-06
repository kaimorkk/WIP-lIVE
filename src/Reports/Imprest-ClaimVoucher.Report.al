//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
    //assembly("ForNav.Reports.7.3.0.2559")
    // {
    //   type(ForNav.Report_7_3_0_2559; ForNavReport51511014_v7_3_0_2559) { }
    //}
    //assembly("mscorlib")
    //  {
    //    Version = '4.0.0.0';
    //    type("System.IO.Stream"; SystemIOStream51511014) { }
    //type("System.IO.Path"; System_IO_Path51511014) { }
    //   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193453 "Imprest-Claim Voucher"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/Imprest-ClaimVoucher.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Request Header1"; "Request Header1")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(ReportForNavId_5386; 5386) { } // Autogenerated by ForNav - Do not delete
            column(city; CompanyInfo.City)
            {
            }
            column(phone; CompanyInfo."Phone No.")
            {
            }
            column(postcode; CompanyInfo."Post Code")
            {
            }
            column(address2; CompanyInfo."Address 2")
            {
            }
            column(address1; CompanyInfo.Address)
            {
            }
            column(name; CompanyInfo.Name)
            {
            }
            column(picture; CompanyInfo.Picture)
            {
            }
            column(email; CompanyInfo."E-Mail")
            {
            }
            column(PurposeofImprest_RequestHeader1; "Request Header1"."Purpose of Imprest")
            {
            }
            column(TripStartDate_RequestHeader1; "Request Header1"."Trip Start Date")
            {
            }
            column(TripExpectedEndDate_RequestHeader1; "Request Header1"."Trip Expected End Date")
            {
            }
            column(NoofDays_RequestHeader1; "Request Header1"."No. of Days")
            {
            }
            column(ChequeNo_RequestHeader1; "Request Header1"."Cheque No")
            {
            }
            column(website; CompanyInfo."Home Page")
            {
            }
            column(Request_Header1__No__; "Request Header1"."No.")
            {
            }
            column(Request_Header1__Request_Date_; "Request Header1"."Request Date")
            {
            }
            column(Request_Header1__Employee_Name_; "Request Header1"."Employee Name")
            {
            }
            column(CompName; CompName)
            {
            }
            column(IMPREST_CLAIM_FORMCaption; IMPREST_CLAIM_FORMCaptionLbl)
            {
            }
            column(Request_Header1__No__Caption; FieldCaption("No."))
            {
            }
            column(Request_Header1__Request_Date_Caption; FieldCaption("Request Date"))
            {
            }
            column(Request_Header1__Employee_Name_Caption; FieldCaption("Employee Name"))
            {
            }
            column(EmployeeName_RequestHeader1; "Request Header1"."Employee Name")
            {
            }
            column(Department_Caption; Department_CaptionLbl)
            {
            }
            column(Total_Amount_Requested; "Request Header1"."Total Amount Requested")
            {
            }
            column(Imprest_Amount; "Request Header1"."Imprest Amount")
            {
            }
            column(Transaction_Type; "Transaction Type")
            {
            }
            column(Type; Type)
            {
            }
            column(Imprest_Type; "Imprest Type")
            {
            }
            dataitem("Request Lines1"; "Request Lines1")
            {
                DataItemLink = "Document No" = field("No.");
                DataItemTableView = sorting("Document No", "Line No.");
                column(ReportForNavId_1475; 1475) { } // Autogenerated by ForNav - Do not delete
                column(Request_Lines1_Description; "Request Lines1".Description)
                {
                }
                column(Description_RequestLines1; "Request Lines1".Description)
                {
                }
                column(Amount_RequestLines1; "Request Lines1".Amount)
                {
                }
                column(AccountType_RequestLines1; "Request Lines1"."Account Type")
                {
                }
                column(AccountNo_RequestLines1; "Request Lines1"."Account No")
                {
                }
                column(Request_Lines1__Request_Lines1___Requested_Amount_; "Request Lines1".Amount)
                {
                }
                column(Request_Lines1__Account_No_; "Request Lines1"."Account No")
                {
                }
                column(Request_Lines1__Quantity; "Request Lines1".Quantity)
                {
                }
                column(Request_Lines1__Unit_of_Measure; "Request Lines1"."Unit of Measure")
                {
                }
                column(Request_Lines1__Unit_Price; "Request Lines1"."Unit Price")
                {
                }
                column(STRSUBSTNO___1__2__CurrencyCodeText__Request_Lines1___Requested_Amount__; StrSubstNo('%1 %2', CurrencyCodeText, "Request Lines1".Amount))
                {
                }
                column(STRSUBSTNO___1__2__CurrencyCodeText__Request_Header1___Imprest_Amount__; StrSubstNo('%1 %2', CurrencyCodeText, "Request Header1"."Total Amount Requested"))
                {
                }
                column(STRSUBSTNO___1__2__CurrencyCodeText_Netamt_; StrSubstNo('%1 %2', CurrencyCodeText, Netamt))
                {
                }
                column(EmptyString; '_______________________________________')
                {
                }
                column(UserRecApp3_Picture; UserRecApp3.Picture)
                {
                }
                column(V3rdapproverdate_; "3rdapproverdate")
                {
                }
                column(V3rdapprover_; "3rdapprover")
                {
                }
                column(UserRecApp2_Picture; UserRecApp2.Picture)
                {
                }
                column(V2ndapprover_; "2ndapprover")
                {
                }
                column(V2ndapproverdate_; "2ndapproverdate")
                {
                }
                column(V1stapprover_; "1stapprover")
                {
                }
                column(UserRecApp1_Picture; UserRecApp1.Picture)
                {
                }
                column(V1stapproverdate_; "1stapproverdate")
                {
                }
                column(DescriptionCaption; DescriptionCaptionLbl)
                {
                }
                column(AmountCaption; AmountCaptionLbl)
                {
                }
                column(Request_Lines1__Account_No_Caption; FieldCaption("Account No"))
                {
                }
                column(TOTAL_EXPENSESCaption; TOTAL_EXPENSESCaptionLbl)
                {
                }
                column(LESS__ADVANCECaption; LESS__ADVANCECaptionLbl)
                {
                }
                column(AMOUNT_DUE_TO__FROM__EMPLOYEECaption; AMOUNT_DUE_TO__FROM__EMPLOYEECaptionLbl)
                {
                }
                column(PAYMENT_RECEIVED_BYCaption; PAYMENT_RECEIVED_BYCaptionLbl)
                {
                }
                column(SIGNATURE__________________Caption; SIGNATURE__________________________________________________CaptionLbl)
                {
                }
                column(DATE_______________________________Caption; DATE__________________________________________________CaptionLbl)
                {
                }
                column(APPROVED_BY_Caption; APPROVED_BY_CaptionLbl)
                {
                }
                column(SIGNATURE_Caption; SIGNATURE_CaptionLbl)
                {
                }
                column(DATE______________________________Caption_Control1000000036; DATE__________________________________________________Caption_Control1000000036Lbl)
                {
                }
                column(CHECKED_BY_Caption; CHECKED_BY_CaptionLbl)
                {
                }
                column(SIGNATURECaption; SIGNATURECaptionLbl)
                {
                }
                column(DATE______________________________Caption_Control1000000042; DATE__________________________________________________Caption_Control1000000042Lbl)
                {
                }
                column(PREPARED_BYCaption; PREPARED_BYCaptionLbl)
                {
                }
                column(SIGNATURECaption_Control1000000055; SIGNATURECaption_Control1000000055Lbl)
                {
                }
                column(DATE_____________________________Caption_Control1000000062; DATE__________________________________________________Caption_Control1000000062Lbl)
                {
                }
                column(APPROVALCaption; APPROVALCaptionLbl)
                {
                }
                column(Request_Lines1_Document_No; "Request Lines1"."Document No")
                {
                }
                column(Request_Lines1_Line_No_; "Request Lines1"."Line No.")
                {
                }
                column(ReceivedBy; ReceivedBy)
                {
                }
                column(DateApproved; DateApproved)
                {
                }
            }
            trigger OnPreDataItem();
            begin
                CompanyInfo.Get;
                CompanyInfo.CalcFields(CompanyInfo.Picture);
            end;

            trigger OnAfterGetRecord();
            begin
                Netamt := 0;
                DimValues.Reset;
                DimValues.SetRange(DimValues."Dimension Code", 'DEPARTMENT');
                DimValues.SetRange(DimValues.Code, "Request Header1"."Global Dimension 1 Code");
                if DimValues.Find('-') then begin
                    CompName := DimValues.Name
                end;
                /*IF Payments.Currency<>'' THEN
				CurrencyCodeText:=Payments.Currency
				ELSE*/
                CurrencyCodeText := GLsetup."LCY Code";
                /*Banks.RESET;
				Banks.SETRANGE(Banks."No.",Payments."KBA Bank Code");
				IF Banks.FIND('-') THEN BEGIN
				BankName:=Banks.Name;
				END
				ELSE BEGIN
				BankName:='';
				END;
				Bank.RESET;
				Bank.SETRANGE(Bank."No.",Payments."Paying Bank Account");
				IF Bank.FIND('-') THEN BEGIN
				PayeeBankName:=Bank.Name;
				END
				ELSE BEGIN
				PayeeBankName:='';
				END;
				PGAccount:='';
				IF Payments."Account Type"=Payments."Account Type"::"G/L Account" THEN BEGIN
				PGAccount:=Payments."Account No.";
				END;
				IF Payments."Account Type"=Payments."Account Type"::"Bank Account" THEN BEGIN
				Bank.RESET;
				Bank.SETRANGE(Bank."No.",Payments."Account No.");
				IF Bank.FIND('-') THEN BEGIN
				Bank.TESTFIELD(Bank."Bank Acc. Posting Group");
				BankPG.RESET;
				BankPG.SETRANGE(BankPG.Code,Bank."Bank Acc. Posting Group");
				IF BankPG.FIND('-') THEN BEGIN
				PGAccount:=BankPG."G/L Account No.";
				END;
				END;
				END;
				IF Payments."Account Type"=Payments."Account Type"::Vendor THEN BEGIN
				Vend.RESET;
				Vend.SETRANGE(Vend."No.",Payments."Account No.");
				IF Vend.FIND('-') THEN BEGIN
				Vend.TESTFIELD(Vend."Vendor Posting Group");
				VendorPG.RESET;
				VendorPG.SETRANGE(VendorPG.Code,Vend."Vendor Posting Group");
				IF VendorPG.FIND('-') THEN BEGIN
				PGAccount:=VendorPG."Payables Account";
				END;
				END;
				END;
				IF Payments."Account Type"=Payments."Account Type"::Customer THEN BEGIN
				Cust.RESET;
				Cust.SETRANGE(Cust."No.",Payments."Account No.");
				IF Cust.FIND('-') THEN BEGIN
				Cust.TESTFIELD(Cust."Customer Posting Group");
				CustPG.RESET;
				CustPG.SETRANGE(CustPG.Code,Cust."Customer Posting Group");
				IF CustPG.FIND('-') THEN BEGIN
				PGAccount:=CustPG."Receivables Account";
				END;
				END;
				END;
				IF Payments."Account Type"=Payments."Account Type"::"Fixed Asset" THEN BEGIN
				FA.RESET;
				FA.SETRANGE(FA."FA No.",Payments."Account No.");
				IF FA.FIND('-') THEN BEGIN
				FA.TESTFIELD(FA."FA Posting Group");
				FAPG.RESET;
				FAPG.SETRANGE(FAPG.Code,FA."FA Posting Group");
				IF FAPG.FIND('-') THEN BEGIN
				PGAccount:=FAPG."Acquisition Cost Account";
				END;
				END;
				END;
				BankAccountUsed:='';
				//Payments.TESTFIELD(Payments."Pay Mode");
				IF Payments."Pay Mode"='CASH' THEN BEGIN
				BankAccountUsed:=Payments."Cashier Bank Account";
				END
				ELSE BEGIN
				BankAccountUsed:=Payments."Paying Bank Account";
				END;
				BankAccountUsedName:='';
				Bank.RESET;
				Bank.SETRANGE(Bank."No.",BankAccountUsed);
				IF Bank.FIND('-') THEN BEGIN
				Bank.TESTFIELD(Bank."Bank Acc. Posting Group");
				BankPG.RESET;
				BankPG.SETRANGE(BankPG.Code,Bank."Bank Acc. Posting Group");
				IF BankPG.FIND('-') THEN BEGIN
				BankAccountUsed:=BankPG."G/L Account No.";
				END;
				//BankAccountUsedName:=Bank.Name;
				END;
				GLAccount.RESET;
				GLAccount.SETRANGE(GLAccount."No.",BankAccountUsed);
				IF GLAccount.FIND('-') THEN BEGIN
				BankAccountUsedName:=GLAccount.Name;
				END;
				PGAccountUsedName:='';
				GLAccount.RESET;
				GLAccount.SETRANGE(GLAccount."No.",PGAccount);
				IF GLAccount.FIND('-') THEN BEGIN
				PGAccountUsedName:=GLAccount.Name;
				END;
				{ IF UserRec.GET(Payments.Cashier) THEN
				 BEGIN
				 //MESSAGE('%1',Payments.Cashier);
				 UserRec.CALCFIELDS(UserRec.Picture);
				 END;} */
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange(ApprovalEntries."Table ID", 51511126);
                ApprovalEntries.SetRange(ApprovalEntries."Document No.", "Request Header1"."No.");
                ApprovalEntries.SetRange(ApprovalEntries.Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            "1stapprover" := ApprovalEntries."Approver ID";
                            "1stapproverdate" := ApprovalEntries."Last Date-Time Modified";
                            ReceivedBy := ApprovalEntries."Sender ID";
                            DateApproved := ApprovalEntries."Last Date-Time Modified";
                            if UserRecApp1.Get("1stapprover") then
                                UserRecApp1.CalcFields(UserRecApp1.Picture);
                        end;
                        if i = 2 then begin
                            "2ndapprover" := ApprovalEntries."Approver ID";
                            "2ndapproverdate" := ApprovalEntries."Last Date-Time Modified";
                            DateReceived := ApprovalEntries."Last Date-Time Modified";
                            if UserRecApp2.Get("2ndapprover") then
                                UserRecApp2.CalcFields(UserRecApp2.Picture);
                        end;
                        if i = 3 then begin
                            "3rdapprover" := ApprovalEntries."Approver ID";
                            "3rdapproverdate" := ApprovalEntries."Last Date-Time Modified";
                            if UserRecApp3.Get("3rdapprover") then
                                UserRecApp3.CalcFields(UserRecApp3.Picture);
                        end;
                    until ApprovalEntries.Next = 0;
                end;
                "Request Header1".CalcFields("Request Header1".Balance, "Request Header1"."Imprest Amount", "Total Amount Requested");
                Netamt := "Request Header1"."Imprest Amount" - "Request Header1"."Total Amount Requested";

            end;

        }
    }
    requestpage
    {
        SaveValues = false;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ForNavOpenDesigner; ReportForNavOpenDesigner)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Design';
                        Visible = ReportForNavAllowDesign;
                    }
                }
            }
        }

    }

    trigger OnInitReport()
    begin
        //;
        //ReportsForNavInit;

    end;

    trigger OnPostReport()
    begin
        //;
        ////ReportForNav.Post;
    end;

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        SalesSetup.Get;
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
        GLsetup.Get;
        case SalesSetup."Logo Position on Documents" of
            SalesSetup."logo position on documents"::"No Logo":
                ;
            SalesSetup."logo position on documents"::Left:
                begin
                    CompanyInfo.CalcFields(Picture);
                end;
            SalesSetup."logo position on documents"::Center:
                begin
                    CompanyInfo.Get;
                    CompanyInfo.CalcFields(Picture);
                end;
            SalesSetup."logo position on documents"::Right:
                begin
                    CompanyInfo.Get;
                    CompanyInfo.CalcFields(Picture);
                end;
        end;
        //;
        //ReportsForNavPre;
    end;

    var
        DimValues: Record "Dimension Value";
        CompName: Text[100];
        TypeOfDoc: Text[100];
        RecPayTypes: Record Receipts1;
        BankName: Text[100];
        Banks: Record "Bank Account";
        Bank: Record "Bank Account";
        PayeeBankName: Text[100];
        VendorPG: Record "Vendor Posting Group";
        CustPG: Record "Customer Posting Group";
        FAPG: Record "FA Posting Group";
        BankPG: Record "Bank Account Posting Group";
        PGAccount: Text[50];
        Vend: Record Vendor;
        Cust: Record Customer;
        FA: Record "FA Depreciation Book";
        BankAccountUsed: Text[50];
        BankAccountUsedName: Text[100];
        PGAccountUsedName: Text[50];
        GLAccount: Record "G/L Account";
        CompanyInfo: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        GLsetup: Record "General Ledger Setup";
        NumberText: array[2] of Text[80];
        CurrencyCodeText: Code[10];
        TXT001: label '%1 %2';
        TXT002: label '%1, %2  %3';
        ApprovalEntries: Record "Approval Entry";
        "1stapprover": Text[30];
        "2ndapprover": Text[30];
        i: Integer;
        "1stapproverdate": DateTime;
        "2ndapproverdate": DateTime;
        UserRec: Record "User Setup";
        UserRecApp1: Record "User Setup";
        UserRecApp2: Record "User Setup";
        UserRecApp3: Record "User Setup";
        "3rdapprover": Text[30];
        "3rdapproverdate": DateTime;
        Netamt: Decimal;
        IMPREST_CLAIM_FORMCaptionLbl: label 'IMPREST/CLAIM FORM';
        Department_CaptionLbl: label 'Department ';
        DescriptionCaptionLbl: label 'Description';
        AmountCaptionLbl: label 'Amount';
        TOTAL_EXPENSESCaptionLbl: label 'TOTAL EXPENSES';
        LESS__ADVANCECaptionLbl: label 'LESS: ADVANCE';
        AMOUNT_DUE_TO__FROM__EMPLOYEECaptionLbl: label 'AMOUNT DUE TO/(FROM) EMPLOYEE';
        PAYMENT_RECEIVED_BYCaptionLbl: label 'PAYMENT RECEIVED BY';
        SIGNATURE__________________________________________________CaptionLbl: label 'SIGNATURE _________________________________________________';
        DATE__________________________________________________CaptionLbl: label 'DATE _________________________________________________';
        APPROVED_BY_CaptionLbl: label 'APPROVED BY ';
        SIGNATURE_CaptionLbl: label 'SIGNATURE ';
        DATE__________________________________________________Caption_Control1000000036Lbl: label 'DATE _________________________________________________';
        CHECKED_BY_CaptionLbl: label 'CHECKED BY ';
        SIGNATURECaptionLbl: label 'SIGNATURE';
        DATE__________________________________________________Caption_Control1000000042Lbl: label 'DATE _________________________________________________';
        PREPARED_BYCaptionLbl: label 'PREPARED BY';
        SIGNATURECaption_Control1000000055Lbl: label 'SIGNATURE';
        DATE__________________________________________________Caption_Control1000000062Lbl: label 'DATE _________________________________________________';
        APPROVALCaptionLbl: label 'APPROVAL';
        ReceivedBy: Code[50];
        DateApproved: DateTime;
        DateReceived: DateTime;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511014_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511014;
        ReportForNavObject: Variant;
    begin
        addInFileName := ApplicationPath() + 'Add-ins\ReportsForNAV_7_3_0_2559\ForNav.Reports.7.3.0.2559.dll';
        if not File.Exists(addInFileName) then begin
            tempAddInFileName := path.GetTempPath() + '\Microsoft Dynamics NAV\Add-Ins\' + ApplicationSystemConstants.PlatformFileVersion() + '\ForNav.Reports.7.3.0.2559.dll';
            if not File.Exists(tempAddInFileName) then
                Error('Please install the ForNAV DLL version 7.3.0.2559 in your service tier Add-ins folder under the file name "%1"\\If you already have the ForNAV DLL on the server, you should move it to this folder and rename it to match this file name.', addInFileName);
        end;
        ReportForNavObject := //ReportForNav.GetLatest(CurrReport.OBJECTID, CurrReport.Language, SerialNumber, UserId, CompanyName);
        ReportForNav := ReportForNavObject;
        //ReportForNav.Init();
    end;

    //local procedure ReportsForNavPre();
    // begin
    ////ReportForNav.OpenDesigner := ReportForNavOpenDesigner;
    //if not //ReportForNav.Pre() then CurrReport.Quit();
    //end;*/

    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
