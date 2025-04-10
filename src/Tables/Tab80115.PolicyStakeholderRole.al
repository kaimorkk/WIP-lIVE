
table 80115 "Policy Stakeholder Role"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            TableRelation = Policy.Code;
        }
        field(2; "Code"; Code[50])
        {
            TableRelation = "Policy Stakeholder".Code;
        }
        field(3; "Entry No"; Integer)
        {
        }
        field(4; Responsibility; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Code", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

