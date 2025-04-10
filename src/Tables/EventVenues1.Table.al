Table 52193816 "Event Venues1"
{
    LookupPageID = "Event Venues";

    fields
    {
        field(1;"Venue Code";Code[10])
        {
        }
        field(2;"Venue Description";Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"Venue Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

