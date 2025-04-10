Table 52193601 "Email Status BOSA"
{

    fields
    {
        field(1;"Member No";Code[20])
        {
        }
        field(2;Period;Date)
        {
        }
        field(3;Date;Date)
        {
        }
        field(4;Status;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Member No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

