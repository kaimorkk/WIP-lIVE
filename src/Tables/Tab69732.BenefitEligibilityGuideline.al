
table 69732 "Benefit Eligibility Guideline"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Benefit ID"; Code[30])
        {
        }
        field(2; "Entry Type"; Option)
        {
            OptionCaption = 'Eligibility Criteria,General Guideline';
            OptionMembers = "Eligibility Criteria","General Guideline";
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[600])
        {
        }
    }

    keys
    {
        key(Key1; "Benefit ID", "Entry Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

