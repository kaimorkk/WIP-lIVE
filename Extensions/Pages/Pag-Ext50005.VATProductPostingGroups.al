pageextension 50005 "VAT Product Posting Groups" extends "VAT Product Posting Groups"
{
    layout
    {
        addafter(Description)
        {
            field("Witholding Tax"; Rec."Witholding Tax")
            {
                ApplicationArea = Basic;
            }
            field(Rate; Rec.Rate)
            {
                ApplicationArea = Basic;
            }
        }
    }
}
