
table 56053 "Track Other Persons"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Copyright; Code[20])
        {
        }
        field(2; "Tracks No"; Integer)
        {
        }
        field(3; Name; Text[200])
        {
        }
        field(4; "Id Number"; Code[20])
        {
        }
        field(5; Role; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; Copyright)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

