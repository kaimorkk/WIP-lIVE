
table 69606 "Duty Station"
{
    DrillDownPageID = "Duty Station";
    LookupPageID = "Duty Station";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[150])
        {
        }
        field(3; "Region ID"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(4; "Approved Establishment"; Integer)
        {
            CalcFormula = sum("Establishment Planning Line"."Optimal Staffing" where("Duty Station ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(5; "No. of Active Employees"; Integer)
        {
            CalcFormula = count(Employee where("Current Duty Station" = field(Code)));
            FieldClass = FlowField;
        }
        field(6; Blocked; Boolean)
        {
        }
        field(7; Longitude; Decimal)
        {
            DecimalPlaces = 2 : 16;
        }
        field(8; Latitude; Decimal)
        {
            DecimalPlaces = 2 : 16;
        }
        field(9; "Hardship Area"; Boolean)
        {
        }

        field(10; "Address"; Code[150])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

