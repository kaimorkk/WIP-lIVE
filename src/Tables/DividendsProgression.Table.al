Table 52193478 "Dividends Progression"
{
    // DrillDownPageID = "Submitted Vehicle Incidents";
    // LookupPageID = "Submitted Vehicle Incidents";

    fields
    {
        field(1;"Member No";Code[20])
        {
        }
        field(2;Date;Date)
        {
        }
        field(3;"Gross Dividends";Decimal)
        {
        }
        field(4;"Witholding Tax";Decimal)
        {
        }
        field(5;"Net Dividends";Decimal)
        {
        }
        field(6;"Qualifying Shares";Decimal)
        {
        }
        field(7;Shares;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Member No",Date)
        {
            Clustered = true;
            SumIndexFields = "Gross Dividends","Net Dividends",Shares,"Qualifying Shares","Witholding Tax";
        }
    }

    fieldgroups
    {
    }
}

