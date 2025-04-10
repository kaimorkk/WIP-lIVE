
table 69080 "FavouriteJobsTable"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Id; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Job Id"; Text[50])
        {
        }
        field(3; "Job Description"; Text[100])
        {
        }
        field(4; Email; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Job Id", "Job Description")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

