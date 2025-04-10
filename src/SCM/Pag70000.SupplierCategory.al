page 70000 "Supplier Category"
{
    PageType = Card;
    SourceTable = "Supplier Category";


    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. Prequalified"; Rec."No. Prequalified")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
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
