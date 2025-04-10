

page 80396 "BR Multiple Response"
{
    PageType = List;
    SourceTable = "BR Multiple Response";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Response Value"; Rec."Response Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Value field.';
                }
                field("Select Choice"; Rec."Select Choice")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Select Choice field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

