Table 52193628 "Transaction Lines"
{

    fields
    {
        field(1;No;Code[20])
        {
            TableRelation = Transactions.No;
        }
        field(2;"Line No";Integer)
        {
        }
        field(3;"20 Notes";Integer)
        {
        }
        field(4;"50 Notes";Integer)
        {
        }
        field(5;"100 Notes";Integer)
        {
        }
        field(6;"200 Notes";Integer)
        {
        }
        field(7;"500 Notes";Integer)
        {
        }
        field(8;"1000 Notes";Integer)
        {
        }
        field(9;"50 Cents";Integer)
        {
        }
        field(10;"1 Shillings";Integer)
        {
        }
        field(11;"5 Shillings";Integer)
        {
        }
        field(12;"10 Shillings";Integer)
        {
        }
        field(13;"20 Shillings";Integer)
        {
        }
        field(14;"40 Shillings";Integer)
        {
        }
        field(15;"Denominational Totals";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

