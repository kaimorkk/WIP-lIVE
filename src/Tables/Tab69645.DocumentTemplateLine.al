
table 69645 "Document Template Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[30])
        {
            TableRelation = "HR Document Template";
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "HR Process"; Option)
        {
            OptionCaption = 'Profile Registration,Job Application,Contract Issuance,Promotion/Transfers,Disciplinary,Staff Exit';
            OptionMembers = "Profile Registration","Job Application","Contract Issuance","Promotion/Transfers",Disciplinary,"Staff Exit";
        }
        field(4; "HR Document Type"; Code[30])
        {
            TableRelation = "HR Document Type1";
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
        key(Key1; "Template ID", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

