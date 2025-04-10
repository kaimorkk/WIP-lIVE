

page 75025 "Procurement Doc Template Line"
{
    Caption = 'Procurement Document Template Line';
    PageType = List;
    SourceTable = "Procurement Doc Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Process"; Rec."Procurement Process")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Document Type"; Rec."Procurement Document Type")
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
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

