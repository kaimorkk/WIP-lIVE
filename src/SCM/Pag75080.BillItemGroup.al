

page 75080 "Bill Item Group"
{
    PageType = List;
    SourceTable = "Item Category";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for the item category.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a description of the item category.';
                }
                
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

