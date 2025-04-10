//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511016_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511016) { }
//type("System.IO.Path"; System_IO_Path51511016) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193454 "Commissioner Balance Tax"
{
    RDLCLayout = './Layouts/CommissionerBalanceTax.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Commisioner Committee1"; "Commisioner Committee1")
        {
            DataItemTableView = where("Total Amount" = filter(<> 0));
            RequestFilterFields = "Meeting Code";
            column(ReportForNavId_1683; 1683) { } // Autogenerated by ForNav - Do not delete
            column(Commisioner_Committee1__Meeting_Code_; "Commisioner Committee1"."Meeting Code")
            {
            }
            column(Commisioner_Committee1_Code; "Commisioner Committee1".Code)
            {
            }
            column(Commisioner_Committee1__Commisioner_Name_; "Commisioner Committee1"."Commisioner Name")
            {
            }
            column(Commisioner_Committee1__Committee_Code_; "Commisioner Committee1"."Committee Code")
            {
            }
            column(Commisioner_Committee1_Attended; "Commisioner Committee1".Attended)
            {
            }
            column(Commisioner_Committee1__Commissioner_Tax_; "Commisioner Committee1"."Commissioner Tax")
            {
            }
            column(Commisioner_Committee1__Meeting_Code_Caption; FieldCaption("Meeting Code"))
            {
            }
            column(Commisioner_Committee1_CodeCaption; FieldCaption(Code))
            {
            }
            column(Commisioner_Committee1__Commisioner_Name_Caption; FieldCaption("Commisioner Name"))
            {
            }
            column(Commisioner_Committee1__Committee_Code_Caption; FieldCaption("Committee Code"))
            {
            }
            column(Commisioner_Committee1_AttendedCaption; FieldCaption(Attended))
            {
            }
            column(Commissioner_TaxCaption; Commissioner_TaxCaptionLbl)
            {
            }
            trigger OnPreDataItem();
            begin
                DimValue.CalcFields("Commissioners Balance");
                GLSetup.Get;
                "Commisioner Committee1".CalcFields("Commisioner Committee1"."Total Amount", "Commisioner Committee1"."Commissioner Tax");
                DimValue.SetRange(DimValue."Dimension Code", GLSetup."Shortcut Dimension 2 Code");
            end;

            trigger OnAfterGetRecord();
            begin
                CommExpePayables.Get;
                GLSetup.Get;
                begin
                    PVLines.Init;
                    PVLines."PV No" := PvNo;
                    PVLines."Line No" := PVLines."Line No" + 1000;
                    PVLines."Account Type" := PVLines."account type"::"G/L Account";
                    PVLines."Account No" := CommExpePayables."Comm Expense Payable Acc";
                    if GlAccount.Get(CommExpePayables."Comm Expense Payable Acc") then
                        AccountName := GlAccount.Name;
                    PVLines."Account Name" := AccountName;
                    PVLines."Shortcut Dimension 2 Code" := CommisionerComm.Code;
                    PVLines.Description := "Commisioner Name";
                    DimValue.SetRange(DimValue.Code, "Commisioner Committee1".Code);
                    if DimValue.Find('-') then begin
                        PVLines."KBA Branch Code" := DimValue."Bank Branch";
                        PVLines."Bank Account No" := DimValue."Bank Account Number";
                    end;
                    if BankAccounts.Get(PVLines."Bank Account No") then
                        BankName := BankAccounts.Name;
                    // PVLines."ED Description":="CommisionerComm".Description;
                    //PVLines."ED Code":="CommisionerComm"."ED Code";
                    PVLines."Shortcut Dimension 2 Code" := Code;
                    //MESSAGE("Commisioner Name"+'Amount is '+FORMAT("Total Amount"));
                    PVLines.Amount := "Commissioner Tax";
                    PVLines."Net Amount" := "Commissioner Tax";
                    //IF PVLines.Amount<>0 THEN
                    PVLines.Insert;
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
        Payements: Record Payments;
        PVLines: Record "PV Lines1";
        MeetingID: Code[10];
        CommissionerCode: Code[10];
        AccountNo: Code[10];
        PV: Code[20];
        AccountName: Text[80];
        GlAccount: Record "G/L Account";
        DimValue: Record "Dimension Value";
        CommissionerName: Text[80];
        PvNo: Code[20];
        GLEntry: Record "G/L Entry";
        CommExpePayables: Record "Commissioner Expe Payables1";
        GLSetup: Record "General Ledger Setup";
        BankAccounts: Record "Bank Account";
        BankName: Text[100];
        BankAccount: Text[30];
        EDSetup: Record "Commissioner ED Setup1";
        CommisionerComm: Record "Commisioner Committee1";
        "Total Amount": Record "Commisioner Committee1";
        Commissioner_TaxCaptionLbl: label 'Commissioner Tax';

    procedure GetPV(var Pv: Record Payments)
    begin
        PvNo := Pv.No;
    end;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511016_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511016;
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
