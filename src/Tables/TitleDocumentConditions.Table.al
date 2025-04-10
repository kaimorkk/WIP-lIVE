Table 52193611 "Title Document Conditions"
{

    fields
    {
        field(1;"Title Code";Code[20])
        {
            NotBlank = true;
            TableRelation = "Title Document Types".Code;
        }
        field(2;Conditions;Text[150])
        {
            NotBlank = true;
        }
        field(3;Remarks;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Title Code",Conditions)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

