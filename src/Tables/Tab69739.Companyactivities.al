
table 69739 "Company activities"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; Day; Date)
        {
        }
        field(4; Venue; Text[250])
        {
        }
        field(5; Department; Code[10])
        {
        }
        field(6; Cost; Integer)
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

