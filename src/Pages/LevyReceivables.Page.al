Page 52194305 "Levy Receivables"
{
    AutoSplitKey = false;
    PageType = Card;
    SourceTable = "Levy Receipt Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(PaymentMode;"Payment Mode")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate;"Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDrawer;"Cheque Drawer")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeName;"Cheque Name")
                {
                    ApplicationArea = Basic;
                }
                field(Department;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                }
                field(PaidinBy;"Paid in By")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiptDate;"Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field(BankCode;"Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(ExternalDocumentNo;"External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo;"Cheque No.")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode;"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Activity;"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity';
                }
                field(AmountLCY;"Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            part(Control1000000018;"Levies Lines")
            {
                SubPageLink = "Registration No."=field(No);
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
                        //PostRcpt.PostReceipt(Rec);
                    end;
                }
                separator(Action1000000005)
                {
                }
                action(PrintReceipt)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Receipt';
                    RunObject = Report "Levy Receipts";

                    trigger OnAction()
                    begin

                        if Posted=false then
                         Error('Receipt No %1 has not been posted',Number.No);
                        Reset;
                        BankLedgerEntry.SetRange(BankLedgerEntry."Document No.",Number.No);
                        Report.Run(51511258,true,true,BankLedgerEntry);
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
                Enabled = false;
                Visible = false;
                action(Action1000000008)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Enabled = false;
                    Image = Print;
                    Visible = false;

                    trigger OnAction()
                    begin
                        TestField("Licensee No.");
                        Number.SetFilter(Number.No,'%1',No);
                        Report.Run(50000,true,true,Number);
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
        BankLedgerEntry: Record "Bank Account Ledger Entry";
}

