
table 80098 "Objective Template"
{

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Global; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Primary Responsibility Center"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(5; "Corporate Strategic Plan ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(6; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
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

