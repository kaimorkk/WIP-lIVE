Table 80244 "Key Performance Indicator"
{
    DrillDownPageID = "Performance Indicators";
    LookupPageID = "Performance Indicators";

    fields
    {
        field(1; KPI; Code[100])
        {
            DataClassification = ToBeClassified;
            Description = 'KPI';
        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'Perfomance Indicator';
        }
        field(3; "Unit of Measure"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(4; Department; Code[30])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Responsibility Center" where (Test=const(2));
        }
        field(5; Target; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Achievement; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Directorate; Code[10])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Responsibility Center" where (Test=const(1));
        }
        field(8; "Minimum Target"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Maximum Target"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; KPI)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

