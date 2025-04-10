
table 69677 "Declaration Statement Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Declaration Statement"; Text[500])
        {
        }
        field(3; Blocked; Boolean)
        {
        }
        field(4; Response; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

