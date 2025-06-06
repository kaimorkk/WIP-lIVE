//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511135_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511135) { }
//type("System.IO.Path"; System_IO_Path51511135) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193552 P10A
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './P10A.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "Pay Period Filter", "No.";
            column(ReportForNavId_7528; 7528) { } // Autogenerated by ForNav - Do not delete
            column(FORMAT_DateSpecified_0___year4___; Format(DateSpecified, 0, '<year4>'))
            {
            }
            column(CoName; CoName)
            {
            }
            column(Employee__First_Name_; Employee."First Name")
            {
            }
            column(Employee__Last_Name_; Employee."Last Name")
            {
            }
            column(Employee_PAYE; Employee.PAYE)
            {
            }
            column(Employee_Employee__PIN_Number_; Employee."PIN Number")
            {
            }
            column(Employee__No__; Employee."No.")
            {
            }
            column(Employee_Employee__Taxable_Income_; Employee."Taxable Income")
            {
            }
            column(Employee_PAYE_Control5; Employee.PAYE)
            {
            }
            column(Employee_Employee__Taxable_Income__Control1000000001; Employee."Taxable Income")
            {
            }
            column(SUPPORTING_LIST_TO_THE_END_OF_YEAR_CERTIFICATECaption; SUPPORTING_LIST_TO_THE_END_OF_YEAR_CERTIFICATECaptionLbl)
            {
            }
            column(Payroll_NumberCaption; Payroll_NumberCaptionLbl)
            {
            }
            column(Employee_Caption; Employee_CaptionLbl)
            {
            }
            column(PIN_NumberCaption; PIN_NumberCaptionLbl)
            {
            }
            column(Total_Tax_KshsCaption; Total_Tax_KshsCaptionLbl)
            {
            }
            column(PERIODCaption; PERIODCaptionLbl)
            {
            }
            column(TAXABLE_PAYCaption; TAXABLE_PAYCaptionLbl)
            {
            }
            column(TotalsCaption; TotalsCaptionLbl)
            {
            }
            column(P10ACaption; P10ACaptionLbl)
            {
            }
            trigger OnPreDataItem();
            begin

                /*CUser:=USERID;
				GetGroup.GetUserGroup(CUser,GroupCode);
				SETRANGE(Employee."Posting Group",GroupCode);*/

            end;

            trigger OnAfterGetRecord();
            begin
                Employee.CalcFields("Cumm. PAYE");
                PAYE := Abs("Cumm. PAYE");
                if "Cumm. PAYE" = 0 then
                    CurrReport.Skip;
                TotalTax := TotalTax + Abs("Cumm. PAYE");
                TotalTax := PayrollRounding(TotalTax);
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
        DateSpecified := Employee.GetRangeMin("Pay Period Filter");
        CompRec.Get();
        CoName := CompRec.Name;
        //;
        //ReportsForNavPre;
    end;

    var
        PAYE: Decimal;
        TotalTax: Decimal;
        CompRec: Record "Company Information";
        CoName: Text[30];
        DateSpecified: Date;
        GetGroup: Codeunit Payroll5;
        GroupCode: Code[20];
        CUser: Code[20];
        SUPPORTING_LIST_TO_THE_END_OF_YEAR_CERTIFICATECaptionLbl: label 'SUPPORTING LIST TO THE END OF YEAR CERTIFICATE';
        Payroll_NumberCaptionLbl: label 'Payroll Number';
        Employee_CaptionLbl: label 'Employee ';
        PIN_NumberCaptionLbl: label 'PIN Number';
        Total_Tax_KshsCaptionLbl: label 'Total Tax Kshs';
        PERIODCaptionLbl: label 'PERIOD';
        TAXABLE_PAYCaptionLbl: label 'TAXABLE PAY';
        TotalsCaptionLbl: label 'Totals';
        P10ACaptionLbl: label 'P10A';

    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin
        HRsetup.Get;
        if HRsetup."Payroll Rounding Precision" = 0 then
            Error('You must specify the rounding precision under HR setup');
        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Nearest then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '=');
        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Up then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '>');
        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Down then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '<');
    end;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511135_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511135;
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
