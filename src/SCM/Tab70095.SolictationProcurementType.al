
table 70095 "Solictation Procurement Type"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Solicitation Type"; Code[30])
        {
            TableRelation = "Solicitation Type".Code;
        }
        field(2; "Procument Type"; Code[30])
        {
            TableRelation = "Procurement Types".Code;
        }
        field(3; "Strict Purchase Limits"; Boolean)
        {
        }
        field(4; "Min Purchase Value (LCY)"; Decimal)
        {
        }
        field(5; "Max Purchase Value (LCY)"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Solicitation Type", "Procument Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

