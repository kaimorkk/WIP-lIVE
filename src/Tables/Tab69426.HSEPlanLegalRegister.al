
table 69426 "HSE Plan Legal Register"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Plan ID"; Code[20])
        {
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(2; "Legal Instrument ID"; Code[20])
        {
        }
        field(3; Description; Text[2048])
        {
        }
        field(4; "Instrument Type"; Option)
        {
            OptionMembers = " ",Law,Regulation,Agreement,Standard,Framework,Policy;
        }
    }

    keys
    {
        key(Key1; "Plan ID", "Legal Instrument ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

