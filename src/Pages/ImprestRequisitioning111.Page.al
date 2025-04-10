Page 52193714 "Imprest Requisitioning111"
{
    PageType = Card;
    SourceTable = "Payments HeaderFin";

    layout
    {
        area(content)
        {
            group(Imprest)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate;"Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(AccountType;"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo;"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName;"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Payee;Payee)
                {
                    ApplicationArea = Basic;
                }
                field(PaymentType;"Payment Type")
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
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(PayingBankAccount;"Paying Bank Account")
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
                field(ImprestAmount;"Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field(ImprestDeadline;"Imprest Deadline")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part("Imprest Lines";"Imprest Lines111")
            {
                SubPageLink = No=field("No.");
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
                Caption = 'RunObject Cancel AppSend Approval Request';

                trigger OnAction()
                begin

                    // if ApprovalsMgt.FindApproverInspection(Rec) then;
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
            }
            action("Print Imprest")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    Reset;
                    SetFilter("No.","No.");
                    Report.Run(51508003,true,true,Rec);
                    Reset;
                end;
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
        ImprestLine: Record "Imprest Lines";
        UserSetup: Record "User Setup";
        ApprovalEntry: Record "Approval Entry";


    procedure AssistEdit(Imprest: Record "Payments HeaderFin"): Boolean
    begin

        with IMP do begin
        IMP:=Rec;
        GLSetup.Get();
        GLSetup.TestField("Imprest Nos");
        NoSeriesMgt.SelectSeries(GLSetup."Imprest Nos",Imprest."No. Series","No. Series");
        Rec := IMP;
        exit(true);
        end;
    end;
}

