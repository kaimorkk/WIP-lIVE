
table 69662 "Recruitment Req Documents"
{
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
        field(4; "HR Document Type"; Code[30])
        {
            TableRelation = "HR Document Type";
        }
        field(5; Description; Text[150])
        {
        }
        field(6; "Requirement Type"; Option)
        {
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
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

