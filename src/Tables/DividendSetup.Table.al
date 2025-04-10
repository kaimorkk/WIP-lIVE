Table 52193449 "Dividend Setup"
{

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;Description;Text[50])
        {
        }
        field(3;Rate;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

