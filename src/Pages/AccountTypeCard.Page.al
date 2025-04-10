Page 52193684 "Account Type Card"
{
    PageType = Card;
    SourceTable = "Account Types";

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
                field(Type;Type)
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
                field(AllowOverdraft;"Allow Overdraft")
                {
                    ApplicationArea = Basic;
                }
                field(InvestmentAccount;"Investment Account")
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
                field(SavingsWithdrawalpenalty;"Savings Withdrawal penalty")
                {
                    ApplicationArea = Basic;
                }
                field(SavingsPenaltyAccount;"Savings Penalty Account")
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
                field(InterestReceivable;"Interest Receivable")
                {
                    ApplicationArea = Basic;
                }
                field(MinAmountonTaxInterest;"Min Amount on Tax Interest")
                {
                    ApplicationArea = Basic;
                }
                field(InterestCapitalizationDate;"Interest Capitalization Date")
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
                field(FeeBelowMinimumBalance;"Fee Below Minimum Balance")
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
                field(CoinDepositCharge;"Coin Deposit Charge")
                {
                    ApplicationArea = Basic;
                }
                field(CoinDepositMinimumAmount;"Coin Deposit Minimum Amount")
                {
                    ApplicationArea = Basic;
                }
                field(CoinDepositFlatCharge;"Coin Deposit Flat Charge")
                {
                    ApplicationArea = Basic;
                }
                field(ChargeMonthlyServiceFee;"Charge Monthly Service Fee")
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
                field(LedgerFeesAccount;"Ledger Fees Account")
                {
                    ApplicationArea = Basic;
                }
                field(RTGSCharges;"RTGS Charges")
                {
                    ApplicationArea = Basic;
                }
                field(RTGSChargesAccount;"RTGS Charges Account")
                {
                    ApplicationArea = Basic;
                }
                field(SalariesWagesProcessing;"Salaries / Wages Processing")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeRequisition;"Cheque Requisition")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeLeafRequisition;"Cheque Leaf  Requisition")
                {
                    ApplicationArea = Basic;
                }
                field(FeebellowMinBalAccount;"Fee bellow Min. Bal. Account")
                {
                    ApplicationArea = Basic;
                }
                field(LoanLetterofGuaranteeCharg;"Loan Letter of Guarantee Charg")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Account Notices")
            {
                ApplicationArea = Basic;
                RunObject = Page "Account Notices";
                RunPageLink = "Account Type"=field(Code);
            }
        }
    }
}

