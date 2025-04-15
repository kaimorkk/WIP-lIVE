//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511446_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511446) { }
//type("System.IO.Path"; System_IO_Path51511446) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193725 "Vendor Payment Advice"
{
    RDLCLayout = './Layouts/VendorPaymentAdvice.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Payments; Payments)
        {
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            column(ChequeNo; Payments."Cheque No")
            {
            }
            column(ChequeDate; Payments."Cheque Date")
            {
            }
            column(Payee; Payments.Payee)
            {
            }
            column(Description1; Text001)
            {
            }
            column(BankName; Payments."Bank Name")
            {
            }
            column(BankAccountNo; Payments."Bank Code")
            {
            }
            column(VendBankAcc; VendBankAcc)
            {
            }
            column(VendBankName; VendBankName)
            {
            }
            column(TotalAmount_Payments; Payments."Total Amount")
            {
            }
            trigger OnAfterGetRecord();
            begin
                PVLines.Reset;
                PVLines.SetRange(PVLines."PV No", Payments."No.");
                if PVLines.Find('-') then begin
                    if PVLines."Account Type" = PVLines."account type"::Vendor then begin
                        VendorBank.Reset;
                        VendorBank.SetRange(VendorBank."Vendor No.", PVLines."Account No");
                        if VendorBank.Find('-') then begin
                            VendBankName := VendorBank.Name;
                            VendBankAcc := VendorBank."Bank Account No.";
                        end;
                    end;
                end;
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
    labels
    {
        To = 'To';
        TheManager = 'The Manager';
        RequestFundTransfer = 'RE: REQUEST FUND TRANSFER';
        DearSir = 'Dear Sir/Madam';
        Naration = 'I would Like to request for the payment:';
        Naration1 = 'I would greatly appreciate your executing this request at your earliest convenience.';
        Naration3 = 'Sincerely';
        Payto = 'Pay To:';
        AccountNo = 'Account No:';
        Amt = 'Amount:  Shs.';
        Bank = 'Bank';
        From = 'From:';
        Naration4 = '.................................';
        Naration5 = 'Frinance  Manager';
        Sign = 'Authorized Signature';
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
        //;
        //ReportsForNavPre;
    end;

    var
        VendorBank: Record "Vendor Bank Account";
        Text001: label 'I would Like to request for the payment of %1 To %2 form Account No: %3 Account Name%4';
        Banks: Record "Bank Account";
        OurBankAcc: Code[30];
        VendBankAcc: Code[30];
        VendBankName: Code[20];
        PVLines: Record "PV Lines1";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511446_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511446;
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
