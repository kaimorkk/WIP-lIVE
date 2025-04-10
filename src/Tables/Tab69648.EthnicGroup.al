
table 69648 "Ethnic Group"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "No. of Active Employees"; Integer)
        {
        }
        field(4; "No. of Job Applicants"; Integer)
        {
        }
        field(5; "Country/Region Code"; Code[30])
        {
            TableRelation = "Country/Region";
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

