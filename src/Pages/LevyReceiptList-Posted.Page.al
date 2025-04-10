Page 52193501 "Levy Receipt List - Posted"
{
    CardPageID = "Levy Receivables - Posted";
    Editable = false;
    PageType = List;
    SourceTable = "Levy Receipt Header";
    SourceTableView = where(Posted = filter(true));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(LicenseeNo; "Licensee No.")
                {
                    ApplicationArea = Basic;
                }
                field(LicenseeName; "Licensee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(PaymentMode; "Payment Mode")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDrawer; "Cheque Drawer")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiptDate; "Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate; "Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeName; "Cheque Name")
                {
                    ApplicationArea = Basic;
                }
                field(BankCode; "Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(PaidinBy; "Paid in By")
                {
                    ApplicationArea = Basic;
                }
                field(ExternalDocumentNo; "External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo; "Cheque No.")
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
            }
        }
    }

    actions
    {
    }
}

