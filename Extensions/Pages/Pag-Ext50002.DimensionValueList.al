pageextension 50002 "Dimension Value List" extends "Dimension Value List"
{
    layout
    {
        addafter("Consolidation Code")
        {
            field("Global Dimension No."; Rec."Global Dimension No.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
