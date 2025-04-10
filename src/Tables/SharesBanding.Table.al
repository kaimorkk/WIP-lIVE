Table 52193477 "Shares Banding"
{

    fields
    {
        field(1;"Up to";Decimal)
        {
            NotBlank = true;
        }
        field(2;"Contractual Shares";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Up to")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

