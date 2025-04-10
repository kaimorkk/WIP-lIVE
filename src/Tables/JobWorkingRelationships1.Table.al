Table 52193958 "Job Working Relationships1"
{

    fields
    {
        field(1;"Job ID";Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobs1"."Job ID";
        }
        field(2;Type;Option)
        {
            NotBlank = false;
            OptionCaption = 'Internal,External';
            OptionMembers = Internal,External;
        }
        field(3;Relationship;Text[200])
        {
            NotBlank = true;
        }
        field(4;Remarks;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Job ID",Type,Relationship)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

