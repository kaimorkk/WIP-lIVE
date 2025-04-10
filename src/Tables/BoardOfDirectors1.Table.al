Table 52193880 "Board Of Directors1"
{
    LookupPageID = "Board Of Directors-List";

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;SurName;Text[100])
        {
        }
        field(3;"Other Names";Text[150])
        {
        }
        field(4;Remarks;Text[200])
        {
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

