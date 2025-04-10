
table 80001 "Core Mandates"
{
    DrillDownPageID = "Core Mandates";
    LookupPageID = "Core Mandates";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; "Core Mandates"; Text[2000])
        {
        }
        field(3; No; Code[10])
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
        fieldgroup(DropDown; "Code", "Core Mandates")
        {
        }
        fieldgroup(Brick; "Code", "Core Mandates")
        {
        }
    }
}

