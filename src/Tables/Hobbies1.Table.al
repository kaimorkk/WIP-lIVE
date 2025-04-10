Table 52193778 Hobbies1
{

    fields
    {
        field(1;No;Code[20])
        {
            TableRelation = Applicants1."No.";
        }
        field(2;Hobbies;Text[200])
        {
        }
    }

    keys
    {
        key(Key1;No,Hobbies)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

