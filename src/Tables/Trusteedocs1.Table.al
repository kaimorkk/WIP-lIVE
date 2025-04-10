Table 52193701 "Trustee docs1"
{

    fields
    {
        field(1;"Code";Code[20])
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
        field(9;"Doc Code";Code[20])
        {
            TableRelation = "Doc Templates1";
        }
        field(10;Date;Date)
        {
        }
        field(11;Trustee;Code[20])
        {
            TableRelation = Trustees1;
        }
    }

    keys
    {
        key(Key1;"Code",Trustee)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

