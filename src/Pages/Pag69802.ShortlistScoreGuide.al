

page 69802 "Shortlist Score Guide"
{
    PageType = List;
    SourceTable = "Candidate Shortlist Score Guid";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requirement ID"; Rec."Requirement ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requirement Name"; Rec."Requirement Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Score Code"; Rec."Score Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Points; Rec.Points)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

