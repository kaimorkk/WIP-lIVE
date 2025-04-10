
table 80123 "Policy Objective Strategy"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[20])
        {
            TableRelation = Policy.Code;
        }
        field(2; "Code"; Code[20])
        {
            TableRelation = "Policy Objective".Code where("Policy ID" = field("Policy ID"));
        }
        field(3; "Line No"; Integer)
        {
        }
        field(4; Description; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Code", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

