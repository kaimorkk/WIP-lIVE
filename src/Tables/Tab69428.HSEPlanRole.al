
table 69428 "HSE Plan Role"
{

    fields
    {
        field(1; "Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(2; "Role ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Role".Code where(Blocked = const(false));
        }
        field(3; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Executive Summary"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Plan ID", "Role ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

