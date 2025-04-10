
table 69661 "Requirements Checklist"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Application No."; Code[30])
        {
        }
        field(2; "Vacancy No."; Code[30])
        {
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
        field(8; "Rating Type"; Option)
        {
            OptionCaption = 'Yes/No,Number,Options Text,Date';
            OptionMembers = "Yes/No",Number,"Options Text",Date;
        }
        field(9; "Candidates Response"; Text[30])
        {

            trigger OnValidate()
            begin
                if "Rating Type" = "rating type"::"Yes/No" then
                    if ("Candidates Response" <> 'Yes') or ("Candidates Response" <> 'No') then
                        Error('The response must be either Yes or No');
            end;
        }
    }

    keys
    {
        key(Key1; "Application No.", "Vacancy No.", "Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

