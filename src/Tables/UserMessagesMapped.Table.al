Table 52193457 UserMessagesMapped
{

    fields
    {
        field(1;UserMessagesMappedId;Integer)
        {
            AutoIncrement = true;
        }
        field(2;MessageId;Integer)
        {
        }
        field(3;ReceiverPlaceHolderId;Integer)
        {
        }
        field(4;SenderPlaceHolderId;Integer)
        {
        }
        field(5;IsRead;Boolean)
        {
        }
        field(6;IsStarred;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;UserMessagesMappedId)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

