
table 80187 "Policy Guiding Principle"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            TableRelation = Policy;
        }
        field(2; "Code"; Code[100])
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

