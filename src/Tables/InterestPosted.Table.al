Table 52193619 "Interest Posted"
{

    fields
    {
        field(1;"Member No";Code[20])
        {
        }
        field(2;"Interest Posted";Boolean)
        {
        }
        field(3;BatchName;Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"Member No",BatchName)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

