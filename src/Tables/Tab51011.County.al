
table 51011 "County"
{
    DataClassification = CustomerContent;
    DrillDownPageId = Counties;
    LookupPageId = Counties;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[250])
        {
        }

    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Description)
        {
        }
    }
}

