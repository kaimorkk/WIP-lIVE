Table 52193888 "Job Responsibilities Lines1"
{

    fields
    {
        field(1;"Employee No.";Code[20])
        {
            NotBlank = true;
        }
        field(2;Responsibility;Text[150])
        {
            NotBlank = true;
        }
        field(3;Date;Date)
        {
        }
        field(4;Remarks;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Employee No.",Responsibility,Date)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

