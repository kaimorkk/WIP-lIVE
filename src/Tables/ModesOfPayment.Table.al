Table 52194096 ModesOfPayment
{

    fields
    {
        field(1;ModeOfPaymentID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;ModeOfPaymentName;Text[80])
        {
        }
    }

    keys
    {
        key(Key1;ModeOfPaymentID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

