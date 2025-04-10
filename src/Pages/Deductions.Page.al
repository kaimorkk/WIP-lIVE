Page 52193957 Deductions
{
    ApplicationArea = Basic;
    DataCaptionFields = "Code",Description;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = DeductionsX1;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(MainDeductionCode;"Main Deduction Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(ShowonPayslipInformation;"Show on Payslip Information")
                {
                    ApplicationArea = Basic;
                }
                field(InstitutionCode;"Institution Code")
                {
                    ApplicationArea = Basic;
                }
                field(InsuranceCode;"Insurance Code")
                {
                    ApplicationArea = Basic;
                }
                field(Block;Block)
                {
                    ApplicationArea = Basic;
                }
                field(PensionLimitPercentage;"Pension Limit Percentage")
                {
                    ApplicationArea = Basic;
                }
                field(PensionLimitAmount;"Pension Limit Amount")
                {
                    ApplicationArea = Basic;
                }
                field(AppliestoAll;"Applies to All")
                {
                    ApplicationArea = Basic;
                }
                field(ShowonMasterRoll;"Show on Master Roll")
                {
                    ApplicationArea = Basic;
                }
                field(GLAccount;"G/L Account")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(GLAccountEmployer;"G/L Account Employer")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(TotalAmountEmployer;"Total Amount Employer")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(CalculationMethod;"Calculation Method")
                {
                    ApplicationArea = Basic;
                }
                field(PAYECode;"PAYE Code")
                {
                    ApplicationArea = Basic;
                }
                field(MainLoanCode;"Main Loan Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(MaximumAmount;"Maximum Amount")
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount;"Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(FlatAmount;"Flat Amount")
                {
                    ApplicationArea = Basic;
                }
                field(FlatAmountEmployer;"Flat Amount Employer")
                {
                    ApplicationArea = Basic;
                }
                field(PensionScheme;"Pension Scheme")
                {
                    ApplicationArea = Basic;
                }
                field(Gratuity;Gratuity)
                {
                    ApplicationArea = Basic;
                }
                field(GratuityArrears;"Gratuity Arrears")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage;Percentage)
                {
                    ApplicationArea = Basic;
                }
                field(PercentageEmployer;"Percentage Employer")
                {
                    ApplicationArea = Basic;
                }
                field(VoluntaryPercentage;"Voluntary Percentage")
                {
                    ApplicationArea = Basic;
                }
                field(ReducesTaxableAmt;"Tax deductible")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reduces Taxable Amt';
                }
                field(DeductionTable;"Deduction Table")
                {
                    ApplicationArea = Basic;
                }
                field(Shares;Shares)
                {
                    ApplicationArea = Basic;
                }
                field(Loan;Loan)
                {
                    ApplicationArea = Basic;
                }
                field(NonInterestLoan;"Non-Interest Loan")
                {
                    ApplicationArea = Basic;
                }
                field(LoanType;"Loan Type")
                {
                    ApplicationArea = Basic;
                }
                field(ShowBalance;"Show Balance")
                {
                    ApplicationArea = Basic;
                }
                field(ExcludewhenonLeave;"Exclude when on Leave")
                {
                    ApplicationArea = Basic;
                }
                field(CoinageRounding;CoinageRounding)
                {
                    ApplicationArea = Basic;
                }
                field(Showonreport;"Show on report")
                {
                    ApplicationArea = Basic;
                }
                field(Cooperative;"Co-operative")
                {
                    ApplicationArea = Basic;
                }
                field(SalaryRecovery;"Salary Recovery")
                {
                    ApplicationArea = Basic;
                }
                field(Informational;Informational)
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
        Axion: Option Add,Edit,Delete;
}

