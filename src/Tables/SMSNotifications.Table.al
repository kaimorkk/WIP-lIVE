Table 52193443 "SMS Notifications"
{

    fields
    {
        field(1;"Line No";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Client No.";Code[20])
        {
        }
        field(3;"Message Type";Code[20])
        {
            TableRelation = "SMS Types";
        }
        field(4;"Date Sent";Date)
        {
        }
        field(5;"Time Sent";Time)
        {
        }
        field(6;"Sent By";Code[20])
        {
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

