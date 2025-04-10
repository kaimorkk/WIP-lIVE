Table 52193767 "Job Responsiblitiesx1"
{
    // //DrillDownPageID = UnknownPage52324;
    // //LookupPageID = UnknownPage52324;

    fields
    {
        field(1; "Job ID"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobsx1"."Job ID";
        }
        field(2; Responsibility; Text[120])
        {
            NotBlank = true;
        }
        field(3; Remarks; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Job ID", Responsibility)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

