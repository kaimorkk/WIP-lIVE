Table 52193823 Committee1
{

    fields
    {
        field(1;"No.";Code[10])
        {
        }
        field(2;Name;Text[100])
        {
        }
        field(3;"E-mail";Text[100])
        {
        }
        field(4;"Committee Type";Option)
        {
            OptionCaption = '  ,Finance and Administration,Technical,Audit';
            OptionMembers = "  ","Finance and Administration",Technical,Audit;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

