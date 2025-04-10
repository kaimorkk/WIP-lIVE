
table 95187 "Audit Template Default Control"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[20])
        {
        }
        field(2; "Risk ID"; Integer)
        {
        }
        field(3; "Control ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "Procedure Description"; Text[30])
        {
            TableRelation = "Audit Template Procedure";
        }
    }

    keys
    {
        key(Key1; "Template ID", "Risk ID", "Control ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

