Table 52193456 MessagePlaceHolder
{

    fields
    {
        field(1;PlaceHolderId;Integer)
        {
            AutoIncrement = true;
        }
        field(2;PlaceHolderName;Text[50])
        {
        }
        field(3;IsInBox;Boolean)
        {
        }
        field(4;IsSent;Boolean)
        {
        }
        field(5;IsDraft;Boolean)
        {
        }
        field(6;IsSpam;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;PlaceHolderId)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

