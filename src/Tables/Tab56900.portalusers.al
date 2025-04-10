
table 56900 "portalusers"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "customer No"; Code[20])
        {
        }
        field(2; Password; Text[30])
        {
        }
        field(3; "Last Login"; Date)
        {
        }
        field(4; status; Integer)
        {
        }
        field(5; changedPassword; Integer)
        {
        }
        field(6; validated; Boolean)
        {
        }
        field(7; usertype; Integer)
        {
            Description = '0 for customers, 1 for directors';
        }
        field(8; isAdmin; Boolean)
        {
        }
        field(9; Email; Text[100])
        {
        }
        field(10; ActivatedAsVendor; Boolean)
        {
        }
        field(11; IDNoorRegNo; Code[30])
        {
        }
        field(12; VendorNo; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "customer No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

