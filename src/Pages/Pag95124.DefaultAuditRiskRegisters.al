

page 95124 "Default Audit Risk Registers"
{
    CardPageID = "Default Audit Risk Register";
    PageType = List;
    SourceTable = "Default Audit Risk Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Audit Risk ID"; Rec."Audit Risk ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Risk ID field.';
                }
                field("Risk Title"; Rec."Risk Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Title field.';
                }
                field("Audit Risk Type"; Rec."Audit Risk Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Risk Type field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

