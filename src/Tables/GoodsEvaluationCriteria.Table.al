Table 52194076 "Goods Evaluation Criteria"
{
    DrillDownPageID = "Goods Evaluation Criteria";
    LookupPageID = "Goods Evaluation Criteria";

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;"Evaluation Description";Text[150])
        {
        }
        field(3;"Max Score";Decimal)
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

