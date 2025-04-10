Table 52193565 "Accts Impt"
{

    fields
    {
        field(1;"Account No.";Code[30])
        {
        }
        field(2;Adress;Text[50])
        {
        }
        field(3;"Tel No";Text[50])
        {
        }
        field(4;"Reg Date";Date)
        {
        }
        field(5;"ID No";Code[30])
        {
        }
        field(6;Beneficiary;Text[50])
        {
        }
        field(7;Status;Option)
        {
            OptionCaption = 'Active,Frozen,Closed,Archived,New,Dormant,Deceased';
            OptionMembers = Active,Frozen,Closed,Archived,New,Dormant,Deceased;
        }
        field(8;Reason;Text[50])
        {
        }
        field(9;"Maturity Date";Date)
        {
        }
        field(10;"KIN 2";Text[50])
        {
        }
        field(11;"REL 2";Code[50])
        {
        }
        field(12;"ID 2";Code[50])
        {
        }
        field(13;"KIN 3";Text[50])
        {
        }
        field(14;"REL 3";Code[20])
        {
        }
        field(15;"ID 3";Code[50])
        {
        }
        field(19;"KIN 4";Text[50])
        {
        }
        field(20;"REL 4";Code[20])
        {
        }
        field(21;"ID 4";Code[50])
        {
        }
        field(22;"KIN 5";Text[50])
        {
        }
        field(23;"REL 5";Code[20])
        {
        }
        field(24;"ID 5";Code[50])
        {
        }
        field(25;"Member No";Code[50])
        {
        }
        field(26;"FDR Contra";Code[30])
        {
        }
        field(27;"Effective Date";Date)
        {
        }
        field(28;"ATM Card No";Code[20])
        {
        }
        field(29;"Close Date";Date)
        {
        }
        field(30;Proffesion;Text[50])
        {
        }
        field(31;"BEN REL";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Account No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

