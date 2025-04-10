
table 70078 "Vendor Staff Employment"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Staff ID"; Code[10])
        {
        }
        field(3; "Vendor No"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(4; "Previous Employer"; Text[30])
        {
        }
        field(5; "Title Held"; Text[30])
        {
        }
        field(6; "Start Year"; Date)
        {
        }
        field(7; "End Year"; Date)
        {
        }
        field(8; Country; Code[20])
        {
            TableRelation = "Country/Region";
        }
        field(9; Location; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No", "Staff ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

