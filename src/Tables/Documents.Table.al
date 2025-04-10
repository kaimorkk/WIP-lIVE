Table 52194087 Documents
{

    fields
    {
        field(1;DocumentID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;DocumentFilename;Text[100])
        {
        }
        field(3;DocumentDescription;Text[100])
        {
        }
        field(4;ProjectID;Integer)
        {
        }
        field(5;DateCreated;Date)
        {
        }
    }

    keys
    {
        key(Key1;DocumentID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

