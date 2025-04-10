

page 69154 "Employee Training Feedback"
{
    CardPageID = "Training Feedback";
    Editable = false;
    PageType = List;
    SourceTable = "Training Evaluation Header";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Code field.';
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Title field.';
                }
                field("Start DateTime"; Rec."Start DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start DateTime field.';
                }
                field("End DateTime"; Rec."End DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End DateTime field.';
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Venue field.';
                }
                field(Facilitators; Rec.Facilitators)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Facilitators field.';
                }
                field("Course Justification"; Rec."Course Justification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Justification field.';
                }
                field("Comment on Relevance of Course"; Rec."Comment on Relevance of Course")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment on Relevance of Course field.';
                }
                field("Course Methodology"; Rec."Course Methodology")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Methodology field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Participants field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Created On field.';
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
    }

}

#pragma implicitwith restore

