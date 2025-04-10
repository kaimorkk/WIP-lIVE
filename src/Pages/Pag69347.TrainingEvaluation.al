

page 69347 "Training Evaluation1"
{
    Caption = 'Self Training Impact Assessment';
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
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; Rec."Job Title")
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
                field("Start DateTime"; Rec."Start DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("End DateTime"; Rec."End DateTime")
                {
                    ApplicationArea = Basic;
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control23; "Employee Evaluation Lines")
            {
                SubPageLink = "Training Evaluation No" = field(No);
                ApplicationArea = Basic;
            }
            part(Control11; "Supervisor Evaluation Lines")
            {
                Visible = Rec.Status = Rec.Status::Submitted;
                SubPageLink = "Training Evaluation No" = field(No);
                ApplicationArea = Basic;
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
            action("Submit Evaluation")
            {
                ApplicationArea = Basic;
                Caption = 'Submit Assessment';
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
            action(Print)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(69146, true, false, Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Submit Evaluation_Promoted"; "Submit Evaluation")
                {
                }
            }
            group(Category_Report)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Evaluation;
    end;
}

#pragma implicitwith restore

