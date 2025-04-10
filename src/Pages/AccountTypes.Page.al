Page 52193542 "Account Types"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Account Types";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(AccountNoPrefix;"Account No Prefix")
                {
                    ApplicationArea = Basic;
                }
                field(SMSDescription;"SMS Description")
                {
                    ApplicationArea = Basic;
                }
                field(DormancyPeriodM;"Dormancy Period (M)")
                {
                    ApplicationArea = Basic;
                }
                field(WithdrawalInterval;"Withdrawal Interval")
                {
                    ApplicationArea = Basic;
                }
                field(WithdrawalPenalty;"Withdrawal Penalty")
                {
                    ApplicationArea = Basic;
                }
                field(PostingGroup;"Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(WithdrawalIntervalAccount;"Withdrawal Interval Account")
                {
                    ApplicationArea = Basic;
                }
                field(RequiresOpeningDeposit;"Requires Opening Deposit")
                {
                    ApplicationArea = Basic;
                }
                field(AllowLoanApplications;"Allow Loan Applications")
                {
                    ApplicationArea = Basic;
                }
                field(DontAllowTransactions;"Don't Allow Transactions")
                {
                    ApplicationArea = Basic;
                }
                field(FixedDeposit;"Fixed Deposit")
                {
                    ApplicationArea = Basic;
                }
                field(MinimumBalance;"Minimum Balance")
                {
                    ApplicationArea = Basic;
                }
                field(StandingOrdersSuspense;"Standing Orders Suspense")
                {
                    ApplicationArea = Basic;
                }
                field(BankersChequeAccount;"Bankers Cheque Account")
                {
                    ApplicationArea = Basic;
                }
                field(MaximumWithdrawalAmount;"Maximum Withdrawal Amount")
                {
                    ApplicationArea = Basic;
                }
                field(MaximumAllowableDeposit;"Maximum Allowable Deposit")
                {
                    ApplicationArea = Basic;
                }
                field(QuarterlyLedgerFees;"Quarterly Ledger Fees")
                {
                    ApplicationArea = Basic;
                }
                field(LedgerFeesAccount;"Ledger Fees Account")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Interest Computation")
            {
                field(EarnsInterest;"Earns Interest")
                {
                    ApplicationArea = Basic;
                }
                field(InterestRate;"Interest Rate")
                {
                    ApplicationArea = Basic;
                }
                field(InterestCalcMinBalance;"Interest Calc Min Balance")
                {
                    ApplicationArea = Basic;
                }
                field(MinimumInterestPeriodM;"Minimum Interest Period (M)")
                {
                    ApplicationArea = Basic;
                }
                field(InterestExpenseAccount;"Interest Expense Account")
                {
                    ApplicationArea = Basic;
                }
                field(InterestPayableAccount;"Interest Payable Account")
                {
                    ApplicationArea = Basic;
                }
                field(InterestForfeitedAccount;"Interest Forfeited Account")
                {
                    ApplicationArea = Basic;
                }
                field(TaxOnInterest;"Tax On Interest")
                {
                    ApplicationArea = Basic;
                }
                field(InterestTaxAccount;"Interest Tax Account")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Charges)
            {
                field(AccountOpenningFee;"Account Openning Fee")
                {
                    ApplicationArea = Basic;
                }
                field(AccountOpenningFeeAccount;"Account Openning Fee Account")
                {
                    ApplicationArea = Basic;
                }
                field(ReactivationFee;"Re-activation Fee")
                {
                    ApplicationArea = Basic;
                }
                field(ReactivationFeeAccount;"Re-activation Fee Account")
                {
                    ApplicationArea = Basic;
                }
                field(RequiresClosureNotice;"Requires Closure Notice")
                {
                    ApplicationArea = Basic;
                }
                field(ClosureNoticePeriod;"Closure Notice Period")
                {
                    ApplicationArea = Basic;
                }
                field(ClosingCharge;"Closing Charge")
                {
                    ApplicationArea = Basic;
                }
                field(ClosingPriorNoticeCharge;"Closing Prior Notice Charge")
                {
                    ApplicationArea = Basic;
                }
                field(MinBalCalcFrequency;"Min Bal. Calc Frequency")
                {
                    ApplicationArea = Basic;
                }
                field(FeebellowMinBalAccount;"Fee bellow Min. Bal. Account")
                {
                    ApplicationArea = Basic;
                }
                field(OverdraftCharge;"Overdraft Charge")
                {
                    ApplicationArea = Basic;
                }
                field(AuthorisedOvedraftCharge;"Authorised Ovedraft Charge")
                {
                    ApplicationArea = Basic;
                }
                field(BusinessAccServiceCharge;"Business Acc Service Charge")
                {
                    ApplicationArea = Basic;
                }
                field(PersonalAccMaintenenceFee;"Personal Acc Maintenence Fee")
                {
                    ApplicationArea = Basic;
                }
                field(ExternalEFTCharges;"External EFT Charges")
                {
                    ApplicationArea = Basic;
                }
                field(InternalEFTCharges;"Internal EFT Charges")
                {
                    ApplicationArea = Basic;
                }
                field(EFTChargesAccount;"EFT Charges Account")
                {
                    ApplicationArea = Basic;
                }
                field(StatementCharge;"Statement Charge")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000058;Notes)
            {
            }
            systempart(Control1000000057;MyNotes)
            {
            }
            systempart(Control1000000056;Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            group(Notices)
            {
                Caption = 'Notices';
                action(Action1000000054)
                {
                    ApplicationArea = Basic;
                    Caption = 'Notices';
                    RunObject = Page "Account Notices";
                    RunPageLink = "Account Type"=field(Code);
                }
            }
        }
    }
}

