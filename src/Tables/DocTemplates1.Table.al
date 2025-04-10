Table 52193705 "Doc Templates1"
{
    DrillDownPageID = "Doc Templates";
    LookupPageID = "Doc Templates";

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;Date;Date)
        {
        }
        field(3;Description;Text[250])
        {
        }
        field(4;"Document Link";Text[200])
        {
        }
        field(5;Type;Option)
        {
            NotBlank = true;
            OptionMembers = Notice,Minutes,"Board Paper"," Committee Paper";
        }
        field(6;"Language Code (Default)";Code[10])
        {
        }
        field(7;Attachement;Option)
        {
            OptionMembers = No,Yes;
        }
        field(8;"Litigation Code";Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"Code","Litigation Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

