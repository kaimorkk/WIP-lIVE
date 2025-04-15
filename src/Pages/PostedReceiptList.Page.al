Page 52194384 "Posted Receipt List"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Receipt";
    Editable = false;
    PageType = List;
    SourceTable = "Receipts Header1";
    SourceTableView = where(Posted = const(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field(PayMode; "Pay Mode")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Payment Modes111";
                }
                field(ChequeNo; "Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate; "Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                // field(TotalAmount;"Total Amount")
                // {
                //     ApplicationArea = Basic;
                // }
                field(AmountLCY; "Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(BankCode; "Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(ReceivedFrom; "Received From")
                {
                    ApplicationArea = Basic;
                }
                field(OnBehalfOf; "On Behalf Of")
                {
                    ApplicationArea = Basic;
                }
                field(Cashier; Cashier)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field(PostedDate; "Posted Date")
                {
                    ApplicationArea = Basic;
                }
                field(PostedTime; "Posted Time")
                {
                    ApplicationArea = Basic;
                }
                field(PostedBy; "Posted By")
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                // field(ProcurementMethod;"Procurement Method")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(ProcurementRequest;"Procurement Request")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                // field(Banked;Banked)
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
    }
}

