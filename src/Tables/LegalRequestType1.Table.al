Table 52193737 "Legal Request Type1"
{
    DrillDownPageID = "Legal Approval Form";
    LookupPageID = "Legal Approval Form";

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;"Request Type";Text[30])
        {
        }
    }

    keys
    {
        key(Key1;"Code","Request Type")
        {
            Clustered = true;
        }
        
    }

    fieldgroups
    {
    }
}

