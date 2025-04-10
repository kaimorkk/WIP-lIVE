table 56907 "Job Applicant Hobbies"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Id No"; Code[20])
        {
            TableRelation = "Hr Jobs Applicants"."ID Number";
        }
        field(2; Hobby; Text[200])
        {
        }
        field(3; "Code"; Integer)
        {
            AutoIncrement = true;
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

