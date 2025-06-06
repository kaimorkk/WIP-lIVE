//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511101_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511101) { }
//type("System.IO.Path"; System_IO_Path51511101) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193521 "Update Scales"
{
    RDLCLayout = './Layouts/UpdateScales.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Salary Scales1"; "Salary Scales1")
        {
            DataItemTableView = sorting(Scale);
            RequestFilterFields = Scale;
            column(ReportForNavId_1590; 1590) { } // Autogenerated by ForNav - Do not delete
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            //column(CurrReport_PAGENO; Format(//ReportForNav.PageNo))
            // {
            // }
            column(USERID; UserId)
            {
            }
            column(Salary_Scales1_Scale; "Salary Scales1".Scale)
            {
            }
            column(Salary_Scales1__Minimum_Pointer_; "Salary Scales1"."Minimum Pointer")
            {
            }
            column(Salary_Scales1__Maximum_Pointer_; "Salary Scales1"."Maximum Pointer")
            {
            }
            column(Salary_Scales1__Responsibility_Allowance_; "Salary Scales1"."Responsibility Allowance")
            {
            }
            column(Salary_Scales1__Commuter_Allowance_; "Salary Scales1"."Commuter Allowance")
            {
            }
            column(Salary_ScalesCaption; Salary_ScalesCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Salary_Scales1_ScaleCaption; FieldCaption(Scale))
            {
            }
            column(Salary_Scales1__Minimum_Pointer_Caption; FieldCaption("Minimum Pointer"))
            {
            }
            column(Salary_Scales1__Maximum_Pointer_Caption; FieldCaption("Maximum Pointer"))
            {
            }
            column(Salary_Scales1__Responsibility_Allowance_Caption; FieldCaption("Responsibility Allowance"))
            {
            }
            column(Salary_Scales1__Commuter_Allowance_Caption; FieldCaption("Commuter Allowance"))
            {
            }
            trigger OnAfterGetRecord();
            begin
                SalaryPointers.Reset;
                if SalaryPointers.Find('-') then
                    repeat
                        SalaryBenefits.Init;
                        SalaryBenefits."Salary Scale" := "Salary Scales1".Scale;
                        SalaryBenefits."Salary Pointer" := SalaryPointers."Salary Pointer";
                        SalaryBenefits."ED Code" := '13';
                        SalaryBenefits.Validate(SalaryBenefits."ED Code");
                        SalaryBenefits.Amount := 3000;
                        if not SalaryBenefits.Get(SalaryBenefits."Salary Scale", SalaryBenefits."Salary Pointer", SalaryBenefits."ED Code") then
                            SalaryBenefits.Insert;
                    until SalaryPointers.Next = 0;
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
        SalaryPointers: Record "Salary Pointers1";
        SalaryBenefits: Record "Scale Benefits1";
        Salary_ScalesCaptionLbl: label 'Salary Scales';
        CurrReport_PAGENOCaptionLbl: label 'Page';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511101_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511101;
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
