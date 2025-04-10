
table 69738 "Screening Templae Line Comment"
{

    fields
    {
        field(1; "Template Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Application Submission,Phone Pre-Screening Interview,Interview Scoresheet';
            OptionMembers = "Application Submission","Phone Pre-Screening Interview","Interview Scoresheet";
        }
        field(2; "Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Question Category"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Question ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6; "Additional Comments"; Text[600])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Template Type", "Template ID", "Question Category", "Question ID", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

