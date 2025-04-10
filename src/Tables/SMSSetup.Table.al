Table 52193439 "SMS Setup1"
{

    fields
    {
        field(1;Name;Code[20])
        {
            NotBlank = false;
        }
        field(2;URL;Text[250])
        {
        }
        field(3;"Message Parameter";Text[100])
        {
            NotBlank = true;
        }
        field(4;"Phone Parameter";Text[100])
        {
            NotBlank = true;
        }
        field(5;Status;Option)
        {
            OptionMembers = " ",Active,Inactive;
        }
        field(6;"Phone Prefix";Text[10])
        {
        }
    }

    keys
    {
        key(Key1;Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

