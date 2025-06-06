//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511428_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511428) { }
//type("System.IO.Path"; System_IO_Path51511428) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193714 StaffOnLeave
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/StaffOnLeave.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Employee Leave Application1"; "Employee Leave Application1")
        {
            DataItemTableView = where("Leave Status" = filter(Approved));
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            column(EmpNo; "Employee Leave Application1"."Employee No")
            {
            }
            column(DayaApplied; "Employee Leave Application1"."Days Applied")
            {
            }
            column(StartDate; "Employee Leave Application1"."Start Date")
            {
            }
            column(EndDate; "Employee Leave Application1"."End Date")
            {
            }
            column(LeaveStatus; "Employee Leave Application1"."Leave Status")
            {
            }
            column(Taken; "Employee Leave Application1".Taken)
            {
            }
            column(Picture; CompanyInfo.Picture)
            {
            }
            column(EmployeeName; "Employee Leave Application1"."Employee Name")
            {
            }
            column(ApprovedDays; "Employee Leave Application1"."Approved Days")
            {
            }
            column(ApprovedStartDate; "Employee Leave Application1"."Approved Start Date")
            {
            }
            column(ApprovedEndDate; "Employee Leave Application1"."Approved End Date")
            {
            }
            column(LeaveCode; "Employee Leave Application1"."Leave Code")
            {
            }
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
        CompanyInfo.CalcFields(Picture);
        //;
        //ReportsForNavPre;
    end;

    var
        CompanyInfo: Record "Company Information";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511428_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511428;
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
