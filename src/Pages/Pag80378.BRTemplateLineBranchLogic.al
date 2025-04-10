

page 80378 "BR Template Line Branch Logic"
{
    PageType = List;
    SourceTable = "BR Template Line Branch Logic";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Section ID"; Rec."Section ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section ID field.';
                }
                field("Parent Question ID"; Rec."Parent Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Parent Question ID field.';
                }
                field("Parent Response"; Rec."Parent Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Parent Response field.';
                }
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
                field(Question; Rec.Question)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question field.';
                }
                field("Response Value"; Rec."Response Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Value field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

