Table 52194000 "Levy Types"
{
    LookupPageID = "Levy types list";

    fields
    {
        field(1;"Levy Code";Code[20])
        {
        }
        field(2;Description;Text[50])
        {
        }
        field(3;"G/L Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(4;"Transaction Type";Option)
        {
            OptionCaption = 'Registration Fee,Penalty,Levy,Refund';
            OptionMembers = "Registration Fee",Penalty,Levy,Refund;
        }
        field(5;IsApplicationFee;Boolean)
        {
        }
        field(6;IsCertificateFee;Boolean)
        {
        }
        field(7;IsPenalty;Boolean)
        {
        }
        field(8;ModuleID;Integer)
        {
        }
    }

    keys
    {
        key(Key1;"Levy Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

