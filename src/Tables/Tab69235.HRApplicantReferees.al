
table 69235 "HR Applicant Referees"
{

    fields
    {
        field(1; "Job Application No"; Code[20])
        {
            TableRelation = "HR Job Applications"."Application No";
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
            DataClassification = ToBeClassified;
        }
        field(10; City; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Period Known"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Job ID"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Code"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Job Application No", Names)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

