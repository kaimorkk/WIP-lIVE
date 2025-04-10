Table 52194075 "Fund Check Lines"
{

    fields
    {
        field(1;Period;Date)
        {
        }
        field(2;"Account No.";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(3;"Account Name";Text[100])
        {
        }
        field(4;Amount;Decimal)
        {
        }
        field(5;Check;Option)
        {
            OptionCaption = 'Absolute,Advisory,No Check';
            OptionMembers = Absolute,Advisory,"No Check";
        }
        field(6;"Period End";Date)
        {
        }
    }

    keys
    {
        key(Key1;Period,"Account No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

