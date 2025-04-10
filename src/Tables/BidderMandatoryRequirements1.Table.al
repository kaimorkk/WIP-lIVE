Table 52193805 "Bidder Mandatory Requirements1"
{

    fields
    {
        field(1;"Tender No";Code[20])
        {
        }
        field(2;"Company Name";Text[50])
        {
        }
        field(3;"Mandatory Requirement";Text[30])
        {
        }
        field(4;Complied;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Tender No","Company Name","Mandatory Requirement")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

