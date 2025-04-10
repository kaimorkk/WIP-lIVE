
table 80081 "Goal Template"
{
    DrillDownPageID = "Goal Templates";
    LookupPageID = "Goal Templates";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[100])
        {
        }
        field(2; Description; Text[255])
        {
        }
        field(3; Global; Boolean)
        {
        }
        field(4; "Primary Responsibility Center"; Code[100])
        {
            TableRelation = "Responsibility Center";
        }
        field(5; "Corporate Strategic Plan ID"; Code[100])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(6; "Year Code"; Code[50])
        {
            TableRelation = "Annual Reporting Codes".Code;
        }
        field(7; "Effective Date"; Date)
        {
        }
        field(8; Blocked; Boolean)
        {
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

