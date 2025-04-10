table 50036 "Vehicle Entitlement"
{
    Caption = 'Vehicle Entitlement';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Station No"; Code[20])
        {
            Caption = 'Station No';
        }
        field(2; "Vehicle Type"; Code[50])
        {
            Caption = 'Vehicle Type';
        }
        field(3; "No of Vehicles"; Integer)
        {
            Caption = 'No of Vehicles';
        }
    }
    keys
    {
        key(PK; "Station No", "Vehicle Type")
        {
            Clustered = true;
        }
    }
}
