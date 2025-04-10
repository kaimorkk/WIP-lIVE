//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511387_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511387) { }
//type("System.IO.Path"; System_IO_Path51511387) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193690 "Leave Allowance to Payroll"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/LeaveAllowancetoPayroll.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Employee; Employee)
        {
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            column(EmployeeNo; Employee."No.")
            {
            }
            column(Name; Name)
            {
            }
            column(LengthOfService; LengthOfService)
            {
            }
            column(Grade; Employee."Salary Scale")
            {
            }
            column(AmountPayable; AmountPayable)
            {
            }
            trigger OnPreDataItem();
            begin
                EmployeeLeaves.Reset;
                EmployeeLeaves.SetRange(EmployeeLeaves."Employee No", Employee."No.");
                EmployeeLeaves.SetRange(EmployeeLeaves."Maturity Date", Today, CalcDate('1Y', Today));
                EmployeeLeaves.SetRange(EmployeeLeaves."Leave  Allowance Paid", true);
                if EmployeeLeaves.Find('-') then
                    CurrReport.Skip;
                if (Today - Employee."Date Of Join") < 180 then
                    CurrReport.Skip;
            end;

            trigger OnAfterGetRecord();
            begin
                EmployeeLeaves.Reset;
                EmployeeLeaves.SetRange(EmployeeLeaves."Employee No", Employee."No.");
                EmployeeLeaves.SetRange(EmployeeLeaves."Maturity Date", Today, CalcDate('1Y', Today));
                EmployeeLeaves.SetRange(EmployeeLeaves."Leave  Allowance Paid", true);
                if EmployeeLeaves.Find('-') then
                    CurrReport.Skip;
                if (Today - Employee."Date Of Join") < 180 then
                    CurrReport.Skip;
                LengthOfService := '';
                AmountPayable := 0;
                Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                if (Employee."Date Of Join" <> 0D) then
                    LengthOfService := Dates.DetermineAge(Employee."Date Of Join", Today);
                if (Employee."Salary Scale" >= '1') and (Employee."Salary Scale" <= '4') then
                    AmountPayable := 50000
                else if (Employee."Salary Scale" >= '5') and (Employee."Salary Scale" <= '6') then
                    AmountPayable := 45000
                else if (Employee."Salary Scale" >= '7') and (Employee."Salary Scale" <= '8') then
                    AmountPayable := 35000
                else if (Employee."Salary Scale" >= '9') then
                    AmountPayable := 30000
                else
                    AmountPayable := 0;
                HRSetup.Get;
                PayrollPeriod.Reset;
                PayrollPeriod.SetRange(PayrollPeriod."Close Pay", false);
                if PayrollPeriod.Find('-') then
                    PayPeriodStart := PayrollPeriod."Starting Date";
                AssignmentMatrix.Reset;
                AssignmentMatrix."Employee No" := Employee."No.";
                AssignmentMatrix.Type := AssignmentMatrix.Type::Payment;
                AssignmentMatrix.Code := HRSetup."Leave Allowance Code";
                AssignmentMatrix.Validate(Code);
                AssignmentMatrix.Taxable := true;
                AssignmentMatrix."Next Period Entry" := false;
                AssignmentMatrix.Amount := AmountPayable;
                AssignmentMatrix."Global Dimension 1 code" := Employee."Global Dimension 2 Code";
                AssignmentMatrix."Payroll Period" := PayPeriodStart;
                AssignmentMatrix.Validate("Payroll Period");
                if not AssignmentMatrix.Get(AssignmentMatrix."Employee No", AssignmentMatrix.Type, AssignmentMatrix.Code, AssignmentMatrix."Payroll Period") then
                    AssignmentMatrix.Insert;
                EmployeeLeaves.Reset;
                EmployeeLeaves.SetRange(EmployeeLeaves."Employee No", Employee."No.");
                EmployeeLeaves.SetRange(EmployeeLeaves."Maturity Date", Today, CalcDate('1Y', Today));
                if EmployeeLeaves.Find('-') then begin
                    EmployeeLeaves."Leave  Allowance Paid" := true;
                    EmployeeLeaves.Modify;
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
        Name: Text[80];
        LengthOfService: Text[150];
        Grades: Record "Salary Scales1";
        AmountPayable: Decimal;
        AssignmentMatrix: Record "Assignment Matrix-X1";
        Dates: Codeunit "HR Dates";
        HRSetup: Record "Human Resources Setup";
        PayrollPeriod: Record "Payroll PeriodX1";
        PayPeriodStart: Date;
        EmployeeLeaves: Record "Employee Leaves1";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511387_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511387;
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
