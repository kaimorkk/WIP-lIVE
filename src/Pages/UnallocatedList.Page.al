Page 52193627 "Unallocated List"
{
    ApplicationArea = Basic;
    Caption = 'Unallocated List';
    CardPageID = Unallocated;
    PageType = List;
    SourceTable = Receipts;
    SourceTableView = where(Posted=filter(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(ReceiptDate;"Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field(ReceiptMode;"Receipt Mode")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo;"Cheque No.")
                {
                    ApplicationArea = Basic;
                }
                field(UnallocatedReceipt;"Unallocated Receipt")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate;"Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(CreationDate;"Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(EnteredBy;"Entered By")
                {
                    ApplicationArea = Basic;
                }
                field(EnteredDate;"Entered Date")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovedBy;"Approved By")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovedDate;"Approved Date")
                {
                    ApplicationArea = Basic;
                }
                field(TotalLineAmount;"Total Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field(LineTotals;"Line Totals")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

