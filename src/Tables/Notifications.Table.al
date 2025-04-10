Table 52193445 Notifications
{

    fields
    {
        field(1;"Code";Code[30])
        {
        }
        field(2;Description;Text[250])
        {
        }
        field(3;Subject;Text[250])
        {
        }
        field(4;Type;Option)
        {
            OptionCaption = 'SMS,EMAIL';
            OptionMembers = SMS,EMAIL;
        }
        field(5;"Message Type";Option)
        {
            OptionCaption = ' ,Welcome,Loan Application,Loan Rejection';
            OptionMembers = " ",Welcome,"Loan Application","Loan Rejection";
        }
        field(6;Activate;Boolean)
        {
        }
        field(7;Template;Blob)
        {
        }
        field(9;"Sender Name";Text[40])
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

