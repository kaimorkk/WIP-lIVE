Table 52193804 "Tender Mandatory Requirements1"
{

    fields
    {
        field(1;"Tender No";Code[50])
        {
        }
        field(2;"Mandatory Requirement";Text[30])
        {
        }
    }

    keys
    {
        key(Key1;"Tender No","Mandatory Requirement")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

