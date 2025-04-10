

page 80218 "Policy Related Framework Rev"
{
    PageType = List;
    SourceTable = "Policy Related Framework Rev";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Revision No."; Rec."Revision No.")
                {
                    ApplicationArea = Basic;
                }
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

