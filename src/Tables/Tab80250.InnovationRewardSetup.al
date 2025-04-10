
table 80250 "Innovation Reward Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Reward Category"; Option)
        {
            OptionCaption = 'Cash Benefit,Non-Cash Benefit';
            OptionMembers = "Cash Benefit","Non-Cash Benefit";
        }
        field(3; Description; Text[30])
        {
        }
        field(4; Payroll; Boolean)
        {
        }
        field(5; "Earning Code"; Code[30])
        {
            // TableRelation = if (Payroll = const(true)) EarningsX.Code;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

