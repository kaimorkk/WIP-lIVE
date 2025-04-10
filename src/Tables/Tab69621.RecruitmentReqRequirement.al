
table 69621 "Recruitment Req Requirement"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
            Description = 'Recruitment Header/Vacancy';
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = 'Recruitment Requisition,Job Vacancy';
            OptionMembers = "Recruitment Requisition","Job Vacancy";
        }
        field(3; "Requirement ID"; Integer)
        {
        }
        field(4; "Qualification Category"; Option)
        {
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes";
        }
        field(5; Description; Text[600])
        {
        }
        field(6; "Requirement Type"; Option)
        {
            OptionCaption = 'Mandatory,Added Advantage,Affirmative Action';
            OptionMembers = Mandatory,"Added Advantage","Affirmative Action";
        }
        field(7; "Substitute Qualification Exist"; Boolean)
        {
        }
        field(8; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(9; "Qualification Code"; Code[30])
        {
            TableRelation = Qualification;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

