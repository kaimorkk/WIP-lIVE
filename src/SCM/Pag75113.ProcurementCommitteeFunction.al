

page 75113 "Procurement Committee Function"
{
    PageType = List;
    SourceTable = "Procurement Committee Function";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Act Reference"; Rec."Act Reference")
                {
                    ApplicationArea = Basic;
                    Caption = 'PPDA Act reference';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

