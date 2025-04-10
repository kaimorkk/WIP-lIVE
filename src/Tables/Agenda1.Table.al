Table 52193822 Agenda1
{

    fields
    {
        field(1;"Agenda Code";Code[20])
        {
        }
        field(2;Agenda;Text[200])
        {
        }
        field(3;"Posted By";Text[30])
        {
        }
        field(4;Priority;Option)
        {
            OptionCaption = '  ,Low,Normal,High';
            OptionMembers = "  ",Low,Normal,High;
        }
        field(5;Date;Date)
        {
        }
        field(6;Status;Option)
        {
            OptionCaption = '  ,Open,Approved';
            OptionMembers = "  ",Open,Approved;
        }
        field(7;"Meeting Type";Option)
        {
            OptionCaption = '  ,Finance and Administration,Technical,Audit';
            OptionMembers = "  ","Finance and Administration",Technical,Audit;
        }
    }

    keys
    {
        key(Key1;"Agenda Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

