Table 52194104 UserStatus
{

    fields
    {
        field(1;UserStatusID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;UserStatusName;Text[30])
        {
        }
        field(3;Notes;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;UserStatusID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

