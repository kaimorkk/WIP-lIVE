

page 69420 "Safety Workgroup"
{
    PageType = Card;
    SourceTable = "Safety Workgroup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Workgroup ID"; Rec."Workgroup ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Stakeholder Category"; Rec."Stakeholder Category")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
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

