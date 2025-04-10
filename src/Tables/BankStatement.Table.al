Table 52194066 "Bank Statement"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
        }
        field(2;Date;Date)
        {
        }
        field(3;"Bank Account No";Code[20])
        {
        }
        field(4;"Cheque No";Code[20])
        {
        }
        field(5;Amount;Decimal)
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

