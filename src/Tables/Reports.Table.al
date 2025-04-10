Table 52194080 Reports
{

    fields
    {
        field(1;"Report 1";Text[250])
        {
            ExtendedDatatype = URL;
        }
        field(2;Report2;Text[250])
        {
            ExtendedDatatype = URL;
        }
    }

    keys
    {
        key(Key1;"Report 1")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

