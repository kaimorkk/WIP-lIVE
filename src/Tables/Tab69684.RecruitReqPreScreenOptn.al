
table 69684 "Recruit Req Pre Screen Optn"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[50])
        {
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = 'Recruitment Requisition,Job Vacancy';
            OptionMembers = "Recruitment Requisition","Job Vacancy";
        }
        field(3; "Pre-Screening Stage"; Option)
        {
            OptionCaption = 'Application Stage,Interview-Invitation';
            OptionMembers = "Application Stage","Interview-Invitation";
        }
        field(4; "Question ID"; Integer)
        {
        }
        field(5; "Option Code"; Code[10])
        {
        }
        field(6; Description; Text[100])
        {
        }
        field(7; "Line No."; Integer)
        {
            AutoIncrement = true;
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

