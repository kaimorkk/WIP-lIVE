Table 52193567 "Members Buffer"
{

    fields
    {
        field(1;"Member No";Code[20])
        {
        }
        field(2;Names;Text[30])
        {
        }
        field(3;"Staff Number";Code[30])
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

