

page 69407 "Evacuation Event Procedures"
{
    CardPageID = "Evacuation Event Procedure";
    PageType = List;
    SourceTable = "Evacuation Event Procedure";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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

