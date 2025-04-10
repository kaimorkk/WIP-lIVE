

page 56104 "Case Types"
{
    PageType = List;
    SourceTable = "Case Types";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case Nature"; Rec."Case Nature")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Nature field.';
                }
                field("Case Type"; Rec."Case Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

