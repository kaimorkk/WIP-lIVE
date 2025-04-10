

page 80199 "Performance Log Lines"
{
    PageType = ListPart;
    SourceTable = "Plog Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Activity Type"; Rec."Activity Type")
                {
                    ApplicationArea = Basic;
                }
                field("Initiative No."; Rec."Initiative No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity No.';
                }
                field("Sub Intiative No"; Rec."Sub Intiative No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sub Activity No.';
                    Editable = false;
                }
                field("Planned Date"; Rec."Planned Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Planned Start Date';
                    Editable = false;
                }
                field("Achieved Date"; Rec."Achieved Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Planned Due Date';
                    Editable = false;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Achieved Target"; Rec."Achieved Target")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Achievements';
                }
                field(Variances; Rec.Variances)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason for Variances';
                }
                field("Remaining Targets"; Rec."Remaining Targets")
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
            action("Sub Plog Lines")
            {
                ApplicationArea = Basic;
                RunObject = Page "Sub Plog Lines";
                RunPageLink = "PLog No." = field("PLog No."),
                              "Initiative No." = field("Initiative No."),
                              "Personal Scorecard ID" = field("Personal Scorecard ID");
            }
            action(DocAttach)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
        }
    }
}

#pragma implicitwith restore

