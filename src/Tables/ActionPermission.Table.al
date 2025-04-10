Table 52193454 "Action Permission"
{
    DrillDownPageID = "Bosa Product Card";
    LookupPageID = "Bosa Product Card";

    fields
    {
        field(1;"Action ID";Code[20])
        {
            TableRelation = Actions."Action ID";
        }
        field(2;"User ID";Code[20])
        {
            TableRelation = User."User Security ID";
        }
    }

    keys
    {
        key(Key1;"Action ID","User ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

