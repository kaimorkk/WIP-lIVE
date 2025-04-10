
table 69655 "Employee_Applicant Language"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Employee,Job Applicant';
            OptionMembers = Employee,"Job Applicant";
        }
        field(2; "No."; Code[30])
        {
            TableRelation = "Job Applications";
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
        key(Key1; "Document Type", "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

