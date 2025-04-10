

page 69829 "Professional Bodies"
{
    PageType = List;
    SourceTable = "Position Requirement";
    SourceTableView = where("Qualification Category" = filter("Professional Body"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Qualification Category" := Rec."qualification category"::"Professional Body";
    end;
}

#pragma implicitwith restore

