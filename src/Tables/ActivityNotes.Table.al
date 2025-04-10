Table 52194089 ActivityNotes
{

    fields
    {
        field(1;ActivityNoteID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;ActivityNote;Text[250])
        {
        }
        field(3;UserID;Integer)
        {
        }
        field(4;CreatedDate;Date)
        {
        }
        field(5;ActivityID;Integer)
        {
        }
    }

    keys
    {
        key(Key1;ActivityNoteID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

