
table 59001 "Vehicle Fuel Card Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            begin
                /*FHead.RESET;
                FHead.SETRANGE(FHead.No,"No.");
                IF FHead.FIND('-') THEN
                  BEGIN
                     VALIDATE("No.",FHead.No);
                  END;*/

            end;
        }
        field(2; "Reciept No"; Code[20])
        {
        }
        field(3; Amount; Decimal)
        {
        }
        field(4; "Date of Fueling"; Date)
        {
        }
        field(5; Driver; Text[30])
        {
            TableRelation = "Vehicle Drivers";

            trigger OnValidate()
            begin
                FleetDriver.Reset;
                FleetDriver.SetRange(FleetDriver.Driver, Driver);
                if FleetDriver.Find('-') then
                    "Driver Names" := FleetDriver."Driver Name";
            end;
        }
        field(6; "Driver Names"; Text[30])
        {
        }
        field(7; "Vehicle RegNo"; Code[20])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            begin
                VMake.Reset;
                VMake.SetRange(VMake."Registration No.", "Vehicle RegNo");
                if VMake.Find('-') then
                    "vehicle Make" := VMake.Make;
            end;
        }
        field(8; "vehicle Make"; Text[30])
        {
        }
        field(9; closed; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Reciept No", "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        FHead: Record "Fuel Card";
        FleetDriver: Record "Vehicle Drivers";
        VMake: Record "Fleet Vehicles.";
}

