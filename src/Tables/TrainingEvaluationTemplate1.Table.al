Table 52193862 "Training Evaluation Template1"
{

    fields
    {
        field(1;"Line No";Integer)
        {
        }
        field(2;Question;Text[250])
        {
        }
        field(3;Bold;Boolean)
        {
        }
        field(4;"Answer Type";Option)
        {
            OptionMembers = " ",Selection,Narrative;
        }
    }

    keys
    {
        key(Key1;"Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

