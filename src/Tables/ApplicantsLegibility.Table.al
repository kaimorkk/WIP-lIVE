Table 52193612 "Applicants Legibility"
{

    fields
    {
        field(1;"Member Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[200])
        {
            NotBlank = true;
            TableRelation = "Membership legibility".Description;
        }
        field(3;Legible;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Member Code",Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

