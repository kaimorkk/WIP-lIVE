
table 70000 "Supplier Category"
{
    DrillDownPageID = "Supplier Category";
    LookupPageID = "Supplier Category";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Category Code"; Code[10])
        {
            NotBlank = true;
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Vendor Posting Group"; Code[10])
        {
            TableRelation = "Vendor Posting Group";
        }
        field(4; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";

            trigger OnValidate()
            begin
                /*IF xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" THEN
                  IF GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp,"Gen. Bus. Posting Group") THEN
                    VALIDATE("VAT Bus. Posting Group",GenBusPostingGrp."Def. VAT Bus. Posting Group");*/

            end;
        }
        field(5; "VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(6; "No. Prequalified"; Integer)
        {
            CalcFormula = count("Prequalified Suppliers1" where(Category = field("Category Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Year Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; "Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

