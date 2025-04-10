Table 52194023 "Tender Fees"
{

    fields
    {
        field(1;"Tender No";Code[20])
        {
            TableRelation = "Procurement Request1" where ("Process Type"=const(Tender));
        }
        field(2;"Line No";Integer)
        {
        }
        field(3;Description;Text[100])
        {
        }
        field(4;"Tender fee";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Tender No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

