Page 52193961 "Payment & Deductions"
{
    DataCaptionFields = "Employee No",Type,"Code";
    PageType = Card;
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
                    Visible = false;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Closed;Closed)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                             /* IF Type=Type::Deduction THEN
                              BEGIN
                              IF Deductions.GET(Code) THEN
                              IF Deductions.Loan=TRUE THEN
                              ERROR('You cannot enter loans through this screen');
                              END; */

                    end;
                }
                field(PolicyNoLoanNo;"Policy No./Loan No.")
                {
                    ApplicationArea = Basic;
                }
                field(LoanProductType;"Loan Product Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(PayrollPeriod;"Payroll Period")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(InsuranceCode;"Insurance Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(GratuityPAYE;"Gratuity PAYE")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                    Visible = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(BasicSalaryCode;"Basic Salary Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(NoofUnits;"No. of Units")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Frequency;Frequency)
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                field(Cost;Cost)
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeTierI;"Employee Tier I")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeTierII;"Employee Tier II")
                {
                    ApplicationArea = Basic;
                }
                field(EmployerTierII;"Employer Tier II")
                {
                    ApplicationArea = Basic;
                }
                field(EmployerTierI;"Employer Tier I")
                {
                    ApplicationArea = Basic;
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
                    Visible = true;
                }
                field(Retirement;Retirement)
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                    Visible = false;
                }
                field(Quarters;Quarters)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(InterestAmount;"Interest Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(NormalEarnings;"Normal Earnings")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
              if Type=Type::Deduction then
              begin
              if Deductions.Get(Code) then
              if Deductions.Loan=true then
              Error('You cannot delete loans through this screen');
              end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
             /* IF Type=Type::Deduction THEN
              BEGIN
              IF Deductions.GET(Code) THEN
              IF Deductions.Loan=TRUE THEN
              ERROR('You cannot enter loans through this screen');
              END;*/

    end;

    trigger OnModifyRecord(): Boolean
    begin
              if Type=Type::Deduction then
              begin
              if Deductions.Get(Code) then
              ;
              //IF Deductions.Loan=TRUE THEN
              //ERROR('You cannot modify loans through this screen');
              end;
    end;

    var
        GetGroup: Codeunit Payroll5;
        GroupCode: Code[20];
        CUser: Code[20];
        Deductions: Record DeductionsX1;
}

