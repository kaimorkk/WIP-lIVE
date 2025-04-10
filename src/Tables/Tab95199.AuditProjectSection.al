
table 95199 "Audit Project Section"
{
    DrillDownPageID = "Audit Project Sections";
    LookupPageID = "Audit Project Sections";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Engagement ID"; Code[20])
        {
            Editable = false;
        }
        field(2; "Section Type"; Option)
        {
            Editable = false;
            OptionCaption = ' ,Overview,Scope,Scope Exclusion,Comment';
            OptionMembers = " ",Overview,Scope,"Scope Exclusion",Comment;
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(4; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Engagement ID", "Section Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

