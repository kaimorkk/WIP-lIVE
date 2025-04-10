
table 69666 "Job Application Requirements"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Application No."; Code[30])
        {
            TableRelation = "Job Applications";
        }
        field(2; "Vacancy No."; Code[30])
        {
            TableRelation = "Recruitment Requisition Header";
        }
        field(3; "Requirement ID"; Integer)
        {
        }
        field(4; "Qualification Category"; Option)
        {
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes";
        }
        field(5; "Qualification Code"; Code[30])
        {
        }
        field(6; Description; Text[250])
        {
        }
        field(7; "Requirement Type"; Option)
        {
            OptionCaption = 'Mandatory,Added Advantage';
            OptionMembers = Mandatory,"Added Advantage";
        }
        field(8; "Candidates Response"; Option)
        {
            OptionCaption = 'Does Not Meet Criterion,Meets Criterion';
            OptionMembers = "Does Not Meet Criterion","Meets Criterion";
        }
        field(9; "No. of AutoMatched"; Integer)
        {
            Caption = 'No. of AutoMatched Qualification';
        }
        field(10; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Application No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

