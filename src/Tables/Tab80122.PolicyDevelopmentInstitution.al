
table 80122 "Policy Development Institution"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Name; Text[50])
        {
        }
        field(3; "No. of Policies"; Integer)
        {
        }
        field(4; Address; Code[50])
        {
        }
        field(5; "Address 2"; Code[50])
        {
        }
        field(6; City; Code[50])
        {
        }
        field(7; "Phone No."; Code[50])
        {
        }
        field(8; "Phone No. 2"; Code[50])
        {
        }
        field(9; "Post Code"; Code[50])
        {
        }
        field(10; County; Code[50])
        {
        }
        field(11; "Home Page"; Code[30])
        {
        }
        field(12; "Country/Region Code"; Code[50])
        {
        }
        field(13; "Contact Person"; Code[30])
        {
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

