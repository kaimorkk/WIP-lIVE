
table 69651 "Hobby Type"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Hobby Categgory"; Option)
        {
            OptionCaption = 'Travel/Sports/Adventure,Games,Arts & Creatives,Food & Cooking,Collecting,Others';
            OptionMembers = "Travel/Sports/Adventure",Games,"Arts & Creatives","Food & Cooking",Collecting,Others;
        }
        field(3; Description; Text[200])
        {
        }
        field(4; "No. of Employees"; Integer)
        {
        }
        field(5; "No. of Job Applicants"; Integer)
        {
        }
        field(6; Blocked; Boolean)
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

