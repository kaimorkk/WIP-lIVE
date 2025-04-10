
table 59015 "Fuel Card Entries"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; RegNo; Code[20])
        {
        }
        field(3; Make; Text[30])
        {
        }
        field(4; "Reciept No"; Text[30])
        {
        }
        field(5; Amount; Decimal)
        {
        }
        field(6; "Date of Filling"; Date)
        {
        }
        field(7; "Date of posting"; Date)
        {
        }
        field(8; Driver; Code[20])
        {
        }
        field(9; "Driver Names"; Text[30])
        {
        }
        field(10; Posted; Boolean)
        {
        }
        field(11; Line; Integer)
        {
        }
        field(12; closed; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Reciept No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

