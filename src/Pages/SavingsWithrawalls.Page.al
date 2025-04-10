Page 52194001 "Savings Withrawalls"
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

                    trigger OnValidate()
                    begin
                              if Type=Type::Deduction then
                              begin
                              if Deductions.Get(Code) then
                              if Deductions.Loan=true then
                              Error('You cannot enter loans through this screen');
                              end;
                    end;
                }
                field(LoanProductType;"Loan Product Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                    Visible = false;
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
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
              if Type=Type::"Saving Scheme" then
              begin
              if Deductions.Get(Code) then
              ;
             // IF Deductions.Loan=TRUE THEN
              //ERROR('You cannot delete loans through this screen');
              end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
              if Type=Type::"Saving Scheme" then
              begin
              if Deductions.Get(Code) then
              ;
              end;
    end;

    trigger OnModifyRecord(): Boolean
    begin
              if Type=Type::"Saving Scheme"  then
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

