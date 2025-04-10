Page 50113 "Partial Imprest Issue"
{
    PageType = Card;
    SourceTable = "Partial Imprest Issue";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(ImprestNo;"Imprest No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(ApprovedAmount;"Approved Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AmountAlreadyIssued;"Amount Already Issued")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RemainingAmount;"Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PayMode;"Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field(AmounttoIssue;"Amount to Issue")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Post Partial Issue")
            {
                ApplicationArea = Basic;
                Image = Post;

                trigger OnAction()
                begin
                    Commitments.PostPartialImprest(Rec);
                    //Posted := TRUE;
                    "Posted Date" := CurrentDatetime;
                    CurrPage.Close;
                end;
            }
            action("Create PV")
            {
                ApplicationArea = Basic;
                Image = Payment;

                trigger OnAction()
                begin
                    Commitments.PostPartialImprestWithPV(Rec);
                    //Posted := TRUE;
                    "Posted Date" := CurrentDatetime;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;

                trigger OnAction()
                begin
                    if Posted=false then
                    Error('Payment Voucher No %1 has not been posted',"Imprest No");

                    Reset;
                    SetFilter("Imprest No","Imprest No");
                    Report.Run(51511014,true,true,Rec);
                    Reset;
                end;
            }
            action(CashVoucher)
            {
                ApplicationArea = Basic;
                Caption = 'Cash Voucher';
                Image = "Report";

                trigger OnAction()
                begin
                    if Posted=false then
                    Error('Payment Voucher No %1 has not been posted',"Imprest No");

                    ImprestRec.Reset;
                    ImprestRec.SetFilter("No.","Imprest No");
                    //CashVoucher.GetPartialIssue(Rec);
                    CashVoucher.SetTableview(ImprestRec);
                    CashVoucher.Run;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Post Partial Issue_Promoted"; "Post Partial Issue")
                {
                }
            }
            group(Category_Process)
            {
                actionref("Create PV_Promoted"; "Create PV")
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Report)
            {
                actionref(CashVoucher_Promoted; CashVoucher)
                {
                }
            }
        }
    }

    var
        Commitments: Codeunit Committment;
        ImprestRec: Record "Request Header1";
        CashVoucher: Report "Receipts-PS";
}

