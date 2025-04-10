
table 70049 "Disposal Bidders"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Disposal No."; Code[20])
        {
        }
        field(2; Name; Text[30])
        {
        }
        field(3; "Email Address"; Text[30])
        {
        }
        field(4; Amount; Decimal)
        {
        }
        field(5; "Phone No."; Text[30])
        {
        }
        field(6; "Contact Person"; Text[30])
        {
        }
        field(7; "Physical Addess"; Text[30])
        {
        }
        field(8; Award; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Disposal No.", Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

