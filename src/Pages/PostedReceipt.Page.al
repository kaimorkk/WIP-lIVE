Page 52194383 "Posted Receipt"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Receipts Header1";
    SourceTableView = where(Posted=const(true));

    layout
    {
        area(content)
        {
            group(Receipt)
            {
                Caption = 'Receipt';
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
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(BankCode;"Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode;"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(ExtDocumentNo;"Ext. Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount;"Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field(Cashier;Cashier)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000034;"Receipts Line")
            {
                SubPageLink = "Receipt No."=field("No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Functions)
            {
                action(PrintReceipt)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Receipt';
                    Image = Receipt;

                    trigger OnAction()
                    begin
                        
                        /*IF "Account Type"=FALSE THEN
                         ERROR('Receipt No %1 has not been posted',No);*/
                        // BankLedgerEntry.Reset;
                        // BankLedgerEntry.SetRange(BankLedgerEntry."Document No.","No.");
                        // Report.Run(51511006,true,true,BankLedgerEntry);
                        // BankLedgerEntry.Reset;
                        
                        //51511275
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
            group(Category_Report)
            {
                actionref(PrintReceipt_Promoted; PrintReceipt)
                {
                }
            }
        }
    }

    var
        PostRcpt: Codeunit "Receipts-Post1";
        BankLedgerEntry: Record "Bank Account Ledger Entry";
        Test: Codeunit "Fleet Maintenance Alert";
}

