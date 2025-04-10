

page 95125 "Default Audit Risk Register"
{
    PageType = Card;
    SourceTable = "Default Audit Risk Register";

    layout
    {
        area(content)
        {
            group(General)
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

