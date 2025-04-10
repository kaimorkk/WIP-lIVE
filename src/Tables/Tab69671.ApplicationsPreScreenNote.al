
table 69671 "Applications Pre-Screen Note"
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
        field(3; "Pre-screening Stage"; Option)
        {
            OptionCaption = 'Application Stage,Interview-Invitation';
            OptionMembers = "Application Stage","Interview-Invitation";
        }
        field(4; "Question ID"; Integer)
        {
        }
        field(5; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(6; Description; Text[300])
        {
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

