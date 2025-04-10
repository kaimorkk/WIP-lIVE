
table 80000 "Core Values"
{
    DataClassification = CustomerContent;
    LookupPageId = "Core Values";

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[2000])
        {
        }
        field(3; No; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Code", No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

