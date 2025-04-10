

page 69228 "Training App Participants List"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Training Participants1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee No.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Training Responsibility Code"; Rec."Training Responsibility Code")
                {
                    ApplicationArea = Basic;
                }
                field("Training Responsibility"; Rec."Training Responsibility")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Schedule)
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                RunObject = Page "Training Schedule";
                RunPageLink = "Training Application No." = field("Training Code");
            }
            group(Register)
            {
                action("Attendance Register")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attendance Register';
                    Image = ApplyEntries;
                    RunObject = Page "Attendance Register";
                    RunPageLink = "Training Application No." = field("Training Code");

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                    begin
                        DocumentType := Documenttype::"Training Application";

                        /*ApprovalComments.Setfilters(DATABASE::"HR Training Applications",DocumentType,Code);
                        ApprovalComments.SetUpLine(DATABASE::"HR Training Applications",DocumentType,Code);
                        ApprovalComments.RUN;*/

                    end;
                }
            }
        }
    }
}

#pragma implicitwith restore

