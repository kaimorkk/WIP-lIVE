
table 80116 "Policy Statement Area"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            TableRelation = Policy.Code;
        }
        field(2; "Code"; Code[30])
        {
        }
        field(3; Description; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

