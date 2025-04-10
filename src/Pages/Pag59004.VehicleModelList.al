

page 52193995 "Vehicle Model List"
{
    CardPageID = "Vehicle Model Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Vehicle Model";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Make; Rec.Make)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }


            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

