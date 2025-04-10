
table 72011 "Constituency"
{
    LookupPageId = Constituencies;
    DrillDownPageId = Constituencies;

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "County Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = County.Code;
        }
        field(4; "Region Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Blocked; Boolean)
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

