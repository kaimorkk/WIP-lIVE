
table 80275 "additional AWP Indicators"
{
    DrillDownPageID = "Performance Indicators";
    LookupPageID = "Performance Indicators";
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[50])
        {
        }
        field(2; "Strategy Plan ID"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(3; "Activity ID"; Code[50])
        {
            TableRelation = "Strategic Initiative".Code where("Strategic Plan ID" = field("Strategy Plan ID"));

            trigger OnValidate()
            begin
                /*StrategicInt.RESET;
                StrategicInt.SETRANGE(Code,"Activity ID");
                IF StrategicInt.FIND('-') THEN BEGIN
                  Description:=StrategicInt.Description;
                  END;*/

            end;
        }
        field(4; "Strategy ID"; Code[50])
        {
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
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

