Table 52193455 MessagesMobileApp
{

    fields
    {
        field(1;MessageId;Integer)
        {
            AutoIncrement = true;
        }
        field(2;Subject;Text[50])
        {
        }
        field(3;Body;Text[150])
        {
        }
        field(4;Date;Date)
        {
        }
        field(5;AuthorId;Code[30])
        {
        }
        field(6;ReceiverId;Code[30])
        {
        }
    }

    keys
    {
        key(Key1;MessageId)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

