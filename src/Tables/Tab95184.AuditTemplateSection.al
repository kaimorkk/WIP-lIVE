
table 95184 "Audit Template Section"
{
    DrillDownPageID = "Audit Template Sections";
    LookupPageID = "Audit Template Sections";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[20])
        {
        }
        field(2; "Section Type"; Option)
        {
            OptionCaption = ' ,Overview,Scope,Scope Exclusion,Comment';
            OptionMembers = " ",Overview,Scope,"Scope Exclusion",Comment;
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Template ID", "Section Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

