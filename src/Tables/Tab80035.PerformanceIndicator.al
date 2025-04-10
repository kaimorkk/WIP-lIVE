
table 80035 "Performance Indicator"
{
    DrillDownPageID = "Performance Indicators";
    LookupPageID = "Performance Indicators";
    DataClassification = CustomerContent;

    fields
    {
        field(1; KPI; Code[150])
        {
            Description = 'KPI';
        }
        field(2; Description; Text[250])
        {
            Description = 'Perfomance Indicator';
        }
        field(3; "Unit of Measure"; Code[100])
        {
            TableRelation = "Unit of Measure".Code;
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

