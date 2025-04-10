Table 52193825 "Accpac Balances1"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
        }
        field(2;AccPac;Code[10])
        {
        }
        field(3;NavAcc;Code[10])
        {
        }
        field(4;"Posting Date";Date)
        {
        }
        field(5;Description;Text[250])
        {
        }
        field(6;"Acc Name";Text[250])
        {
        }
        field(7;Amount;Decimal)
        {
        }
        field(8;"AR Code";Code[10])
        {
        }
        field(9;Department;Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

