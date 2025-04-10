page 75170 "RFI Responsibility Center"
{
    PageType = List;
    SourceTable = "RFI Responsibility Center";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center ID"; Rec."Responsibility Center ID")
                {
                    ApplicationArea = Basic;
                }
                field("Operating Unit Type"; Rec."Operating Unit Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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

