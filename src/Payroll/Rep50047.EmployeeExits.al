report 52193427 "Employee Exits"
{
    Caption = 'Employee Exits';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Exits.rdlc';
    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "Termination Date", "Employee Category Type";
            DataItemTableView = where(Status = filter(<> Active));
            column(Employee__No__; "No.")
            {
            }
            column(ImplementingUnitName_Employee; "Implementing Unit Name")
            {
            }
            column(JobTitle_Employee; "Job Title")
            {
            }
            column(DateOfLeaving_Employee; "Date Of Leaving")
            {
            }
            column(First_Name_______Middle_Name________Last_Name_; Employee.fullname())
            {
            }
            column(Job_Title2; "Job Title2")
            {

            }
            column(Reason_for_termination; "Reason for termination")
            {

            }
            column(Current_Duty_Station; "Current Duty Station")
            {

            }
            column(Termination_Date; "Termination Date")
            {

            }
            column(SalaryScale_Employee; "Salary Scale")
            {
            }
            column(Present_Employee; Present)
            {
            }
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(CompInfo_Address; CompInfo.Address)
            {
            }
            column(CompInfo_Address2; CompInfo."Address 2")
            {
            }
            column(CompInfo_City; CompInfo.City)
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(CompInfo_PhoneNo; CompInfo."Phone No.")
            {
            }
            column(PeriodName; PeriodName)
            { }
            trigger OnPreDataItem()
            begin
                Employee.SetFilter("Date Of Leaving", '%1..%2', Payperiod - 31, Payperiod);
                PeriodName := '';
                PRPayrollPeriod.Reset();
                PRPayrollPeriod.SetRange("Date Opened", PayPeriod);
                if PRPayrollPeriod.FindFirst() then begin
                    PeriodName := PRPayrollPeriod."Period Name";
                end;
            end;

            trigger OnAfterGetRecord()
            begin


            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(PayPeriod; Payperiod)
                    {
                        ApplicationArea = All;
                        TableRelation = "PR Payroll Periods"."Date Opened";
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        CompInfo: Record "Company Information";
        Payperiod: Date;
        PRPayrollPeriod: Record "PR Payroll Periods";
        PeriodName: Text;

}
