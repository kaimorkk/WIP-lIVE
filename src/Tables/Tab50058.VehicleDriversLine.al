table 50058 "Vehicle Drivers Line"
{
    Caption = 'Vehicle Divers Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Driver Code"; Code[10])
        {
            Caption = 'Driver Code';
        }
        field(2; "Driver Name"; Text[100])
        {
            Caption = 'Driver Name';
        }
        field(3; "Line No."; Integer)
        {

        }
        field(4; "Licence Type"; Code[30])
        {
            TableRelation = "Licence Types"."Licence Type Code";
        }


    }
    keys
    {
        key(PK; "Driver Code", "Driver Name",
            "Line No.")
        {
            Clustered = true;
        }
    }
}
