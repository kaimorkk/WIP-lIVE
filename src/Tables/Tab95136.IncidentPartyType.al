
table 95136 "Incident Party Type"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[2048])
        {
        }
        field(3; Blocked; Boolean)
        {
        }
        field(4; "Safety Workgroup ID"; Code[30])
        {
            // TableRelation = "Safety Workgroup"."Workgroup ID";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

