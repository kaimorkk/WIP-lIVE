Page 52193518 "Receipts Buffer"
{
    PageType = List;
    SourceTable = "Receipts Buffer";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EntryNo;"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionDate;"Transaction Date")
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo;"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionType;"Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field(StaffPayrollNo;"Staff/Payroll No")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Reconciled;Reconciled)
                {
                    ApplicationArea = Basic;
                }
                field(EmployerCode;"Employer Code")
                {
                    ApplicationArea = Basic;
                }
                field(MemberNo;"Member No")
                {
                    ApplicationArea = Basic;
                }
                field(LoanNo;"Loan No.")
                {
                    ApplicationArea = Basic;
                }
                field(StaffNotFound;"Staff Not Found")
                {
                    ApplicationArea = Basic;
                }
                field(NoRepayment;"No Repayment")
                {
                    ApplicationArea = Basic;
                }
                field(MultipleReceipts;"Multiple Receipts")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
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
            action(Import)
            {
                ApplicationArea = Basic;
            }
            separator(Action1000000018)
            {
            }
            action("Validate data")
            {
                ApplicationArea = Basic;
            }
            separator(Action1000000020)
            {
            }
            action("Generate Receipt Batch")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

