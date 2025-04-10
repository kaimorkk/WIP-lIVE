Table 52193750 "Bench mark Recommendation1"
{

    fields
    {
        field(1;"Activity No";Code[10])
        {
            NotBlank = true;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
        }
        field(3;Recommendations;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Activity No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

