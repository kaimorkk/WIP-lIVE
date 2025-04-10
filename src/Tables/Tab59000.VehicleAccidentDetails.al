
table 59000 "Vehicle Accident Details"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; RegNo; Code[10])
        {
        }
        field(2; Driver; Code[10])
        {
            TableRelation = "Vehicle Drivers".Driver;

            trigger OnValidate()
            begin
                FleetDriver.Reset;
                FleetDriver.SetRange(FleetDriver.Driver, Driver);
                if FleetDriver.Find('-') then
                    "Driver Names" := FleetDriver."Driver Name";
            end;
        }
        field(3; "Accident date"; Date)
        {
        }
        field(4; "Accident Details"; Text[200])
        {
        }
        field(5; "Driver Names"; Text[30])
        {
        }
        field(6; No; Code[10])
        {
        }
        field(7; "Police Obstract No"; Code[30])
        {
        }
        field(8; Remarks; Text[200])
        {
        }
        field(9; "Claim Payment Date"; Date)
        {
        }
        field(10; "Entry Number"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; RegNo, "Entry Number", "Police Obstract No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        FleetDriver: Record "Vehicle Drivers";
}

