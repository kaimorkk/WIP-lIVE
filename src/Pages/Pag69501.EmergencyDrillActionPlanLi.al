

page 69501 "Emergency Drill Action Plan Li"
{
    PageType = ListPart;
    SourceTable = "Emergency Drill Action Plan";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Criteria Code"; Rec."Criteria Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria Code field.';
                }
                field("Action"; Rec.Action)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action field.';
                }
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Type field.';
                }
                field(Responsibility; Rec.Responsibility)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility field.';
                }
                field("Owner ID"; Rec."Owner ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Owner ID field.';
                }
                field("Planned Date"; Rec."Planned Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

