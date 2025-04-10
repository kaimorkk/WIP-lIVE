

page 80204 "Policy Related Framework"
{
    PageType = List;
    SourceTable = "Policy Related Framework";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Policy ID"; Rec."Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Framework Code"; Rec."Framework Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Articles"; Rec."No. of Articles")
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

