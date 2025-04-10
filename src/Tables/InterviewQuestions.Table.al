Table 52194053 "Interview Questions"
{

    fields
    {
        field(1;"Applicant No.";Code[20])
        {
        }
        field(2;"Interview Questions";Text[250])
        {
        }
        field(3;Comment;Text[250])
        {
        }
        field(4;Score;Decimal)
        {
        }
        field(5;"Line No";Integer)
        {
        }
    }

    keys
    {
        key(Key1;"Applicant No.","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

