
table 69629 "Recruitment Req Substitute"
{
    DrillDownPageID = "Position Substitutes";
    LookupPageID = "Position Substitutes";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
        }
        field(2; "Requirement ID"; Integer)
        {
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
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
            OptionCaption = 'Mandatory,Added Advantage';
            OptionMembers = Mandatory,"Added Advantage";
        }
        field(7; "Substitute Qualification"; Boolean)
        {
        }
        field(8; "Qualification Code"; Code[30])
        {
            TableRelation = Qualification where("Qualification Category" = field("Qualification Category"));
        }
    }

    keys
    {
        key(Key1; "Document No.", "Requirement ID", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

