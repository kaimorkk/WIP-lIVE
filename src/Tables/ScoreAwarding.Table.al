Table 52194008 "Score Awarding"
{
    DrillDownPageID = "Score Awarding";
    LookupPageID = "Score Awarding";

    fields
    {
        field(1;Supplier;Text[100])
        {
        }
        field(2;"Score Criteria";Text[30])
        {
            TableRelation = "Score Criteria"."Score Criteria";

            trigger OnValidate()
            begin
                 if Criteria.Get("Score Criteria") then
                 "Max Score":=Criteria."Max Score";
            end;
        }
        field(3;"Max Score";Decimal)
        {
        }
        field(4;"Score Awarded";Decimal)
        {
        }
        field(5;Period;Code[20])
        {
        }
    }

    keys
    {
        key(Key1;Supplier,"Score Criteria",Period)
        {
            Clustered = true;
            SumIndexFields = "Score Awarded";
        }
    }

    fieldgroups
    {
    }

    var
        Criteria: Record "Score Criteria";
}

