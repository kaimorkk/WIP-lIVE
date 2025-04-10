

page 69351 "Evaluation Rating Scale"
{
    PageType = List;
    SourceTable = "Category Rating Scale";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Code field.';
                }
                field("Category Description"; Rec."Category Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Description field.';
                }
                field("Rating Code"; Rec."Rating Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Code field.';
                }
                field("Rating Description"; Rec."Rating Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

