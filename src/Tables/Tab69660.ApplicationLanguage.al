
table 69660 "Application Language"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Application No."; Code[30])
        {
            TableRelation = "Job Applications";
        }
        field(2; "Candidate No."; Code[30])
        {
        }
        field(3; "Language Code"; Code[30])
        {
        }
        field(4; Description; Text[150])
        {
        }
        field(5; "Proficiency Level"; Text[30])
        {
        }
        field(6; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Application No.", "Candidate No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

