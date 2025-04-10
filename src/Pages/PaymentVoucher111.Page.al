Page 52193701 "Payment Voucher111"
{
    PageType = Card;
    SourceTable = "Payments HeaderFin";

    layout
    {
        area(content)
        {
            group("Payment Voucher1")
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
                }
                field(ChequeNo; "Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate; "Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Payee)
                {
                    ApplicationArea = Basic;
                }
                field(Onbehalfof; "On behalf of")
                {
                    ApplicationArea = Basic;
                }
                field(PayingBankAccount; "Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(Currency; Currency)
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
                field(PostedBy; "Posted By")
                {
                    ApplicationArea = Basic;
                }
                field(PostedDate; "Posted Date")
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
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount; "Total Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part("PV Lines"; "PV Lines11")
            {
                SubPageLink = "PV No" = field("No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    // //if ApprovalMgt.SendInspectionApproval(Rec) then;
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
            }
            separator(Action1000000024)
            {
            }
            action(Post)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    if "Original Document" = "original document"::Imprest then
                        PVPost."Post Imprest"(Rec)
                    else
                        PVPost."Post Payment Voucher"(Rec);
                end;
            }
            separator(Action1000000026)
            {
            }
            group(Print)
            {
                action("Payment Voucher")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin

                        Reset;
                        SetFilter("No.", "No.");
                        Report.Run(51508000, true, true, Rec);
                        Reset;
                    end;
                }
                action("Imprest Warrant")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin

                        if "Original Document" = "original document"::Imprest then begin
                            Reset;
                            SetFilter("No.", "No.");
                            Report.Run(51508003, true, true, Rec);
                            Reset;
                        end else
                            Error('The Original Document was not an imprest');
                    end;
                }
            }
        }
    }

    var
        PV: Record "Payments HeaderFin";
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        PVPost: Codeunit "Payment Management";


    procedure AssistEdit(PaymentVoucher: Record "Payments HeaderFin"): Boolean
    begin

        with PV do begin
            PV := Rec;
            GLSetup.Get();
            GLSetup.TestField(GLSetup."PV Nos");
            NoSeriesMgt.SelectSeries(GLSetup."PV Nos", PaymentVoucher."No. Series", "No. Series");
            Rec := PV;
            exit(true);
        end;
    end;
}

