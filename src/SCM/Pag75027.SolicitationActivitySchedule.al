

page 75027 "Solicitation Activity Schedule"
{
    Caption = 'Procurement Activity Schedule';
    PageType = List;
    SourceTable = "Solicitation Activity Schedule";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Default Planned Duration"; Rec."Default Planned Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type ID"; Rec."Solicitation Type ID")
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

