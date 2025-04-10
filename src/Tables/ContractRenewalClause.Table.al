Table 52194041 "Contract Renewal Clause"
{

    fields
    {
        field(1;"Renewal Code";Code[10])
        {
        }
        field(2;Description;Text[150])
        {
        }
        field(3;Duration;DateFormula)
        {
        }
    }

    keys
    {
        key(Key1;"Renewal Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

