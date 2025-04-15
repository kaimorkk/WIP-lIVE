Page 52194379 Receipt
{
    PageType = Card;
    SourceTable = "Receipts Header1";
    SourceTableView = where(Posted = filter(false));

    layout
    {
        area(content)
        {
            group(General)
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
                field(ReceivedFrom; "Received From")
                {
                    ApplicationArea = Basic;
                }
                field(OnBehalfOf; "On Behalf Of")
                {
                    ApplicationArea = Basic;
                }
                // field(Remarks;Remarks)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Purpose';
                // }
                field(BankCode; "Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode; "Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                // field(ExtDocumentNo;"Ext. Document No.")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                // field(TotalAmount;"Total Amount")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field(Cashier; Cashier)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000026; "Receipts Line")
            {
                SubPageLink = "Receipt No." = field("No.");
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
                        PostRcpt.PostReceipt(Rec);
                        CurrPage.Close;
                    end;
                }
                separator(Action1000000022)
                {
                }
                action(PrintReceipt)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Receipt';

                    trigger OnAction()
                    begin

                        /*IF "Account Type"=FALSE THEN
                         ERROR('Receipt No %1 has not been posted',No);*/
                        // BankLedgerEntry.Reset;
                        // BankLedgerEntry.SetRange(BankLedgerEntry."Document No.","No.");
                        // Report.Run(51507701,true,true,BankLedgerEntry);
                        // BankLedgerEntry.Reset;
                        Rec.Reset();
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(50004, true, true, Rec);
                        Rec.Reset();
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

    trigger OnAfterGetCurrRecord()
    begin
        if "Pay Mode" = 'CHEQUE' then begin
            CheqNoEditable := true;
            CheqDateEditable := true;
        end else begin
            CheqNoEditable := false;
            CheqDateEditable := false;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CheqNoEditable := true;
        CheqDateEditable := true;
    end;

    var
        PostRcpt: Codeunit "Receipts-Post1";
        BankLedgerEntry: Record "Bank Account Ledger Entry";
        CheqNoEditable: Boolean;
        CheqDateEditable: Boolean;
}

