
table 69109 "Applicant Referees"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Job Application No"; Code[20])
        {
            TableRelation = "Job Application Table";
        }
        field(2; Names; Text[200])
        {
        }
        field(3; Occupation; Text[100])
        {
        }
        field(4; Institution; Text[100])
        {
        }
        field(5; Address; Text[200])
        {
        }
        field(6; "Telephone No"; Text[100])
        {
        }
        field(7; "E-Mail"; Text[100])
        {
        }
        field(8; "Employee No"; Code[30])
        {
        }
        field(9; "Post Code"; Code[30])
        {
        }
        field(10; City; Text[50])
        {
        }
        field(11; "Period Known"; Text[30])
        {
        }
        field(12; "Job ID"; Text[30])
        {
        }
        field(13; "Code"; Integer)
        {
            AutoIncrement = true;
        }
        field(14; RefereeEmail; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Job Application No", Names, "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

