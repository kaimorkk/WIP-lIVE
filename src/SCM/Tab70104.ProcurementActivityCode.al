
table 70104 "Procurement Activity Code"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Activity Code"; Code[50])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(3; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Activity Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

