

page 69225 "Training Evaluation Page"
{
    DeleteAllowed = false;
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
                }
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                }
                field("Course Methodology"; Rec."Course Methodology")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Start DateTime"; Rec."Start DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("End DateTime"; Rec."End DateTime")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                }
                field("Course Justification"; Rec."Course Justification")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Facilitators; Rec.Facilitators)
                {
                    ApplicationArea = Basic;
                }
                field("Comment on Relevance of Course"; Rec."Comment on Relevance of Course")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000008; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000009; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = "Report";

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(69104, true, false, Rec);
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Image = SendTo;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to submit this evaluation?') = false then
                        exit else
                        Rec.Status := Rec.Status::Submitted;
                    Rec.Modify(true);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Submit_Promoted; Submit)
                {
                }
            }
            group(Category_Process)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        if Rec.Status = Rec.Status::Submitted then
            Error('You cannot modify a submitted evaluation')
    end;

    var
        EvaluationAreas: Record "HR Models";
        EvaluationLines: Record "Training Evaluation Lines";
}

#pragma implicitwith restore

