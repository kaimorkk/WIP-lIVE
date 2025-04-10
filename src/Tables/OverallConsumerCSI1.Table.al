Table 52193755 "Overall Consumer CSI1"
{

    fields
    {
        field(1;"Survey Id";Code[20])
        {
        }
        field(2;Section;Text[250])
        {
        }
        field(3;"Satisfaction Index";Decimal)
        {
        }
        field(4;"Line No";Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1;"Survey Id","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

