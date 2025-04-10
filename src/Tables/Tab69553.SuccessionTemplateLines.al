
table 69553 "Succession Template Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[30])
        {
        }
        field(2; "Position ID"; Code[30])
        {
            TableRelation = "Company Positions"."Position ID";
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Initiative Category"; Code[50])
        {
            TableRelation = "Succession Template Category".Code where(Blocked = const(false));
        }
        field(5; Initiative; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Document No", "Position ID", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

