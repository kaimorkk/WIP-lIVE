Table 52193575 "Reference Buffer."
{

    fields
    {
        field(1;CurrUserID;Code[20])
        {
        }
        field(2;"Reference No";Code[20])
        {
        }
        field(3;"Transaction Type";Option)
        {
            OptionMembers = " ","Salary Processing",Contributions,Banking;
        }
    }

    keys
    {
        key(Key1;CurrUserID,"Transaction Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

