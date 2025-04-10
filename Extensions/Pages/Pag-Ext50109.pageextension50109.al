

pageextension 50109 "pageextension50109" extends "Responsibility Center List"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Responsibility Center List"(Page 5715)".


    //Unsupported feature: Property Insertion (SourceTableView) on ""Responsibility Center List"(Page 5715)".

    layout
    {
        addafter("Location Code")
        {
            field("Operating Unit Type"; Rec."Operating Unit Type")
            {
                ApplicationArea = Basic;
            }
            field("Direct Reports To"; Rec."Direct Reports To")
            {
                ApplicationArea = Basic;
            }
            field("Indirect Reports To"; Rec."Indirect Reports To")
            {
                ApplicationArea = Basic;
            }
            field("Hierarchical  Level ID"; Rec."Hierarchical  Level ID")
            {
                ApplicationArea = Basic;
            }
            field("Headed By (Title)"; Rec."Headed By (Title)")
            {
                ApplicationArea = Basic;
            }
            field("Current Head"; Rec."Current Head")
            {
                ApplicationArea = Basic;
            }
        }
    }

    //Unsupported feature: Property Deletion (Editable).

}

#pragma implicitwith restore

