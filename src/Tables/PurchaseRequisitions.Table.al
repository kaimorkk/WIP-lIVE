Table 52194079 "Purchase Requisitions"
{

    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;"Line No.";Integer)
        {
        }
        field(3;"Requisition No.";Code[20])
        {
        }
        field(4;"Procurment Plan";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

