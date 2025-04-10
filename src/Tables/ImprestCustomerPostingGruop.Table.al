Table 52194037 "Imprest Customer Posting Gruop"
{

    fields
    {
        field(1;"Primary Key";Integer)
        {
        }
        field(2;"Imprest Posting Group";Code[20])
        {
            TableRelation = "Customer Posting Group";
        }
        field(3;"General Bus. Posting Group";Code[20])
        {
            TableRelation = "Gen. Business Posting Group";
        }
        field(4;"VAT Bus. Posting Group";Code[20])
        {
            TableRelation = "VAT Business Posting Group";
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

