

page 69808 "Template Score Guide"
{
    PageType = List;
    SourceTable = "Screening Template Score Guide";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Option Code"; Rec."Option Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Default Points"; Rec."Default Points")
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

