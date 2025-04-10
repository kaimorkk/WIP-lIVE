Page 52193629 "Allocated List"
{
    ApplicationArea = Basic;
    Caption = 'Allocated List';
    CardPageID = Allocated;
    Editable = false;
    PageType = List;
    SourceTable = Receipts;
    SourceTableView = where(Posted=filter(true));
    UsageCategory = History;

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
                field(TotalLineAmount;"Total Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries;"No.Series")
                {
                    ApplicationArea = Basic;
                }
                field(Cashier;Cashier)
                {
                    ApplicationArea = Basic;
                }
                field(BankAccount;"Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(ExtDocumentNo;"Ext. Document No.")
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
                field(LineTotals;"Line Totals")
                {
                    ApplicationArea = Basic;
                }
                field(PostingDate;"Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(EmployerCode;"Employer Code")
                {
                    ApplicationArea = Basic;
                }
                field(ReceivedFrom;"Received From")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(OnBehalfOf;"On Behalf Of")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiptType;"Receipt Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(PostingTime;"Posting Time")
                {
                    ApplicationArea = Basic;
                }
                field(PostedBy;"Posted By")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode;"Currency Code")
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

