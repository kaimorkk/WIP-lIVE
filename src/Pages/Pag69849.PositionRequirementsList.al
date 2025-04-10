page 69849 "Position Requirements List"
{
    PageType = List;
    SourceTable = "Position Requirement";
    SourceTableView = where("Qualification Category" = filter(Professional));
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Qualification Category field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Substitute Qualification"; Rec."Substitute Qualification")
                {
                    ApplicationArea = Basic;
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Position ID field.';
                }
            }
        }
    }



}
