Table 52193444 "Email Notifications"
{

    fields
    {
        field(1;"Line No";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Email Address";Text[50])
        {
        }
        field(3;"Email Sent";Boolean)
        {
        }
        field(4;"Sent by";Code[50])
        {
        }
        field(5;"DateTime Sent";DateTime)
        {
        }
        field(6;"Client No.";Code[20])
        {
            TableRelation = Vendor;
        }
        field(7;"Message ID";Code[30])
        {
            TableRelation = Notifications;
        }
    }

    keys
    {
        key(Key1;"Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

