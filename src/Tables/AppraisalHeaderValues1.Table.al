Table 52193938 "Appraisal Header Values1"
{
    DrillDownPageID = "Approval Format Values";
    LookupPageID = "Approval Format Values";

    fields
    {
        field(1;"Appraisal Header";Text[50])
        {
            TableRelation = "Appraisal Format Header1";
        }
        field(2;Value;Text[30])
        {
        }
    }

    keys
    {
        key(Key1;"Appraisal Header",Value)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

