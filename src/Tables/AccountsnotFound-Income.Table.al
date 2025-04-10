Table 52193569 "Accounts not Found-Income"
{

    fields
    {
        field(1;"Account No";Code[20])
        {
        }
        field(2;Amount;Decimal)
        {
        }
        field(3;"Tr-No.";Code[10])
        {
        }
        field(4;"Growers No.";Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"Account No","Tr-No.",Amount)
        {
            Clustered = true;
        }
        key(Key2;"Tr-No.")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }
}

