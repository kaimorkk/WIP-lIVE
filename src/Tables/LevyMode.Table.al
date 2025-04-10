Table 52194069 LevyMode
{

    fields
    {
        field(1;LevyModeID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;LevyModeName;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;LevyModeID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

