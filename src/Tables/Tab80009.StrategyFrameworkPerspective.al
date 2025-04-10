
table 80009 "Strategy Framework Perspective"
{
    DrillDownPageID = "Strategy Framework Perspective";
    LookupPageID = "Strategy Framework Perspective";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; "Strategy Framework"; Code[100])
        {
            TableRelation = "Strategy Framework";
        }
        field(3; Perspective; Code[100])
        {
        }
        field(4; Description; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Strategy Framework")
        {
        }
    }

    fieldgroups
    {
    }
}

