Table 52193863 "Training Evaluation Lines1"
{

    fields
    {
        field(1;"Line No";Integer)
        {
        }
        field(2;Question;Text[250])
        {
        }
        field(3;"Evaluation No";Code[20])
        {
        }
        field(4;Selection;Option)
        {
            OptionCaption = ' ,Strongly Agree,Agree,Neutral,Disagree,Strongly Disagree';
            OptionMembers = " ","Strongly Agree",Agree,Neutral,Disagree,"Strongly Disagree";
        }
        field(5;Bold;Boolean)
        {
        }
        field(6;"Answer Type";Option)
        {
            OptionMembers = " ",Selection,Narrative;
        }
        field(7;Narrative;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Line No","Evaluation No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

