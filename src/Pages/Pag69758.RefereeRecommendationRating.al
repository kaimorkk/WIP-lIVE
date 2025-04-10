

page 69758 "Referee Recommendation Rating"
{
    PageType = List;
    SourceTable = "Referee Recomm Rating";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Skills and Competency ID"; Rec."Skills and Competency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Rating of Candidate"; Rec."Rating of Candidate")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments"; Rec."Additional Comments")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Links)
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

