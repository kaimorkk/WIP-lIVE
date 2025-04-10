Table 52194028 "Bid Bond"
{

    fields
    {
        field(1;"Tender No";Code[20])
        {
            TableRelation = "Procurement Request1" where ("Process Type"=const(Tender));
        }
        field(2;Description;Text[100])
        {
        }
        field(3;"Bid Bond";Decimal)
        {
        }
        field(4;"Expiry Date";Date)
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

