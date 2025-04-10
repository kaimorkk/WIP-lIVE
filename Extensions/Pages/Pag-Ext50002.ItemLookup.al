pageextension 50004 "Item Lookup" extends "Item Lookup"
{
    layout
    {
        addafter("Item Disc. Group")
        {
            field("Procurement Category"; Rec."Procurement Category")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
