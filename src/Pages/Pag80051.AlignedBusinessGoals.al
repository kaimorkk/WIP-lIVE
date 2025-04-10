

page 80051 "Aligned Business Goals"
{
    PageType = List;
    SourceTable = "PC Goal Hub";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Goal ID"; Rec."Goal ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Goal ID field.';
                }
                field("Goal Description"; Rec."Goal Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Goal Description field.';
                }
                field("Aligned-To Strategic Plan ID"; Rec."Aligned-To Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Aligned-To Strategic Plan ID field.';
                }
                field("Aligned-To PC ID"; Rec."Aligned-To PC ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Aligned-To PC ID field.';
                }
                field("Aligned-To PC Goal ID"; Rec."Aligned-To PC Goal ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Aligned-To PC Goal ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

