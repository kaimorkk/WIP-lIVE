

page 69434 "OSH Rule Template Lines"
{
    PageType = ListPart;
    SourceTable = "OSH Rule Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Code field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

