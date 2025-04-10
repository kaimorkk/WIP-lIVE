Table 52193891 "HR Relative1"
{
    LookupPageID = "HR Relative";

    fields
    {
        field(1;"Code";Code[10])
        {
            NotBlank = true;
        }
        field(2;Relationship;Text[30])
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
        fieldgroup(DropDown;"Code",Relationship)
        {
        }
    }
}

