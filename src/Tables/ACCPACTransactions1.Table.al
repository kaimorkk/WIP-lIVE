Table 52193824 "ACCPAC Transactions1"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
        }
        field(2;"AccPac No";Code[10])
        {
        }
        field(3;"Nav No";Code[10])
        {
        }
        field(4;Jnldate;Text[30])
        {
        }
        field(5;"Posting Date";Date)
        {
        }
        field(6;"Entry Number";Code[10])
        {
        }
        field(7;TransNmbr;Code[10])
        {
        }
        field(8;Description;Text[60])
        {
        }
        field(9;JnlRef;Code[20])
        {
        }
        field(10;"Batch No";Code[10])
        {
        }
        field(11;Amount;Decimal)
        {
        }
        field(12;Department;Code[10])
        {
        }
        field(13;"Cust No";Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
        key(Key2;"Posting Date",JnlRef)
        {
        }
    }

    fieldgroups
    {
    }
}

