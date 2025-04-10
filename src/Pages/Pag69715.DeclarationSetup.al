

page 69715 "Declaration Setup"
{
    PageType = List;
    SourceTable = "Declaration Statement Setup";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Declaration Statement"; Rec."Declaration Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Declaration Statement field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control7; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control8; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Links)
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

