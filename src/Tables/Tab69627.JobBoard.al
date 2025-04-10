
table 69627 "Job Board"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Name; Text[100])
        {
        }
        field(3; "Channel Category"; Option)
        {
            OptionCaption = 'Online,Print Media,TV,Radio,Internal Advert,Other';
            OptionMembers = Online,"Print Media",TV,Radio,"Internal Advert",Other;
        }
        field(4; "Home Page"; Text[600])
        {
        }
        field(5; "Vendor No."; Code[30])
        {
            TableRelation = Vendor;
        }
        field(6; "No. of Vacancy Announcements"; Integer)
        {
        }
        field(7; Blocked; Boolean)
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

