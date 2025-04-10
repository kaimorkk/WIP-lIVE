Page 52193572 "Bankers Cheque Schedule"
{
    Caption = 'Banking Schedule';
    Editable = false;
    PageType = List;
    SourceTable = Transactions;
    SourceTableView = where(Type = const("Bankers Cheque"),
                            Posted = const(true),
                            "Cheque Processed" = const(false));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo; "Account No")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName; "Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionType; "Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Cashier; Cashier)
                {
                    ApplicationArea = Basic;
                }
                field(TransactionDate; "Transaction Date")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionTime; "Transaction Time")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(AccountType; "Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountDescription; "Account Description")
                {
                    ApplicationArea = Basic;
                }
                field(DenominationTotal; "Denomination Total")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeType; "Cheque Type")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo; "Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate; "Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Payee)
                {
                    ApplicationArea = Basic;
                }
                field(BankNo; "Bank No")
                {
                    ApplicationArea = Basic;
                }
                field(BranchNo; "Branch No")
                {
                    ApplicationArea = Basic;
                }
                field(ClearingCharges; "Clearing Charges")
                {
                    ApplicationArea = Basic;
                }
                field(ClearingDays; "Clearing Days")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(BankName; "Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field(BranchName; "Branch Name")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionMode; "Transaction Mode")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(TransactionDescription; "Transaction Description")
                {
                    ApplicationArea = Basic;
                }
                field(MinimumAccountBalance; "Minimum Account Balance")
                {
                    ApplicationArea = Basic;
                }
                field(FeeBelowMinimumBalance; "Fee Below Minimum Balance")
                {
                    ApplicationArea = Basic;
                }
                field(NormalWithdrawalCharge; "Normal Withdrawal Charge")
                {
                    ApplicationArea = Basic;
                }
                field(Authorised; Authorised)
                {
                    ApplicationArea = Basic;
                }
                field(CheckedBy; "Checked By")
                {
                    ApplicationArea = Basic;
                }
                field(FeeonWithdrawalInterval; "Fee on Withdrawal Interval")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(DatePosted; "Date Posted")
                {
                    ApplicationArea = Basic;
                }
                field(TimePosted; "Time Posted")
                {
                    ApplicationArea = Basic;
                }
                field(PostedBy; "Posted By")
                {
                    ApplicationArea = Basic;
                }
                field(ExpectedMaturityDate; "Expected Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field(Picture; Picture)
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionCategory; "Transaction Category")
                {
                    ApplicationArea = Basic;
                }
                field(Deposited; Deposited)
                {
                    ApplicationArea = Basic;
                }
                field(DateDeposited; "Date Deposited")
                {
                    ApplicationArea = Basic;
                }
                field(TimeDeposited; "Time Deposited")
                {
                    ApplicationArea = Basic;
                }
                field(DepositedBy; "Deposited By")
                {
                    ApplicationArea = Basic;
                }
                field(PostDated; "Post Dated")
                {
                    ApplicationArea = Basic;
                }
                field(Select; Select)
                {
                    ApplicationArea = Basic;
                }
                field(StatusDate; "Status Date")
                {
                    ApplicationArea = Basic;
                }
                field(StatusTime; "Status Time")
                {
                    ApplicationArea = Basic;
                }
                field(SupervisorChecked; "Supervisor Checked")
                {
                    ApplicationArea = Basic;
                }
                field(BookBalance; "Book Balance")
                {
                    ApplicationArea = Basic;
                }
                field(NoticeNo; "Notice No")
                {
                    ApplicationArea = Basic;
                }
                field(NoticeCleared; "Notice Cleared")
                {
                    ApplicationArea = Basic;
                }
                field(ScheduleAmount; "Schedule Amount")
                {
                    ApplicationArea = Basic;
                }
                field(HasSchedule; "Has Schedule")
                {
                    ApplicationArea = Basic;
                }
                field(Requested; Requested)
                {
                    ApplicationArea = Basic;
                }
                field(DateRequested; "Date Requested")
                {
                    ApplicationArea = Basic;
                }
                field(TimeRequested; "Time Requested")
                {
                    ApplicationArea = Basic;
                }
                field(RequestedBy; "Requested By")
                {
                    ApplicationArea = Basic;
                }
                field(Overdraft; Overdraft)
                {
                    ApplicationArea = Basic;
                }
                field(ChequeProcessed; "Cheque Processed")
                {
                    ApplicationArea = Basic;
                }
                field(StaffPayrollNo; "Staff/Payroll No")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeTransferred; "Cheque Transferred")
                {
                    ApplicationArea = Basic;
                }
                field(ExpectedAmount; "Expected Amount")
                {
                    ApplicationArea = Basic;
                }
                field(LineTotals; "Line Totals")
                {
                    ApplicationArea = Basic;
                }
                field(TransferDate; "Transfer Date")
                {
                    ApplicationArea = Basic;
                }
                field(BIHNo; "BIH No")
                {
                    ApplicationArea = Basic;
                }
                field(TransferNo; "Transfer No")
                {
                    ApplicationArea = Basic;
                }
                field(Attached; Attached)
                {
                    ApplicationArea = Basic;
                }
                field(BOSAAccountNo; "BOSA Account No")
                {
                    ApplicationArea = Basic;
                }
                field(SalaryProcessing; "Salary Processing")
                {
                    ApplicationArea = Basic;
                }
                field(ExpenseAccount; "Expense Account")
                {
                    ApplicationArea = Basic;
                }
                field(ExpenseDescription; "Expense Description")
                {
                    ApplicationArea = Basic;
                }
                field(CompanyCode; "Company Code")
                {
                    ApplicationArea = Basic;
                }
                field(ScheduleType; "Schedule Type")
                {
                    ApplicationArea = Basic;
                }
                field(BankedBy; "Banked By")
                {
                    ApplicationArea = Basic;
                }
                field(DateBanked; "Date Banked")
                {
                    ApplicationArea = Basic;
                }
                field(TimeBanked; "Time Banked")
                {
                    ApplicationArea = Basic;
                }
                field(BankingPosted; "Banking Posted")
                {
                    ApplicationArea = Basic;
                }
                field(ClearedBy; "Cleared By")
                {
                    ApplicationArea = Basic;
                }
                field(DateCleared; "Date Cleared")
                {
                    ApplicationArea = Basic;
                }
                field(TimeCleared; "Time Cleared")
                {
                    ApplicationArea = Basic;
                }
                field(ClearingPosted; "Clearing Posted")
                {
                    ApplicationArea = Basic;
                }
                field(NeedsApproval; "Needs Approval")
                {
                    ApplicationArea = Basic;
                }
                field(IDType; "ID Type")
                {
                    ApplicationArea = Basic;
                }
                field(IDNo; "ID No")
                {
                    ApplicationArea = Basic;
                }
                field(ReferenceNo; "Reference No")
                {
                    ApplicationArea = Basic;
                }
                field(RefundCheque; "Refund Cheque")
                {
                    ApplicationArea = Basic;
                }
                field(Imported; Imported)
                {
                    ApplicationArea = Basic;
                }
                field(ExternalAccountNo; "External Account No")
                {
                    ApplicationArea = Basic;
                }
                field(BOSATransactions; "BOSA Transactions")
                {
                    ApplicationArea = Basic;
                }
                field(BankAccount; "Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(SaversTotal; "Savers Total")
                {
                    ApplicationArea = Basic;
                }
                field(MustaafuTotal; "Mustaafu Total")
                {
                    ApplicationArea = Basic;
                }
                field(JuniorStarTotal; "Junior Star Total")
                {
                    ApplicationArea = Basic;
                }
                field(Printed; Printed)
                {
                    ApplicationArea = Basic;
                }
                field(Control1000000097; "Account Type.")
                {
                    ApplicationArea = Basic;
                }
                field(Control1000000098; "Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(WithdrawalFrequencyAuthorised; "Withdrawal FrequencyAuthorised")
                {
                    ApplicationArea = Basic;
                }
                field(FrequencyNeedsApproval; "Frequency Needs Approval")
                {
                    ApplicationArea = Basic;
                }
                field(SpecialAdvanceNo; "Special Advance No")
                {
                    ApplicationArea = Basic;
                }
                field(BankersChequeType; "Bankers Cheque Type")
                {
                    ApplicationArea = Basic;
                }
                field(SuspendedAmount; "Suspended Amount")
                {
                    ApplicationArea = Basic;
                }
                field(TransferredByEFT; "Transferred By EFT")
                {
                    ApplicationArea = Basic;
                }
                field(BankingUser; "Banking User")
                {
                    ApplicationArea = Basic;
                }
                field(CompanyTextName; "Company Text Name")
                {
                    ApplicationArea = Basic;
                }
                field(DateFilter; "Date Filter")
                {
                    ApplicationArea = Basic;
                }
                field(TotalSalaries; "Total Salaries")
                {
                    ApplicationArea = Basic;
                }
                field(EFTTransferred; "EFT Transferred")
                {
                    ApplicationArea = Basic;
                }
                field(ATMTransactionsTotal; "ATM Transactions Total")
                {
                    ApplicationArea = Basic;
                }
                field(BankCode; "Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(ExternalAccountName; "External Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(OverdraftLimit; "Overdraft Limit")
                {
                    ApplicationArea = Basic;
                }
                field(OverdraftAllowed; "Overdraft Allowed")
                {
                    ApplicationArea = Basic;
                }
                field(AvailableBalance; "Available Balance")
                {
                    ApplicationArea = Basic;
                }
                field(AuthorisationRequirement; "Authorisation Requirement")
                {
                    ApplicationArea = Basic;
                }
                field(BankersChequeNo; "Bankers Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionSpan; "Transaction Span")
                {
                    ApplicationArea = Basic;
                }
                field(UnclearedCheques; "Uncleared Cheques")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionAvailableBalance; "Transaction Available Balance")
                {
                    ApplicationArea = Basic;
                }
                field(BranchAccount; "Branch Account")
                {
                    ApplicationArea = Basic;
                }
                field(BranchTransaction; "Branch Transaction")
                {
                    ApplicationArea = Basic;
                }
                field(FOSABranchName; "FOSA Branch Name")
                {
                    ApplicationArea = Basic;
                }
                field(BranchRefference; "Branch Refference")
                {
                    ApplicationArea = Basic;
                }
                field(BranchAccountNo; "Branch Account No")
                {
                    ApplicationArea = Basic;
                }
                field(BranchTransactionDate; "Branch Transaction Date")
                {
                    ApplicationArea = Basic;
                }
                field(PostAttempted; "Post Attempted")
                {
                    ApplicationArea = Basic;
                }
                field(TransactingBranch; "Transacting Branch")
                {
                    ApplicationArea = Basic;
                }
                field(Signature; Signature)
                {
                    ApplicationArea = Basic;
                }
                field(IncomeType; "Income Type")
                {
                    ApplicationArea = Basic;
                }
                field(Commissions; Commissions)
                {
                    ApplicationArea = Basic;
                }
                field(UnIndentifiedTotal; "Un Indentified Total")
                {
                    ApplicationArea = Basic;
                }
                field(SigningInstructions; "Signing Instructions")
                {
                    ApplicationArea = Basic;
                }
                field(WithdrawUncleared; "Withdraw Uncleared")
                {
                    ApplicationArea = Basic;
                }
                field(Source; Source)
                {
                    ApplicationArea = Basic;
                }
                field(SourceNumber; "Source Number")
                {
                    ApplicationArea = Basic;
                }
                field(DontAllowTransactions; "Don't Allow Transactions")
                {
                    ApplicationArea = Basic;
                }
                field("10MalotiNotes"; "10 Maloti Notes")
                {
                    ApplicationArea = Basic;
                }
                field("20MalotiNotes"; "20 Maloti Notes")
                {
                    ApplicationArea = Basic;
                }
                field("50MalotiNotes"; "50 Maloti Notes")
                {
                    ApplicationArea = Basic;
                }
                field("100MalotiNotes"; "100 Maloti Notes")
                {
                    ApplicationArea = Basic;
                }
                field("200MalotiNotes"; "200 Maloti Notes")
                {
                    ApplicationArea = Basic;
                }
                field("1000MalotiNotes"; "1000 Maloti Notes")
                {
                    ApplicationArea = Basic;
                }
                field("5Lisente"; "5 Lisente")
                {
                    ApplicationArea = Basic;
                }
                field("10Lisente"; "10 Lisente")
                {
                    ApplicationArea = Basic;
                }
                field("20Lisente"; "20 Lisente")
                {
                    ApplicationArea = Basic;
                }
                field("50Lisente"; "50 Lisente")
                {
                    ApplicationArea = Basic;
                }
                field("1Loti"; "1 Loti")
                {
                    ApplicationArea = Basic;
                }
                field("2Maloti"; "2 Maloti")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyDenominationalTotals; "Currency Denominational Totals")
                {
                    ApplicationArea = Basic;
                }
                field("5Maloti"; "5 Maloti")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control1901138007; "Vendor Details FactBox")
            {
                SubPageLink = "No." = field("No. Series");
                Visible = false;
            }
            part(Control1904651607; "Vendor Statistics FactBox")
            {
                SubPageLink = "No." = field("No. Series");
                Visible = true;
            }
            part(Control1903435607; "Vendor Hist. Buy-from FactBox")
            {
                SubPageLink = "No." = field("No. Series");
                Visible = true;
            }
            part(Control1906949207; "Vendor Hist. Pay-to FactBox")
            {
                SubPageLink = "No." = field("No. Series");
                Visible = false;
            }
            systempart(Control1900383207; Links)
            {
                Visible = true;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Vendor)
            {
                Caption = 'Ven&dor';
                action(LedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    Image = VendorLedger;
                    RunObject = Page "Vendor Ledger Entries";
                    RunPageLink = "Vendor No." = field("No. Series");
                    RunPageView = sorting("Vendor No.");
                    ShortCutKey = 'Ctrl+F7';
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Vendor),
                                  "No." = field("No. Series");
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    action(DimensionsSingle)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = const(23),
                                      "No." = field("No. Series");
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action(DimensionsMultiple)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';

                        trigger OnAction()
                        var
                            Vend: Record Vendor;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Vend);
                            // //DefaultDimMultiple.SetMultiVendor(Vend);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                action(BankAccounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Accounts';
                    RunObject = Page "Vendor Bank Account List";
                    RunPageLink = "Vendor No." = field("No. Series");
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(LedgerEntries_Promoted; LedgerEntries)
                {
                }
            }
        }
    }


    procedure GetSelectionFilter(): Code[80]
    var
        Vend: Record Vendor;
        FirstVend: Code[30];
        LastVend: Code[30];
        SelectionFilter: Code[250];
        VendCount: Integer;
        More: Boolean;
    begin
        CurrPage.SetSelectionFilter(Vend);
        VendCount := Vend.Count;
        if VendCount > 0 then begin
            Vend.Find('-');
            while VendCount > 0 do begin
                VendCount := VendCount - 1;
                Vend.MarkedOnly(false);
                FirstVend := Vend."No.";
                LastVend := FirstVend;
                More := (VendCount > 0);
                while More do
                    if Vend.Next = 0 then
                        More := false
                    else
                        if not Vend.Mark then
                            More := false
                        else begin
                            LastVend := Vend."No.";
                            VendCount := VendCount - 1;
                            if VendCount = 0 then
                                More := false;
                        end;
                if SelectionFilter <> '' then
                    SelectionFilter := SelectionFilter + '|';
                if FirstVend = LastVend then
                    SelectionFilter := SelectionFilter + FirstVend
                else
                    SelectionFilter := SelectionFilter + FirstVend + '..' + LastVend;
                if VendCount > 0 then begin
                    Vend.MarkedOnly(true);
                    Vend.Next;
                end;
            end;
        end;
        exit(SelectionFilter);
    end;


    procedure SetSelection(var Vend: Record Vendor)
    begin
        CurrPage.SetSelectionFilter(Vend);
    end;
}

