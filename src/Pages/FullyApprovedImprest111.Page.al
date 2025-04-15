Page 52193718 "Fully Approved Imprest111"
{
    PageType = Card;
    SourceTable = "Payments HeaderFin";
    SourceTableView = where("Payment Type" = const(Imprest),
                            Posted = const(false),
                            Status = filter(Released));

    layout
    {
        area(content)
        {
            group(Imprest)
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
                field(AccountType; "Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo; "Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName; "Account Name")
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
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(PayingBankAccount; "Paying Bank Account")
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
                field(ImprestAmount; "Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Payee)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part("Imprest Lines"; "Imprest Lines111")
            {
                SubPageLink = No = field("No.");
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

                    /*ImprestLine.SETRANGE(ImprestLine.No,"No.");
                    IF ImprestLine.FINDFIRST THEN BEGIN
                       REPEAT
                       IF ImprestLine.Committed=FALSE THEN
                       ERROR('Commit Entries before sending for approval');
                       UNTIL ImprestLine.NEXT=0;
                    END;*/

                    // if ApprovalsMgt.SendVisitApprovalRequest(Rec) then;

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    // if ApprovalsMgt.FinishApprovalEntryVisit(Rec,true,true)then;
                end;
            }
            separator(Action1000000023)
            {
            }
            action("Commit Entries")
            {
                ApplicationArea = Basic;
            }
            action("Reverse Commitment Entries")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    /*IF Status<>Status::Released THEN
                    ERROR('The document is not fully approved')
                    ELSE
                    Committment.ReverseImprestCommittment(Rec);
                    */

                end;
            }
            separator(Action1000000026)
            {
            }
            action(Post)
            {
                ApplicationArea = Basic;
            }
            separator(Action1000000028)
            {
            }
            action("Print Imprest")
            {
                ApplicationArea = Basic;
            }
        }
    }

    var
        IMP: Record "Payments HeaderFin";
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PaymentPost: Codeunit "Payment Management";
        ApprovalsMgt: Codeunit "Export F/O Consolidation";
        Committment: Codeunit Committments;
        ImprestLine: Record "Payments HeaderFin";


    procedure AssistEdit(Imprest: Record "Payments HeaderFin"): Boolean
    begin

        with IMP do begin
            IMP := Rec;
            GLSetup.Get();
            // GLSetup.TestField("Imprest Nos");
            // NoSeriesMgt.SelectSeries(GLSetup."Imprest Nos",Imprest."No. Series","No. Series");
            Rec := IMP;
            exit(true);
        end;
    end;
}

