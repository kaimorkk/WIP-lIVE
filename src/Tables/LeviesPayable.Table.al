Table 52193983 "Levies Payable"
{

    fields
    {
        field(1;"Levy ID";Code[10])
        {
        }
        field(2;"Customer No";Code[10])
        {
        }
        field(3;Year;Date)
        {
        }
        field(4;"Charge Type";Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"Levy ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

