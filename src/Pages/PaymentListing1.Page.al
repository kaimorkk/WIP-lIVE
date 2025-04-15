Page 52194223 "Payment Listing1"
{
    ApplicationArea = Basic;
    CardPageID = "Payment Voucher Card";
    Editable = false;
    PageType = List;
    SourceTable = Payments;
    // SourceTableView = where(Posted=const(false),
    //                         Source=filter(<>Imprest),"Created From Mprest"=const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }

                field(Type; Type)
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
                field(TotalAmount; "Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeType; "Cheque Type")
                {
                    ApplicationArea = Basic;
                }
                // field(KBABankCode; "KBA Bank Code")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Payee; Payee)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(PayingBankAccount; "Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                // field(NetAmount; "Net Amount")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                // field(Collected; Collected)
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action(PostBatch)
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Batch';

                    trigger OnAction()
                    var
                        PV: Record Payments;
                    begin

                        if Confirm(Text000, false) then begin
                            CurrPage.SetSelectionFilter(PV);
                            if PV.Find('-') then
                                repeat
                                    PVPost.PostBatch(PV);
                                until
                                 PV.Next = 0;
                        end;
                    end;
                }
            }
        }
    }

    var
        PVPost: Codeunit "Payment- Post";
        Text000: label 'Are you sure you want to post the selected PV''s';
}

