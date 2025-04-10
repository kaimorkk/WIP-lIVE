Page 52194296 "PVs Posted List"
{
    ApplicationArea = Basic;
    CardPageID = "Payment Voucher-Posted";
    Editable = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where(Posted=const(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(DatePosted;"Date Posted")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(PayMode;"Pay Mode")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Payment Modes111";
                }
                field(ChequeNo;"Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate;"Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount;"Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeType;"Cheque Type")
                {
                    ApplicationArea = Basic;
                }
                field(KBABankCode;"KBA Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(Payee;Payee)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(PayingBankAccount;"Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(NetAmount;"Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field(EftGenerated;"Eft Generated")
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

