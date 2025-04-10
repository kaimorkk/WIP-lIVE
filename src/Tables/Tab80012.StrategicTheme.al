
table 80012 "Strategic Theme"
{
    //DrillDownPageID = "Strategic Theme";
    //LookupPageID = "Strategic Theme";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Strategic Plan ID"; Code[100])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Theme ID"; Code[100])
        {
        }
        field(3; Description; Text[255])
        {
        }
        field(4; "Primary Strategic Issue"; Text[255])
        {
        }
        field(5; "No. of Strategic Objectives"; Integer)
        {
            CalcFormula = count("Strategic Objective" where("Theme ID" = field("Theme ID")));
            FieldClass = FlowField;
        }
        field(6; "No. of Strategies"; Integer)
        {
            CalcFormula = count(Strategy where("Theme ID" = field("Theme ID")));
            FieldClass = FlowField;
        }
        field(7; "No. of Strategic Initiatives"; Integer)
        {
            CalcFormula = count("Strategic Initiative" where("Theme ID" = field("Theme ID")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Strategic Plan ID", "Theme ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

