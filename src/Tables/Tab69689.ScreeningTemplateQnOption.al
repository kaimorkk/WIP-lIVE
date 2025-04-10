
table 69689 "Screening Template Qn Option"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template Type"; Option)
        {
            OptionCaption = 'Application Submission,Phone Pre-Screening Interview,Interview Scoresheet';
            OptionMembers = "Application Submission","Phone Pre-Screening Interview","Interview Scoresheet";
        }
        field(2; "Template ID"; Code[30])
        {
        }
        field(3; "Question Category"; Code[30])
        {
        }
        field(4; "Question Id"; Integer)
        {
        }
        field(5; "Closed-ended Question Sub-Type"; Code[30])
        {
            Enabled = false;
        }
        field(6; "Option Code"; Code[30])
        {
        }
        field(7; "Raw Score"; Decimal)
        {
        }
        field(8; Description; Text[250])
        {
        }
        field(9; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Template Type", "Template ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

