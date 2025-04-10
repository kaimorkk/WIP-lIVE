Page 52193974 "Payment & Deductions Non"
{
    DataCaptionFields = "Employee No",Type,"Code";
    Editable = false;
    PageType = List;
    SourceTable = "Assignment Matrix-X1";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(ReferenceNumber;"Reference No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reference Number';
                }
                field(PayrollPeriod;"Payroll Period")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Paye;Paye)
                {
                    ApplicationArea = Basic;
                }
                field(LoanProductType;"Loan Product Type")
                {
                    ApplicationArea = Basic;
                }
                field(InsuranceCode;"Insurance Code")
                {
                    ApplicationArea = Basic;
                }
                field(EffectiveStartDate;"Effective Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(EffectiveEndDate;"Effective End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(MainDeductionCode;"Main Deduction Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(BasicSalaryCode;"Basic Salary Code")
                {
                    ApplicationArea = Basic;
                }
                field(NoofUnits;"No. of Units")
                {
                    ApplicationArea = Basic;
                }
                field(Frequency;Frequency)
                {
                    ApplicationArea = Basic;
                }
                field(CFPay;CFPay)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(OpeningBalance;"Opening Balance")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(OpeningBalanceCompany;"Opening Balance Company")
                {
                    ApplicationArea = Basic;
                }
                field(PeriodRepayment;"Period Repayment")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                           "Manual Entry":=true;
                    end;
                }
                field(EmployeeVoluntary;"Employee Voluntary")
                {
                    ApplicationArea = Basic;
                }
                field(OutstandingAmount;"Outstanding Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(EmployerAmount;"Employer Amount")
                {
                    ApplicationArea = Basic;
                }
                field(NextPeriodEntry;"Next Period Entry")
                {
                    ApplicationArea = Basic;
                }
                field(LoanRepay;"Loan Repay")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(NonCashBenefit;"Non-Cash Benefit")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Taxable;Taxable)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Retirement;Retirement)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(TaxDeductible;"Tax Deductible")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Taxableamount;"Taxable amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Quarters;Quarters)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(InterestAmount;"Interest Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        GetGroup: Codeunit Payroll5;
        GroupCode: Code[20];
        CUser: Code[20];
}

