
table 69623 "Recruitment Req Responsibility"
{
    DrillDownPageID = "Position Substitutes";
    LookupPageID = "Position Substitutes";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = 'Recruitment Requisition,Job Vacancy';
            OptionMembers = "Recruitment Requisition","Job Vacancy";
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[600])
        {
        }
        field(5; Type; Option)
        {
            OptionCaption = 'Responsibility,Job Dimensions';
            OptionMembers = Responsibility,"Job Dimensions";
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

