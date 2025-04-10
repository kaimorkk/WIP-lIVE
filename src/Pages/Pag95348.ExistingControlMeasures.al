

page 95348 "Existing Control Measures"
{
    PageType = List;
    SourceTable = "Existing Control Measures";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Risk ID field.';
                }
                field("Risk Title"; Rec."Risk Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Title field.';
                }
                field("Existing Control Name"; Rec."Existing Control Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Existing Control Name field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

