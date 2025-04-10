report 52193533 "PR Itax Car Benefits"
{
    ApplicationArea = All;
    Caption = 'PR Itax Car Benefits';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Itax Car Benefits.rdlc';
    dataset
    {
        dataitem(PRPeriodTransactions; "PR Period Transactions")
        {
            RequestFilterFields = "Payroll Period", "Transaction Code";

            column(TransactionCode; "Transaction Code")
            {
            }
            column(TransactionName; "Transaction Name")
            {
            }
            column(TransactionGroup; "Transaction Group")
            {
            }
            column(TransactionType; "Transaction Type")
            {
            }
            column(EmployeeCode; "Employee Code")
            {
            }
            column(EmployeeType; "Employee Type")
            {
            }
            column(Amount; Amount)
            {
            }
            column(ACNumber; "A/C Number")
            {
            }
            column(BranchCode; "Branch Code")
            {
            }
            column(CurrentDutyStation; "Current Duty Station")
            {
            }
            column(DirectorateCode; "Directorate Code")
            {
            }
            column(ImplementingUnitName; "Implementing Unit Name")
            {
            }
            column(JobTitle2; "Job Title2")
            {
            }
            column(PayrollPeriod; "Payroll Period")
            {
            }
            column(PeriodMonth; "Period Month")
            {
            }
            column(KRAPin; KRAPin)
            { }
            column(EmployeeName; EmployeeName)
            { }
            column(CarBenefitCode; CarBenefitCode)
            { }
            column(RefenceToSecion; RefenceToSecion)
            { }
            column(CarRegNo; CarRegNo)
            { }
            column(Make; Make)
            { }
            column(BodyType; BodyType)
            { }
            column(CCRating; CCRating)
            { }
            column(TypeofCarCost; TypeofCarCost)
            { }
            column(CostofOwnedCar; CostofOwnedCar)
            { }
            column(ValueofCarBenefit; ValueofCarBenefit)
            { }
            trigger OnAfterGetRecord()
            begin
                if HrEmp.Get("Employee Code") then begin
                    KRAPin := HrEmp."P.I.N";
                    EmployeeName := HrEmp.FullName();
                end;
                RefenceToSecion := 'B_Employees_Dtls';
                BodyType := 'Saloon Hatch Backs and Estates';
                TypeofCarCost := 'Hired';
                Make := 'Unknown';
                CCRating := '0';

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

    Var
        KRAPin: Text;
        EmployeeName: Text;
        HrEmp: Record Employee;
        CarBenefitCode: Code[20];
        RefenceToSecion: Text;
        CarRegNo: Text;
        Make: Text;
        BodyType: Text;
        CCRating: Text;
        TypeofCarCost: Text;
        CostofOwnedCar: Text;
        ValueofCarBenefit: Text;



}
