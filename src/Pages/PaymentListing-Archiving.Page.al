Page 52194222 "Payment Listing-Archiving"
{
    ApplicationArea = Basic;
    Editable = true;
    // DeleteAllowed = false;
    // InsertAllowed = false;
    PageType = List;
    SourceTable = Payments;
    // SourceTableView = where("Payment Type"=const(Normal));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Select; Select)
                {
                    ApplicationArea = Basic;
                }
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field(DatePosted;"Date Posted")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PayMode; "Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ChequeNo; "Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ChequeDate; "Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TotalAmount; "Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ChequeType; "Cheque Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field(KBABankCode;"KBA Bank Code")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                field(Payee; Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PayingBankAccount; "Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field(NetAmount;"Net Amount")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                // field(Collected;Collected)
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(PaymentVouchers)
            {
                Caption = 'Payment Vouchers';
                action(Archive)
                {
                    ApplicationArea = Basic;
                    Caption = 'Archive';

                    trigger OnAction()
                    begin
                        Pvs.Reset;
                        // Pvs.SetRange(Pvs.Archived, false);
                        Pvs.SetRange(Pvs.Select, true);
                        if Pvs.Find('-') then
                            repeat
                                // Pvs.Archived := true;
                                Pvs.Modify;
                            until Pvs.Next = 0;
                    end;
                }
            }
        }
    }

    var
        Pvs: Record Payments;
}

