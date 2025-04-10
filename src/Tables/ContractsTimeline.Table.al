Table 52194083 "Contracts Time line"
{

    fields
    {
        field(1;"Contract No.";Code[20])
        {
        }
        field(2;"Time Line Description";Text[250])
        {
        }
        field(3;Date;Date)
        {
        }
        field(4;Notified;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Contract No.","Time Line Description")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

