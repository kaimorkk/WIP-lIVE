Table 52193472 "Product Cycles"
{
    DrillDownPageID = "Product Cycle";
    LookupPageID = "Product Cycle";

    fields
    {
        field(1;"Product Code";Code[20])
        {
            Editable = false;
            NotBlank = true;
        }
        field(2;Cycle;Integer)
        {
            NotBlank = true;
        }
        field(3;"Max. Installments";Integer)
        {
        }
        field(4;"Max. Amount";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Product Code",Cycle)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

