
table 69652 "Applicant Qualification Histor"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Candidate No."; Code[30])
        {
        }
        field(2; "Qualification Line No."; Integer)
        {
        }
        field(3; "Qualification Code"; Code[30])
        {
        }
        field(4; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Experience Category"; Option)
        {
            OptionCaption = 'Awards/Recognition,Clubs & Societies,Courses/Subjects,Research Project,Leadership,Specific Tasks,Projects';
            OptionMembers = "Awards/Recognition","Clubs & Societies","Courses/Subjects","Research Project",Leadership,"Specific Tasks",Projects;
        }
        field(6; Description; Text[250])
        {
        }
        field(7; "From Date"; Date)
        {
        }
        field(8; "To Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Candidate No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

