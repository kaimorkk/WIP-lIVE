

page 80409 "Related Policies"
{
    PageType = List;
    SourceTable = "Related Policy";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Policy Name"; Rec."Policy Name")
                {
                    ApplicationArea = Basic;
                }
                field(Summary; Rec.Summary)
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

