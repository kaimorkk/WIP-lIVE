
table 95246 "Audit Committee Function"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Committee Type"; Code[20])
        {
            TableRelation = "Audit Committee Types"."Committee Type";
        }
        field(2; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Act Reference"; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "Committee Type", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

