
table 80274 "additional Performance Ind"
{
    DrillDownPageID = "Performance Indicators";
    LookupPageID = "Performance Indicators";
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
            TableRelation = "Strategic Objective"."Objective ID" where("Theme ID" = field("Theme ID"),
                                                                        "Strategic Plan ID" = field("Strategic Plan ID"));
        }
        field(4; "Strategy ID"; Code[50])
        {
            TableRelation = Strategy."Strategy ID" where("Objective ID" = field("Objective ID"),
                                                          "Theme ID" = field("Theme ID"),
                                                          "Objective ID" = field("Objective ID"),
                                                          "Strategic Plan ID" = field("Strategic Plan ID"));
        }
        field(5; "Code"; Code[50])
        {
        }
        field(6; KPI; Code[150])
        {
            Description = 'KPI';
        }
        field(7; Description; Text[250])
        {
            Description = 'Perfomance Indicator';
        }
        field(8; "Unit of Measure"; Code[100])
        {
            TableRelation = "Unit of Measure".Code;
        }
    }

    keys
    {
        key(Key1; "Strategic Plan ID", "Theme ID", "Objective ID", "Strategy ID", "Code", KPI)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

