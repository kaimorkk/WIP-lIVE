

page 69155 "Training Feedback"
{
    PageType = Card;
    SourceTable = "Training Evaluation Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;

                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.';
                    Editable = isEditable;

                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                }
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;

                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;

                }
                field("Start DateTime"; Rec."Start DateTime")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;

                }
                field("End DateTime"; Rec."End DateTime")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;

                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;

                }

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;

                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            // part(Control23; "Training Feedback Suggestions")
            // {
            //     SubPageLink = "Training Application No" = field(No);
            //     ApplicationArea = Basic;
            //     Editable = isEditable;

            // }

            part("Training Feedback Suggestions"; "Training Feedback Suggestions")
            {
                SubPageLink = "Training Application No" = field(No);
                ApplicationArea = Basic;
                Editable = isEditable;

            }
            group("Other Comments")
            {
                field("Comment on Relevance of Course"; Rec."Comment on Relevance of Course")
                {
                    ApplicationArea = Basic;
                    Caption = 'Other Comments';
                    MultiLine = true;
                    Editable = isEditable;

                }
            }

        }
        area(factboxes)
        {
            systempart(Control19; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Submit Feedback")
            {
                ApplicationArea = Basic;
                Image = SendTo;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to submit your feedback?') = true
                    then begin
                        Rec.Status := Rec.Status::Submitted;
                        Message('Feedback submitted succesfully');


                    end
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Submit Feedback_Promoted"; "Submit Feedback")
                {
                }
            }
        }
    }

    trigger OnOpenPage()

    begin
        isEditable := Rec.Status = rec.status::open;

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Feedback;
    end;

    var
        isEditable: Boolean;
}

#pragma implicitwith restore

