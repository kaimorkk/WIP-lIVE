
table 95002 "Communication Plan Objective"
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
        field(3; "Objective ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Objective ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

