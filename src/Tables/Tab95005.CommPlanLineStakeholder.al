
table 95005 "Comm Plan Line Stakeholder"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional,Project';
            OptionMembers = " ",Corporate,Functional,Project;
        }
        field(2; "Document No"; Code[20])
        {
        }
        field(3; Category; Option)
        {
            OptionCaption = ' ,Meeting,Status Report';
            OptionMembers = " ",Meeting,"Status Report";
        }
        field(4; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Stakeholder ID"; Code[50])
        {
        }
        field(6; Description; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", Category, "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

