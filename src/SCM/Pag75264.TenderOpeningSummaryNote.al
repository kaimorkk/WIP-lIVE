

page 75264 "Tender Opening Summary Note"
{
    PageType = List;
    SourceTable = "Tender Opening Summary Note";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Register ID"; Rec."Register ID")
                {
                    ApplicationArea = Basic;
                }
                field("Agenda Code"; Rec."Agenda Code")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Item Discussed"; Rec."Item Discussed")
                {
                    ApplicationArea = Basic;
                }
                field("Summary Notes"; Rec."Summary Notes")
                {
                    ApplicationArea = Basic;
                }
                field("Referenced Section of Tender"; Rec."Referenced Section of Tender")
                {
                    ApplicationArea = Basic;
                }
                field("Referenced Clause of Tender"; Rec."Referenced Clause of Tender")
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

