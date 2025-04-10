Table 52193959 Account1
{

    fields
    {
        field(1;"Bank code";Code[20])
        {
        }
        field(2;"Bank Branch";Code[20])
        {
        }
        field(3;"Bank Account";Code[50])
        {
        }
    }

    keys
    {
        key(Key1;"Bank code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

