//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
    //assembly("ForNav.Reports.7.3.0.2559")
    // {
    //   type(ForNav.Report_7_3_0_2559; ForNavReport51511137_v7_3_0_2559) { }
    //}
    //assembly("mscorlib")
    //  {
    //    Version = '4.0.0.0';
    //    type("System.IO.Stream"; SystemIOStream51511137) { }
    //type("System.IO.Path"; System_IO_Path51511137) { }
    //   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193554 "Employees Removed"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/EmployeesRemoved.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Pay Period Filter";
            column(ReportForNavId_7528; 7528) { } // Autogenerated by ForNav - Do not delete
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
            column(STRSUBSTNO__PERIOD___1__UPPERCASE_FORMAT_Thismonth_0___month_text___year4_____; StrSubstNo('PERIOD: %1', UpperCase(Format(Thismonth, 0, '<month text> <year4>'))))
            {
            }
            column(Employee__No__; Employee."No.")
            {
            }
            column(First_Name_______Middle_Name________Last_Name_; "First Name" + ' ' + "Middle Name" + ' ' + "Last Name")
            {
            }
            column(Counter; Counter)
            {
            }
            column(EMPLOYEES_REMOVED_FROM_PAYROLLCaption; EMPLOYEES_REMOVED_FROM_PAYROLLCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee__No__Caption; FieldCaption("No."))
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            trigger OnAfterGetRecord();
            begin
                FoundThismonth := false;
                FoundLastmonth := false;
                AssignMat.Reset;
                AssignMat.SetRange(AssignMat."Employee No", Employee."No.");
                AssignMat.SetRange(AssignMat."Payroll Period", Thismonth);
                if AssignMat.Find('+') then
                    FoundThismonth := true;
                AssignMat.Reset;
                AssignMat.SetRange(AssignMat."Employee No", Employee."No.");
                AssignMat.SetRange(AssignMat."Payroll Period", LastMonth);
                if AssignMat.Find('+') then
                    FoundLastmonth := true;
                if FoundThismonth and FoundLastmonth then
                    CurrReport.Skip;
                if not FoundThismonth and not FoundLastmonth then
                    CurrReport.Skip;
                if not FoundLastmonth and FoundThismonth then
                    CurrReport.Skip;
                Counter := Counter + 1;
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
        Thismonth := Employee.GetRangeMin(Employee."Pay Period Filter");
        LastMonth := CalcDate('-1M', Thismonth);
        //;
        //ReportsForNavPre;
    end;

    var
        AssignMat: Record "Assignment Matrix-X1";
        LastMonth: Date;
        Thismonth: Date;
        FoundThismonth: Boolean;
        FoundLastmonth: Boolean;
        Counter: Integer;
        EMPLOYEES_REMOVED_FROM_PAYROLLCaptionLbl: label 'EMPLOYEES REMOVED FROM PAYROLL';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        NameCaptionLbl: label 'Name';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511137_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511137;
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
