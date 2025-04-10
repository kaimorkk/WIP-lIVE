//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
    //assembly("ForNav.Reports.7.3.0.2559")
    // {
    //   type(ForNav.Report_7_3_0_2559; ForNavReport51511033_v7_3_0_2559) { }
    //}
    //assembly("mscorlib")
    //  {
    //    Version = '4.0.0.0';
    //    type("System.IO.Stream"; SystemIOStream51511033) { }
    //type("System.IO.Path"; System_IO_Path51511033) { }
    //   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193468 "Monthly Deductions"
{
    RDLCLayout = './Layouts/MonthlyDeductions.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Assignment Matrix-X1"; "Assignment Matrix-X1")
        {
            DataItemTableView = sorting("Employee No", Type, Code, "Payroll Period", "Reference No") order(ascending) where(Type = const(Deduction));
            RequestFilterFields = "Payroll Period", "Code";
            column(ReportForNavId_5751; 5751) { } // Autogenerated by ForNav - Do not delete
            column(PayPeriod_1_; PayPeriod[1])
            {
            }
            column(PayPeriod_2_; PayPeriod[2])
            {
            }
            column(PayPeriod_3_; PayPeriod[3])
            {
            }
            column(PayPeriod_4_; PayPeriod[4])
            {
            }
            column(PayPeriod_5_; PayPeriod[5])
            {
            }
            column(PayPeriod_6_; PayPeriod[6])
            {
            }
            column(PayPeriod_7_; PayPeriod[7])
            {
            }
            column(PayPeriod_8_; PayPeriod[8])
            {
            }
            column(PayPeriod_9_; PayPeriod[9])
            {
            }
            column(PayPeriod_10_; PayPeriod[10])
            {
            }
            column(PayPeriod_11_; PayPeriod[11])
            {
            }
            column(PayPeriod_12_; PayPeriod[12])
            {
            }
            column(Assignment_Matrix_X1__Employee_No_; "Assignment Matrix-X1"."Employee No")
            {
            }
            column(Name; Name)
            {
            }
            column(Total; Total)
            {
            }
            column(Amt_1_; Amt[1])
            {
            }
            column(Amt_2_; Amt[2])
            {
            }
            column(Amt_3_; Amt[3])
            {
            }
            column(Amt_4_; Amt[4])
            {
            }
            column(Amt_5_; Amt[5])
            {
            }
            column(Amt_6_; Amt[6])
            {
            }
            column(Amt_7_; Amt[7])
            {
            }
            column(Amt_8_; Amt[8])
            {
            }
            column(Amt_9_; Amt[9])
            {
            }
            column(Amt_10_; Amt[10])
            {
            }
            column(Amt_11_; Amt[11])
            {
            }
            column(Amt_12_; Amt[12])
            {
            }
            column(Assignment_Matrix_X1__Employee_No_Caption; FieldCaption("Employee No"))
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(Assignment_Matrix_X1_Type; "Assignment Matrix-X1".Type)
            {
            }
            column(Assignment_Matrix_X1_Code; "Assignment Matrix-X1".Code)
            {
            }
            column(Assignment_Matrix_X1_Payroll_Period; "Assignment Matrix-X1"."Payroll Period")
            {
            }
            column(Assignment_Matrix_X1_Reference_No; "Assignment Matrix-X1"."Reference No")
            {
            }
            trigger OnPreDataItem();
            begin


            end;

            trigger OnAfterGetRecord();
            begin
                j := 1;
                Total := 0;
                repeat
                    Amt[j] := 0;
                    AssignMatrix.Reset;
                    //AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SetRange(AssignMatrix."Pay Period", PayPeriod[j]);
                    AssignMatrix.SetRange(AssignMatrix."Employee No", "Employee No");
                    AssignMatrix.SetRange(AssignMatrix.Code, Code);
                    if AssignMatrix.Find('-') then begin
                        Amt[j] := AssignMatrix.Amount;
                        Total := Total + AssignMatrix.Amount;
                    end;
                    j := j + 1;
                until j = i + 1;
                if EmployeeRec.Get("Assignment Matrix-X1"."Employee No") then
                    Name := EmployeeRec."First Name" + ' ' + EmployeeRec."Middle Name" + ' ' + EmployeeRec."Last Name";
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
        DateSpecified := "Assignment Matrix-X1".GetRangeMin("Assignment Matrix-X1"."Payroll Period");
        // PeriodSpecified:="Assignment Matrix-X".GETFILTER("Assignment Matrix-X"."Payroll Period");
        i := 1;
        //PayPeriodRec.SETCURRENTKEY();
        PayPeriodRec.Ascending;
        //PayPeriodRec.SETRANGE(PayPeriodRec."Starting Date",0D,PeriodSpecified);
        PayPeriodRec.SetRange(PayPeriodRec.Closed, false);
        if PayPeriodRec.Find('-') then begin
            repeat
                PayPeriod[i] := PayPeriodRec.Name;
                i := i + 1;
            until PayPeriodRec.Next = 0;
        end;
        //;
        //ReportsForNavPre;
    end;

    var
        EmployeeRec: Record Employee;
        Total: Decimal;
        Name: Text[60];
        PayPeriodRec: Record "Payroll PeriodX1";
        PayPeriod: array[100] of Text[30];
        i: Integer;
        j: Integer;
        Amt: array[100] of Decimal;
        DateSpecified: Date;
        AssignMatrix: Record "Assignment Matrix-X1";
        PeriodSpecified: Date;
        TotalCaptionLbl: label 'Total';
        NameCaptionLbl: label 'Name';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511033_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511033;
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
