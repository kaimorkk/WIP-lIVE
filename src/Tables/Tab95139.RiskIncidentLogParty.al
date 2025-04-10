
table 95139 "Risk Incident Log Party"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Incident ID"; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Incident Party Type"; Code[20])
        {
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "Telephone No."; Code[20])
        {
        }
        field(6; Email; Text[50])
        {
        }
        field(7; "Additional Details"; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Incident ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

