Table 52194067 Fees
{
    DrillDownPageID = "Fees Setup";
    LookupPageID = "Fees Setup";

    fields
    {
        field(1;"Levy Code";Code[20])
        {
        }
        field(2;Description;Text[150])
        {
        }
        field(3;Percentage;Decimal)
        {
            DecimalPlaces = 4:4;
        }
        field(4;Limited;Boolean)
        {
        }
        field(5;"Minimum Amount";Decimal)
        {
        }
        field(6;"Maximum Amount";Decimal)
        {
        }
        field(7;"Transaction Type";Option)
        {
            OptionCaption = 'Market Development Fees,Transaction Fees';
            OptionMembers = "Market Development Fees","Transaction Fees";
        }
    }

    keys
    {
        key(Key1;"Levy Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

