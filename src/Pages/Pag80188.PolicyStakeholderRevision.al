

page 80188 "Policy Stakeholder Revision"
{
    PageType = List;
    SourceTable = "Policy Stakeholder Revision";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Stakeholder Group ID"; Rec."Stakeholder Group ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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

