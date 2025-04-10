Table 52194090 ProjectStatus
{

    fields
    {
        field(1;ProjectStatusID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;ProjectStatusName;Text[50])
        {
        }
        field(3;Notes;Text[250])
        {
        }
        field(4;CreatedDate;Date)
        {
        }
        field(5;UserID;Integer)
        {
        }
    }

    keys
    {
        key(Key1;ProjectStatusID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

