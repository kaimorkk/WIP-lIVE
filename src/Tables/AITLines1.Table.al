Table 52193982 "AIT Lines1"
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
        field(4;Answer;Option)
        {
            OptionCaption = ' ,Strongly Agree,Agree,Disagree,Strongly Disagree';
            OptionMembers = " ","Strongly Agree",Agree,Disagree,"Strongly Disagree";
        }
        field(5;Bold;Boolean)
        {
        }
        field(6;"Answer Type";Option)
        {
            OptionMembers = " ",Selection,Narrative;
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

