
table 95174 "Compliance Framework"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[2048])
        {
        }
        field(3; "Framework Category"; Code[20])
        {
            TableRelation = "Compliance Framework Category".Code where(Blocked = filter(false));
        }
        field(4; "Issued By"; Text[250])
        {
        }
        field(5; Website; Text[100])
        {
        }
        field(6; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

