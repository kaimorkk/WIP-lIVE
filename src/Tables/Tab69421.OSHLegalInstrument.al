
table 69421 "OSH Legal Instrument"
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
        field(3; "Instrument Type"; Option)
        {
            OptionMembers = " ",Law,Regulation,Agreement,Standard,Framework,Policy;
        }
        field(4; "Effective Date"; Date)
        {
        }
        field(5; Blocked; Boolean)
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

