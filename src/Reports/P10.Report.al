//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511133_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511133) { }
//type("System.IO.Path"; System_IO_Path51511133) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193550 P10
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/P10.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Payroll PeriodX1"; "Payroll PeriodX1")
        {
            DataItemTableView = sorting("Starting Date");
            RequestFilterFields = "Starting Date";
            column(ReportForNavId_7560; 7560) { } // Autogenerated by ForNav - Do not delete
            column(EmptyString; '......................................................................')
            {
            }
            column(DataItem22; 'We/I forward herewith ...........Tax Deduction Cards(P9A/P9B) showing the total tax deducted(as listed on P.10A) amounting to Kshs.................................................')
            {
            }
            column(This_total_tax_has_been_paid_as_follows___; 'This total tax has been paid as follows:-')
            {
            }
            column(Company__Company_P_I_N_; Company."Company P.I.N")
            {
            }
            column(FORMAT__Starting_Date__0___year4___; Format("Starting Date", 0, '<year4>'))
            {
            }
            column(Payroll_PeriodX1_Name; "Payroll PeriodX1".Name)
            {
            }
            column(EmptyString_Control16; '......................................................................')
            {
            }
            column(ABS_paye_; Abs(paye))
            {
            }
            column(STRSUBSTNO__NAME_OF_EMPLOYER_____1__COMPANYNAME_; StrSubstNo('NAME OF EMPLOYER:   %1', COMPANYNAME))
            {
            }
            column(ABS__P_A_Y_E__; Abs("P.A.Y.E"))
            {
            }
            column(We_I_certify_that_the_particulars_entered_above_are_correct_; 'We/I certify that the particulars entered above are correct')
            {
            }
            column(OFFICIAL_USE_; 'OFFICIAL USE')
            {
            }
            column(BATCH_No_________________________________________________________________; 'BATCH No................................................................')
            {
            }
            column(SIGNATURE____________________________________________________________; 'SIGNATURE...........................................................')
            {
            }
            column(DATE______________________________________________________________________; 'DATE.....................................................................')
            {
            }
            column(SIGNATURE_______________________________________________________________; 'SIGNATURE..............................................................')
            {
            }
            column(DATE___________________________________________________________________________; 'DATE..........................................................................')
            {
            }
            column(Payroll_PeriodX1__P_A_Y_E_; "Payroll PeriodX1"."P.A.Y.E")
            {
            }
            column(P10Caption; P10CaptionLbl)
            {
            }
            column(KENYA_REVENUE_AUTHORITYCaption; KENYA_REVENUE_AUTHORITYCaptionLbl)
            {
            }
            column(INCOME_TAX_DEPARTMENTCaption; INCOME_TAX_DEPARTMENTCaptionLbl)
            {
            }
            column(P_A_Y_E_EMPLOYER_S_CERTIFICATECaption; P_A_Y_E_EMPLOYER_S_CERTIFICATECaptionLbl)
            {
            }
            column(To_Senior_Assistant_Assistant_Commisioner_Caption; To_Senior_Assistant_Assistant_Commisioner_CaptionLbl)
            {
            }
            column(EMPLOYER_S_P_I_NCaption; EMPLOYER_S_P_I_NCaptionLbl)
            {
            }
            column(YEARCaption; YEARCaptionLbl)
            {
            }
            column(MonthCaption; MonthCaptionLbl)
            {
            }
            column(P_A_Y_E_TAXCaption; P_A_Y_E_TAXCaptionLbl)
            {
            }
            column(DATE_PAID_PER_RECEIVING_BANK_STAMP_Caption; DATE_PAID_PER_RECEIVING_BANK_STAMP_CaptionLbl)
            {
            }
            column(TOTAL_TAX_SHS_Caption; TOTAL_TAX_SHS_CaptionLbl)
            {
            }
            column(ADDRESS__________________________________________________________________Caption; ADDRESS__________________________________________________________________CaptionLbl)
            {
            }
            column(Payroll_PeriodX1_Starting_Date; "Payroll PeriodX1"."Starting Date")
            {
            }
            trigger OnAfterGetRecord();
            begin
                "Payroll PeriodX1".CalcFields("Payroll PeriodX1"."P.A.Y.E");
                paye := "Payroll PeriodX1"."P.A.Y.E";
                Totpaye := Totpaye + paye;
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
        Company.Get;
        Period := "Payroll PeriodX1".GetFilter("Payroll PeriodX1"."Starting Date");
        //;
        //ReportsForNavPre;
    end;

    var
        Company: Record "Company Information";
        paye: Decimal;
        Totpaye: Decimal;
        Period: Text[30];
        GetGroup: Codeunit Payroll5;
        GroupCode: Code[20];
        CUser: Code[20];
        P10CaptionLbl: label 'P10';
        KENYA_REVENUE_AUTHORITYCaptionLbl: label 'KENYA REVENUE AUTHORITY';
        INCOME_TAX_DEPARTMENTCaptionLbl: label 'INCOME TAX DEPARTMENT';
        P_A_Y_E_EMPLOYER_S_CERTIFICATECaptionLbl: label 'P.A.Y.E-EMPLOYER''S CERTIFICATE';
        To_Senior_Assistant_Assistant_Commisioner_CaptionLbl: label 'To Senior Assistant/Assistant Commisioner ';
        EMPLOYER_S_P_I_NCaptionLbl: label 'EMPLOYER''S P.I.N';
        YEARCaptionLbl: label 'YEAR';
        MonthCaptionLbl: label 'Month';
        P_A_Y_E_TAXCaptionLbl: label 'P.A.Y.E TAX';
        DATE_PAID_PER_RECEIVING_BANK_STAMP_CaptionLbl: label 'DATE PAID PER(RECEIVING BANK STAMP)';
        TOTAL_TAX_SHS_CaptionLbl: label 'TOTAL TAX SHS.';
        ADDRESS__________________________________________________________________CaptionLbl: label 'ADDRESS .................................................................';

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
        //ReportForNav: DotNet ForNavReport51511133_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511133;
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
