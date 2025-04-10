
table 80013 "Strategic Objective"
{
    //DrillDownPageID = "Strategic Objectives";
    //LookupPageID = "Strategic Objectives";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Strategic Plan ID"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Theme ID"; Code[50])
        {
            TableRelation = "Strategic Theme"."Theme ID" where("Strategic Plan ID" = field("Strategic Plan ID"));
        }
        field(3; "Objective ID"; Code[50])
        {
        }
        field(4; Description; Text[255])
        {
        }
        field(5; "No. of Strategies"; Integer)
        {
        }
        field(6; "No. of Strategic Initiatives"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Strategic Plan ID", "Objective ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

