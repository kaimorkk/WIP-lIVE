Table 52193815 "Survey Stages1"
{

    fields
    {
        field(1;"Survey ID";Code[10])
        {
        }
        field(2;"Stage ID";Code[10])
        {
            TableRelation = "Survey Stage1";
        }
        field(3;Finished;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Survey ID","Stage ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

