

page 59050 "Licence Types"
{
    PageType = List;
    SourceTable = "Licence Types";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Licence Type Code"; Rec."Licence Type Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Type Code field.';
                }
                field("Licence Type Description"; Rec."Licence Type Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Type Description field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

