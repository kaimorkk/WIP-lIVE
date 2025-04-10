Page 52193502 "Levy Receivables - Posted"
{
    AutoSplitKey = false;
    Editable = false;
    PageType = Card;
    SourceTable = "Levy Receipt Header";
    SourceTableView = where(Posted = filter(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; No)
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
                field(ChequeDate; "Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeName; "Cheque Name")
                {
                    ApplicationArea = Basic;
                }
                field(Department; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                }
                field(AmountLCY; "Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(PaidinBy; "Paid in By")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiptDate; "Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field(BankCode; "Bank Code")
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
                field(Activity; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity';
                }
                field(Cashier; Cashier)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000000; "Levies Lines")
            {
                SubPageLink = "Registration No." = field(No);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Functions)
            {
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'Post';
                    Image = Post;

                    trigger OnAction()
                    begin
                        PostRcpt.PostLevies(Rec);
                    end;
                }
                separator(Action1000000005)
                {
                }
                action(PrintReceipt)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Receipt';

                    trigger OnAction()
                    begin

                        if Posted = false then
                            Error('Receipt No %1 has not been posted', No);
                        Reset;
                        BankLedgerEntry.SetRange(BankLedgerEntry."Document No.", No);
                        Report.Run(51511259, true, true, BankLedgerEntry);
                        Reset;
                    end;
                }
            }
        }
        area(processing)
        {
            group(Print)
            {
                Caption = 'Print';
                action(Action1000000008)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = Print;

                    trigger OnAction()
                    begin
                        TestField("Licensee No.");
                        Number.SetFilter(Number.No, '%1', No);
                        Report.Run(51511259, true, true, Number);
                        Reset;
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Post_Promoted; Post)
                {
                }
            }
        }
    }

    var
        Number: Record "Levy Receipt Header";
        PostRcpt: Codeunit "Payment- Post";
        BankLedgerEntry: Record "Bank Account Ledger Entry";
}

