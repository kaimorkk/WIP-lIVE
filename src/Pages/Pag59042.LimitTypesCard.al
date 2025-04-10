

page 59042 "Limit Types Card"
{
    PageType = Card;
    SourceTable = "Limit Types";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Lower Limit"; Rec."Lower Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lower Limit field.';
                }
                field("Upper Limit"; Rec."Upper Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Upper Limit field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

