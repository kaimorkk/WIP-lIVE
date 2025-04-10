
table 80015 "Strategic Initiative"
{
    DrillDownPageID = "Strategic Initiatives";
    LookupPageID = "Strategic Initiatives";
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
            TableRelation = Strategy."Strategy ID" where(
                                    "Strategic Plan ID" = field("Strategic Plan ID"),
                                    "Objective ID" = field("Objective ID"),
                                    "Theme ID" = field("Theme ID"));
        }
        field(5; "Code"; Code[50])
        {
        }
        field(6; Description; Text[255])
        {
        }
        field(7; "Framework Perspective"; Code[255])
        {
            TableRelation = "Strategy Framework Perspective".Code where("Strategy Framework" = field("Strategy Framework"));
        }
        field(8; "Total Posted Planned Target"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where("Strategic Plan ID" = field("Strategic Plan ID"),
                                                                            "Entry Type" = const(Planned),
                                                                            "Activity ID" = field(Code)));
            Caption = 'Total Posted Planned Target';
            FieldClass = FlowField;
        }
        field(9; "PC Planned Target"; Decimal)
        {
        }
        field(10; "Total Achieved Target"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where("Strategic Plan ID" = field("Strategic Plan ID"),
                                                                            "Entry Type" = const(Actual),
                                                                            "Activity ID" = field(Code),
                                                                            "Planning Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(11; "Total Posted Planned Budget"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry"."Cost Amount" where("Strategic Plan ID" = field("Strategic Plan ID"),
                                                                                 "Entry Type" = const(Planned),
                                                                                 "Activity ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(12; "Total Usage Budget"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry"."Cost Amount" where("Strategic Plan ID" = field("Strategic Plan ID"),
                                                                                 "Entry Type" = const(Actual),
                                                                                 "Activity ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(13; "Strategy Framework"; Code[10])
        {
            TableRelation = "Strategy Framework";
        }
        field(14; "Primary Directorate"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(15; "Primary Department"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(16; "Collective target"; Decimal)
        {
        }
        field(17; "Collective Budget"; Decimal)
        {
        }
        field(18; "Annual Reporting Codes"; Code[30])
        {
            TableRelation = "Annual Reporting Codes".Code;
        }
        field(19; "CSP Planned Target"; Decimal)
        {
            CalcFormula = sum("Strategic Int Planning Lines"."Target Qty" where("Strategic Plan ID" = field("Strategic Plan ID"),
                                                                                 "Theme ID" = field("Theme ID"),
                                                                                 "Objective ID" = field("Objective ID"),
                                                                                 "Strategy ID" = field("Strategy ID"),
                                                                                 Code = field(Code),
                                                                                 "Primary Directorate" = field("Primary Directorate")));
            FieldClass = FlowField;
        }
        field(20; "Unit of Measure"; Text[50])
        {
            Caption = 'Unit of Measure';
            TableRelation = "Unit of Measure".Code /*where("For Appraisal?" = const(True))*/;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(21; "Perfomance Indicator"; Text[250])
        {
            TableRelation = "Performance Indicator";
        }
        field(22; "Source Of Fund"; Code[50])
        {
            Caption = 'Source Of Fund';
            TableRelation = "Funding Source".Code where(Blocked = const(false));
        }
        field(23; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(24; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(25; "Remaining Target"; Decimal)
        {
        }
        field(26; "Csp Planned Weight%"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(27; "Csp Achieved Weight%"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(28; "Court Stations"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Court Stations"));
        }
        field(29; "Offices"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Office));
        }
        field(30; Perspective; Text[150])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Strategic Plan ID", "Theme ID", "Objective ID", "Strategy ID", "Code", "Strategy Framework")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

