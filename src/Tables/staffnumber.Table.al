Table 52193589 "staff number"
{

    fields
    {
        field(1;number;Code[10])
        {
        }
        field(2;"staff number";Code[10])
        {
        }
        field(3;name;Text[60])
        {
        }
        field(4;"member num";Code[20])
        {
        }
        field(5;deposit;Decimal)
        {
        }
        field(6;"loan amount";Decimal)
        {
        }
        field(7;intamount;Decimal)
        {
        }
        field(8;"loan number";Text[30])
        {
        }
        field(9;Holiday;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;number)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

