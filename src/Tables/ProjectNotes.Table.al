Table 52194097 ProjectNotes
{

    fields
    {
        field(1;ProjectNoteID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;ProjectNote;Text[250])
        {
        }
        field(3;UserID;Integer)
        {
        }
        field(4;CreatedDate;Date)
        {
        }
        field(5;ProjectID;Integer)
        {
        }
    }

    keys
    {
        key(Key1;ProjectNoteID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

