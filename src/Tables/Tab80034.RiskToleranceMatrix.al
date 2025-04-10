
table 80034 "Risk Tolerance Matrix"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Impact Level Code"; Code[30])
        {
        }
        field(2; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Risk Impact Code"; Code[30])
        {
            TableRelation = "Risk Consequence Codes";
        }
        field(4; KPI; Text[225])
        {
        }
        field(5; "Unit of Measure"; Code[100])
        {
        }
        field(6; Description; Text[255])
        {
        }
        field(7; "Tolerated Min Limit"; Decimal)
        {
        }
        field(8; "Tolerated Max Limit"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Impact Level Code", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

