Table 52193966 Counties
{
    DrillDownPageID = Counties;
    LookupPageID = Counties;

    fields
    {
        field(1;"County Code";Code[30])
        {
        }
        field(2;"County Description";Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"County Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"County Code","County Description")
        {
        }
    }
}

