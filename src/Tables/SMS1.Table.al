Table 52193960 SMS1
{

    fields
    {
        field(1;ID;Code[20])
        {
            NotBlank = true;
        }
        field(2;"Phone No";Text[30])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(3;Message;Text[250])
        {
        }
        field(4;Flag;Boolean)
        {
        }
        field(5;"Department Code";Code[10])
        {
        }
        field(6;"Department Name";Text[50])
        {
        }
        field(7;"User ID";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;ID,"Phone No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

