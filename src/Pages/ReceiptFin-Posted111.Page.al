Page 52193704 "ReceiptFin - Posted111"
{
    PageType = Card;
    SourceTable = "Receipts HeaderFin";
    SourceTableView = where(Posted=const(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(PayMode;"Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo;"Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate;"Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(ReceivedFrom;"Received From")
                {
                    ApplicationArea = Basic;
                }
                field(OnBehalfOf;"On Behalf Of")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(AmountLCY;"Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(BankCode;"Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(Cashier;Cashier)
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode;"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code;"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part("Receipt Lines";"Receipts LineFin111")
            {
                SubPageLink = "Receipt No."=field("No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Post)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                     PostRcptFin.PostReceiptFinance(Rec);
                end;
            }
            separator(Action1000000022)
            {
            }
            action("Print Receipt")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    if Posted=false then
                     Error('Receipt No %1 has not been posted',"No.");
                    Reset;
                    BankLedgerEntry.SetRange(BankLedgerEntry."Document No.","No.");
                    Report.Run(51508001,true,true,BankLedgerEntry);
                    Reset;
                end;
            }
        }
    }

    var
        PostRcptFin: Codeunit "Receipt Management";
        BankLedgerEntry: Record "Bank Account Ledger Entry";
}

