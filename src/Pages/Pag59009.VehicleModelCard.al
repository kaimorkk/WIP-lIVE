

page 59009 "Vehicle Model Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Vehicle Model";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Make field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

