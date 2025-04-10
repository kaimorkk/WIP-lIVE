
table 80014 "Strategy"
{
    //DrillDownPageID = Strategies;
    //LookupPageID = Strategies;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Strategic Plan ID"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Theme ID"; Code[50])
        {
            TableRelation = "Strategic Theme"."Theme ID";
        }
        field(3; "Objective ID"; Code[50])
        {
            TableRelation = "Strategic Objective"."Objective ID" where("Theme ID" = field("Theme ID"));
        }
        field(4; "Strategy ID"; Code[50])
        {
        }
        field(5; Description; Text[255])
        {
        }
        field(6; "No. of Strategic Activities"; Integer)
        {
        }
        field(7; "Line No."; Integer)
        {

        }
    }

    keys
    {
        key(Key1; "Strategic Plan ID", "Strategy ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

