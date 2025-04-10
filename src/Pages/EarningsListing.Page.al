Page 52193975 "Earnings Listing"
{
    Editable = false;
    PageType = List;
    SourceTable = EarningsX1;

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
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(ShowonMasterRoll;"Show on Master Roll")
                {
                    ApplicationArea = Basic;
                }
                field(ResponsibilityAllowanceCode;"Responsibility Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field(CommuterAllowanceCode;"Commuter Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field(HouseAllowanceCode;"House Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field(EarningType;"Earning Type")
                {
                    ApplicationArea = Basic;
                }
                field(AppliestoAll;"Applies to All")
                {
                    ApplicationArea = Basic;
                }
                field(GLAccount;"G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field(Block;Block)
                {
                    ApplicationArea = Basic;
                }
                field(PayType;"Pay Type")
                {
                    ApplicationArea = Basic;
                }
                field(Weekend;Weekend)
                {
                    ApplicationArea = Basic;
                }
                field(Weekday;Weekday)
                {
                    ApplicationArea = Basic;
                }
                field(ProRataLeave;"ProRata Leave")
                {
                    ApplicationArea = Basic;
                }
                field(StartDate;"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate;"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(CalculationMethod;"Calculation Method")
                {
                    ApplicationArea = Basic;
                }
                field(FlatAmount;"Flat Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage;Percentage)
                {
                    ApplicationArea = Basic;
                }
                field(Taxable;Taxable)
                {
                    ApplicationArea = Basic;
                }
                field(ReducesTax;"Reduces Tax")
                {
                    ApplicationArea = Basic;
                }
                field(NonCashBenefit;"Non-Cash Benefit")
                {
                    ApplicationArea = Basic;
                }
                field(Months;Months)
                {
                    ApplicationArea = Basic;
                }
                field(Quarters;Quarters)
                {
                    ApplicationArea = Basic;
                }
                field(OvertimeFactor;"Overtime Factor")
                {
                    ApplicationArea = Basic;
                }
                field(OverTime;OverTime)
                {
                    ApplicationArea = Basic;
                }
                field(LowInterestBenefit;"Low Interest Benefit")
                {
                    ApplicationArea = Basic;
                }
                field(MinimumLimit;"Minimum Limit")
                {
                    ApplicationArea = Basic;
                }
                field(MaximumLimit;"Maximum Limit")
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount;"Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(CoinageRounding;CoinageRounding)
                {
                    ApplicationArea = Basic;
                }
                field(ShowonReport;"Show on Report")
                {
                    ApplicationArea = Basic;
                }
                field(ShowBalance;"Show Balance")
                {
                    ApplicationArea = Basic;
                }
                field(TotalDays;"Total Days")
                {
                    ApplicationArea = Basic;
                }
                field(OverDrawn;OverDrawn)
                {
                    ApplicationArea = Basic;
                }
                field(BasicSalaryCode;"Basic Salary Code")
                {
                    ApplicationArea = Basic;
                }
                field(TimeSheet;"Time Sheet")
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
        Payment: Record EarningsX1 temporary;
        PaymentCode: Code[10];
        "Actions": Option Add,edit,Delete;
        Sources: Option Payment,Deduction,Saving;
}

