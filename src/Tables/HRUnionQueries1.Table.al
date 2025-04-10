Table 52193897 "HR Union Queries1"
{

    fields
    {
        field(1;"Employee No.";Code[20])
        {
        }
        field(2;"Query Date";Date)
        {
        }
        field(3;"Query";Text[150])
        {
        }
    }

    keys
    {
        key(Key1;"Employee No.","Query Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

