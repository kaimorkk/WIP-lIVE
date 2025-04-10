Page 52193955 Earnings
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = EarningsX1;
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
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(ShowonMasterRoll;"Show on Master Roll")
                {
                    ApplicationArea = Basic;
                }
                field(BasicPayArrears;"Basic Pay Arrears")
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
                field(Fringe;Fringe)
                {
                    ApplicationArea = Basic;
                }
                field(MarketRate;"Market Rate")
                {
                    ApplicationArea = Basic;
                }
                field(CompanyRate;"Company Rate")
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
                field(SalaryRecovery;"Salary Recovery")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(EarningsMassupdate)
            {
                Caption = 'Earnings Mass update';
                action(MassUpdateEarnings)
                {
                    ApplicationArea = Basic;
                    Caption = 'Mass Update Earnings';
                    RunPageOnRec = true;

                    trigger OnAction()
                    begin
                         EarningsMassUpdate.GetEarnings(Rec);
                         EarningsMassUpdate.Run;
                        
                        
                        
                        
                        
                        /*Actions:=Actions::Add;
                        Sources:=Sources::Payment;
                        AssignReport.UsePayment(Rec,Actions,Sources);
                        AssignReport.RUN;
                        */

                    end;
                }
            }
        }
    }

    var
        Payment: Record EarningsX1 temporary;
        PaymentCode: Code[10];
        "Actions": Option Add,edit,Delete;
        Sources: Option Payment,Deduction,Saving;
        EarningsMassUpdate: Report "Earnings Mass Update";
}

