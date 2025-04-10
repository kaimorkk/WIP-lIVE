report 52193551 "PR Salary Per Scale"
{
    ApplicationArea = All;
    Caption = 'PR Salary Per Scale';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Salary Per Scale.rdl';
    dataset
    {
        dataitem(SalaryScales; "Salary Scales")
        {
            RequestFilterFields = "Period Filter";
            column(ActiveEmployees; "Active Employees")
            {
            }
            column(AppointmentAuthority; "Appointment Authority")
            {
            }
            column(BasicPayPerScale; "Basic Pay Per Scale")
            {
            }
            column(BedLimit; "Bed Limit")
            {
            }
            column(Blocked; Blocked)
            {
            }
            column(Commuter; Commuter)
            {
            }
            column(CommuterAllowance; "Commuter Allowance")
            {
            }
            column(DentalLimit; "Dental Limit")
            {
            }
            column(Description; Description)
            {
            }
            column(EmployeeCategory; "Employee Category")
            {
            }
            column(ExtraDuty; "Extra Duty")
            {
            }
            column(ExtraneousDutyAllowance; "Extraneous Duty Allowance")
            {
            }
            column(GrossPay; "Gross Pay")
            {
            }
            column(InPatientLimit; "In Patient Limit")
            {
            }
            column(MarketSalary; "Market Salary")
            {
            }
            column(MaternityLimit; "Maternity Limit")
            {
            }
            column(MaximumCarLoan; "Maximum Car Loan")
            {
            }
            column(MaximumCover; "Maximum Cover")
            {
            }
            column(MaximumMortageLoan; "Maximum Mortage Loan")
            {
            }
            column(MaximumPointer; "Maximum Pointer")
            {
            }
            column(MinimumPointer; "Minimum Pointer")
            {
            }
            column(MobilityTransferRate; "Mobility Transfer Rate")
            {
            }
            column(NonPractising; "Non-Practising")
            {
            }
            column(NumberofStaffPerScale; "Number of Staff Per Scale")
            {
            }
            column(OpticalLimit; "Optical Limit")
            {
            }
            column(OutPatientLimit; "Out Patient Limit")
            {
            }
            column(RentalHouse; "Rental House")
            {
            }
            column(ResponsibilityAllowance; "Responsibility Allowance")
            {
            }
            column(ResponsibilityAllowanceTotal; "Responsibility Allowance Total")
            {
            }
            column(RiskAllowance; "Risk Allowance")
            {
            }
            column(Scale; Scale)
            {
            }
            column(SeniorityLevel; "Seniority Level")
            {
            }
            column(SpecialDuty; "Special Duty")
            {
            }
            column(SpecialJudicialDuty; "Special Judicial Duty")
            {
            }
            column(SpecialResponsibility; "Special Responsibility")
            {
            }
            column(Status; Status)
            {
            }
            column(ValidPositions; "Valid Positions")
            {
            }
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
}
