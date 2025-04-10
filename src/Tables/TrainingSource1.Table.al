Table 52193903 "Training Source1"
{
    LookupPageID = "Training Sources";

    fields
    {
        field(1;Source;Code[50])
        {
            NotBlank = true;
        }
        field(2;Remarks;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;Source)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

