
table 95182 "Audit Testing Method Detail"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Audit Testing Method ID"; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Audit Testing Method ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

