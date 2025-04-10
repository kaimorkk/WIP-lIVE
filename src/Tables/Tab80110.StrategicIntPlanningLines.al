Table 80110 "Strategic Int Planning Lines"
{
    DrillDownPageID = "Strategic Int Planning Lines";
    LookupPageID = "Strategic Int Planning Lines";
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
        field(18; "Annual Reporting Codes"; Code[30])
        {
            TableRelation = "CSP Planned Years"."Annual Year Code" where("CSP Code" = field("Strategic Plan ID"));
        }
        field(19; "Target Qty"; Decimal)
        {
        }
        field(20; "Target Budget"; Decimal)
        {
        }
        field(21; "Primary Directorate"; Code[50])
        {
            //TableRelation = "Responsibility Center" where (Test=const(1));
        }
        field(22; Description; Text[255])
        {
        }
        field(23; "Primary Department"; Code[50])
        {
            TableRelation = "Responsibility Center";
        }

        field(24; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(25; "Weight%"; Decimal)
        {
            Caption = 'Weight%';
            DataClassification = CustomerContent;
        }

        field(26; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = CustomerContent;
        }


    }

    keys
    {
        key(Key1; "Strategic Plan ID", "Theme ID", "Objective ID", "Strategy ID", "Code", "Primary Directorate", "Annual Reporting Codes", "Primary Department")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

