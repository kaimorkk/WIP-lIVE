page 50461 "PMMU Activity List"
{
    Caption = 'PMMU Activity List';
    PageType = List;
    SourceTable = "PMMU Activities";
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Activities; Rec.Activities)
                {
                    ApplicationArea = All;
                }
                field(Outcome; Rec.Outcome)
                {
                    ApplicationArea = All;
                }
                field("Strategic Objective"; Rec."Strategic Objective")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
