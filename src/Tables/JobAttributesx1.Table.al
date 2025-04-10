Table 52193768 "Job Attributesx1"
{

    fields
    {
        field(1;"Job ID";Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobsx1"."Job ID";
        }
        field(2;Attribute;Text[200])
        {
            NotBlank = true;
        }
        field(3;Remarks;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Job ID",Attribute)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

