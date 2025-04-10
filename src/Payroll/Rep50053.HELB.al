report 52193456 HELB1
{
    Caption = 'HELB';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HELB.rdlc';
    dataset
    {
        dataitem(PRPeriodTransactions; "PR Period Transactions")
        {
            RequestFilterFields = "Payroll Period", "Transaction Code";
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
            column(CompInfo_PIN; CompInfo."PIN No.")
            {
            }
            // column(CompInfo_HELB; CompInfo."HELB No")
            // {
            // }
            column(EmployeeCode; "Employee Code")
            {
            }
            column(Amount; Amount)
            {
            }
            column(PeriodName; PeriodName)
            {
            }
            column(PayrollPeriod; format("Payroll Period", 0, '<Month Text>'))
            {
            }
            column(IDNo; IDNo)
            {

            }

            column(FullName; FullName)
            {

            }
            trigger OnPreDataItem()
            begin
                SetRange("Payroll Period", SelectedPeriod);
            end;

            trigger OnAfterGetRecord()
            begin
                if Employe.Get("Employee Code") then begin
                    IDNo := Employe."ID Number";
                    KRAPIN := Employe."P.I.N";
                    FullName := Employe.FullName();
                end;
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group("Filter Options")
                {
                    field(SelectedPeriod; SelectedPeriod)
                    {
                        Caption = 'Selected Period';
                        TableRelation = "PR Payroll Periods"."Date Opened";
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
        }
    }
    trigger OnPreReport();
    begin


        CompInfo.RESET;
        CompInfo.GET;

        CompInfo.CALCFIELDS(Picture);

        if SelectedPeriod = 0D then ERROR('Please select payroll period');

        PRPayrollPeriods.RESET;
        PRPayrollPeriods.SETRANGE("Date Opened", SelectedPeriod);
        if PRPayrollPeriods.FINDFIRST() then PeriodName := UPPERCASE(PRPayrollPeriods."Period Name");
    end;

    var
        CompInfo: Record "Company Information";
        Employe: Record Employee;
        IDNo, KRAPIN : Code[20];
        FullName: Text[100];
        PeriodName: Text;
        SelectedPeriod: Date;
        PRPayrollPeriods: Record "PR Payroll Periods";
}
