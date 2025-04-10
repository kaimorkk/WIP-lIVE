
table 69674 "Candidate Shortlist Scoring"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Candidate Shortlisting,Interview Invitation';
            OptionMembers = "Candidate Shortlisting","Interview Invitation";
        }
        field(2; "Document No."; Code[30])
        {
        }
        field(3; "Vacancy ID"; Code[30])
        {
        }
        field(4; "Application No."; Code[30])
        {
        }
        field(5; "Requiement ID."; Integer)
        {
        }
        field(6; "Qualification Category"; Option)
        {
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes";
        }
        field(7; "Qualification Code"; Code[30])
        {
        }
        field(8; Description; Text[300])
        {
        }
        field(9; "Requirement Type"; Option)
        {
            OptionCaption = 'Mandatory,Added Advantage';
            OptionMembers = Mandatory,"Added Advantage";
        }
        field(10; "Candidate's Response"; Option)
        {
            OptionCaption = ' ,Does Not Meet Requirement,Meets Requirement,Exceeds Requirement';
            OptionMembers = " ","Does Not Meet Requirement","Meets Requirement","Exceeds Requirement";
        }
        field(11; "Panel Response"; Option)
        {
            OptionCaption = ' ,Does Not Meet Requirement,Meets Requirement,Exceeds Requirement';
            OptionMembers = " ","Does Not Meet Requirement","Meets Requirement","Exceeds Requirement";
        }
    }

    keys
    {
        key(Key1; "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        HRSetup.Get();
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        RecruitmentHeader: Record "Recruitment Requisition Header";
}

