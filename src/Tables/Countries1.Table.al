Table 52193831 Countries1
{

    fields
    {
        field(1;CountryID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;CountryCode;Code[30])
        {
        }
        field(3;CountryName;Text[100])
        {
        }
    }

    keys
    {
        key(Key1;CountryID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

