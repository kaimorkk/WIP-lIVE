
table 80117 "Policy Version"
{

    fields
    {
        field(1; "Policy Id"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;
        }
        field(2; "Version Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Revision Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Policy Revision Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Policy Id", "Version Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

