
table 69672 "Application Filled Documents"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Application No."; Code[30])
        {
        }
        field(3; "Vacancy No."; Code[30])
        {
        }
        field(4; "HR Document Type"; Code[30])
        {
            TableRelation = "HR Document Type";
        }
        field(5; Description; Text[600])
        {
        }
        field(6; "Requirement Type"; Option)
        {
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
        field(7; "File Name"; Text[30])
        {
        }
        field(8; "File Type"; Text[30])
        {
        }
        field(9; "File Extension"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Line No.", "Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

