Table 52193756 "SI Comparison1"
{

    fields
    {
        field(1;"Survey ID";Code[20])
        {
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
        }
        field(3;Consumers;Text[100])
        {
        }
        field(4;"General SI";Decimal)
        {
        }
        field(5;"Core Function SI";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Survey ID","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

