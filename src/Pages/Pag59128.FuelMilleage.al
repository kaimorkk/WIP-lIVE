

page 59128 "Fuel Milleage"
{
    PageType = ListPart;
    SourceTable = "Fuel Milleage Req";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Month; Rec.Month)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Month field.';
                }
                field("Fuel Drawn"; Rec."Fuel Drawn")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Drawn field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

