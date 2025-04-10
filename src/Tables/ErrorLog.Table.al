Table 52193658 "Error Log"
{

    fields
    {
        field(1;"Transaction No";Code[20])
        {
        }
        field(2;"Line No";Integer)
        {
        }
        field(3;"Account No.";Code[20])
        {
        }
        field(4;Date;Date)
        {
        }
        field(5;"Not Imported";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Transaction No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

