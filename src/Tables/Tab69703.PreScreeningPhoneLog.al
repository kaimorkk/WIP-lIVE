
table 69703 "PreScreening Phone Log"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Ability Test Invitation,Phone Interview Report';
            OptionMembers = "Ability Test Invitation","Phone Interview Report";
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
        field(5; "Phone Interview Template ID"; Code[30])
        {
        }
        field(6; "Question ID"; Code[30])
        {
        }
        field(7; "Question Asked"; Text[250])
        {
        }
        field(8; "General Rating"; Option)
        {
            OptionCaption = '1-POOR,2-FAIR,3-GOOD,4-VERY GOOD,5-EXCELLENT';
            OptionMembers = "1-POOR","2-FAIR","3-GOOD","4-VERY GOOD","5-EXCELLENT";
        }
        field(9; "Response Rating %"; Decimal)
        {
        }
        field(10; "Comments/Notes"; Text[400])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Vacancy ID", "Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

