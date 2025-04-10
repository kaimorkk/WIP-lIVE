

page 75043 "RFI Category Requirement"
{
    PageType = List;
    SourceTable = "RFI Category Requirement";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Category ID"; Rec."Category ID")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Code"; Rec."Requirement Code")
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

