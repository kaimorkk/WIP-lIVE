table 50114 "Position Targets"
{
    Caption = 'Position Targets';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Position Code"; Code[20])
        {
            Caption = 'Position Code';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; Target; Decimal)
        {
            Caption = 'Target';
        }
        field(4; "Assigned Weight (%)"; Decimal)
        {
            Caption = 'Assigned Weight';
            MaxValue = 100;
            MinValue = 0;
        }
        field(5; "Strategic Objective"; Text[400])
        {
            DataClassification = ToBeClassified;
        }
        field(6; KPI; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Unit of Measure"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "Position Code", "Line No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Position Code", Target, "Assigned Weight (%)") { }
    }
}
