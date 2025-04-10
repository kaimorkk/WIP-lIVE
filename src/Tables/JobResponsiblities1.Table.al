Table 52193886 "Job Responsiblities1"
{
    DrillDownPageID = "Job Responsiblities";
    LookupPageID = "Job Responsiblities";

    fields
    {
        field(1;"Job ID";Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobs1"."Job ID";
        }
        field(2;Responsibility;Text[220])
        {
            NotBlank = true;
        }
        field(3;Remarks;Text[80])
        {
        }
    }

    keys
    {
        key(Key1;"Job ID",Responsibility)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

