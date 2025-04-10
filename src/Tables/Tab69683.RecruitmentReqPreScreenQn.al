
table 69683 "Recruitment Req Pre-Screen Qn"
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
        field(5; Description; Text[800])
        {
        }
        field(6; "Question Type"; Option)
        {
            OptionCaption = 'Open-ended,Closed-ended,Number';
            OptionMembers = "Open-ended","Closed-ended",Number;
        }
        field(7; "Closed-ended Question Sub-Type"; Code[50])
        {
        }
        field(8; LineNo; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Document No.", LineNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

