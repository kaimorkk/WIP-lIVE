
table 69710 "Candidate Shortlist Criteria"
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
        field(3; "Requiement ID."; Integer)
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
        field(6; Description; Text[300])
        {
        }
        field(7; "Requirement Type"; Option)
        {
            OptionCaption = 'Mandatory,Added Advantage';
            OptionMembers = Mandatory,"Added Advantage";
        }
        field(8; "Assigned Weight"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Requiement ID.", "Qualification Category", "Qualification Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

