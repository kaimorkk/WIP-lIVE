
table 95105 "Risk Category Trigger"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Risk Category ID"; Code[20])
        {
            TableRelation = "Risk Category".Code where(Blocked = filter(false));
        }
        field(2; "Trigger ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Description; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Risk Category ID", "Trigger ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

