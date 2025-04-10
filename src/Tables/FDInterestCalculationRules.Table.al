Table 52193494 "FD Interest Calculation Rules"
{

    fields
    {
        field(1;"Code";Code[30])
        {
        }
        field(2;"Minimum Amount";Decimal)
        {
            NotBlank = true;
        }
        field(3;"Maximum Amount";Decimal)
        {
            NotBlank = true;
        }
        field(4;"Interest Rate";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Code","Minimum Amount")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

