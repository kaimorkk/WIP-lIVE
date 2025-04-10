

page 69617 "Hr Guiding Principle"
{
    PageType = List;
    SourceTable = "HR Guiding Principle";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("HR Process"; Rec."HR Process")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Process field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

