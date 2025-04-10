Table 52193779 "Applicants Document Link1"
{

    fields
    {
        field(1;"Applicant No";Code[20])
        {
            NotBlank = true;
            TableRelation = Applicants1."No.";
        }
        field(2;"Document Description";Text[100])
        {
            NotBlank = true;
        }
        field(3;"Document Link";Text[200])
        {
        }
        field(4;Attached;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Applicant No","Document Description")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

