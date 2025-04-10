table 58204 "Resource Booking Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
        }
        field(2; "Reservation Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(3; "Equipment Allocation Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(4; "Facilities Email"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

