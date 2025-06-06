//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511173_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511173) { }
//type("System.IO.Path"; System_IO_Path51511173) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193580 "Temporary Emp. Leave Balances"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/TemporaryEmp.LeaveBalances.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Employee Contracts1"; "Employee Contracts1")
        {
            DataItemTableView = sorting("Contract No", "Employee No") where(Expired = const(false));
            RequestFilterFields = "Contract No";
            column(ReportForNavId_3922; 3922) { } // Autogenerated by ForNav - Do not delete
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            //column(CurrReport_PAGENO; Format(//ReportForNav.PageNo))
            // {
            // }
            column(USERID; UserId)
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(Employee_Contracts1__Contract_No_; "Employee Contracts1"."Contract No")
            {
            }
            column(Employee_Contracts1__Employee_No_; "Employee Contracts1"."Employee No")
            {
            }
            column(Employee_Contracts1__Employee_Name_; "Employee Contracts1"."Employee Name")
            {
            }
            column(Employee_Contracts1__Contract_Leave_Entitlement_; "Employee Contracts1"."Contract Leave Entitlement")
            {
            }
            column(Employee_Contracts1__Balance_Brought_Forward_; "Employee Contracts1"."Balance Brought Forward")
            {
            }
            column(Employee_Contracts1__Contract_Leave_Balance_; "Employee Contracts1"."Contract Leave Balance")
            {
            }
            column(Employee_Contracts1__Total_Days_Taken_; "Employee Contracts1"."Total Days Taken")
            {
            }
            column(Employee_Contracts1__Recalled_Days_; "Employee Contracts1"."Recalled Days")
            {
            }
            column(Employee_Contracts1__Days_Absent_; "Employee Contracts1"."Days Absent")
            {
            }
            column(Temporary_Employee_Leave_Balances_Caption; Temporary_Employee_Leave_Balances_CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee_Contracts1__Contract_No_Caption; FieldCaption("Contract No"))
            {
            }
            column(Employee_Contracts1__Employee_No_Caption; FieldCaption("Employee No"))
            {
            }
            column(Employee_Contracts1__Employee_Name_Caption; FieldCaption("Employee Name"))
            {
            }
            column(Employee_Contracts1__Contract_Leave_Entitlement_Caption; FieldCaption("Contract Leave Entitlement"))
            {
            }
            column(Employee_Contracts1__Balance_Brought_Forward_Caption; FieldCaption("Balance Brought Forward"))
            {
            }
            column(Employee_Contracts1__Contract_Leave_Balance_Caption; FieldCaption("Contract Leave Balance"))
            {
            }
            column(Employee_Contracts1__Total_Days_Taken_Caption; FieldCaption("Total Days Taken"))
            {
            }
            column(Employee_Contracts1__Recalled_Days_Caption; FieldCaption("Recalled Days"))
            {
            }
            column(Employee_Contracts1__Days_Absent_Caption; FieldCaption("Days Absent"))
            {
            }
            trigger OnPreDataItem();
            begin
                LastFieldNo := FieldNo("Contract No");
            end;

            trigger OnAfterGetRecord();
            begin
                CompInfo.Reset;
                CompInfo.CalcFields(CompInfo.Picture);
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        CompInfo: Record "Company Information";
        Temporary_Employee_Leave_Balances_CaptionLbl: label 'Temporary Employee Leave Balances ';
        CurrReport_PAGENOCaptionLbl: label 'Page';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511173_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511173;
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
