Table 52193448 "monthly contribution"
{

    fields
    {
        field(1;"staff No";Code[30])
        {
        }
        field(2;Branch;Text[60])
        {
        }
        field(3;"Bank code";Code[10])
        {
        }
        field(4;"A/ c No";Code[60])
        {
        }
    }

    keys
    {
        key(Key1;"staff No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

