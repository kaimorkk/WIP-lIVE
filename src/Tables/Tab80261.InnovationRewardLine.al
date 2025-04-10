
table 80261 "Innovation Reward Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
            TableRelation = "Innovation Reward Voucher";
        }
        field(2; "Reward ID"; Code[50])
        {
            TableRelation = "Innovation Reward Setup";
        }
        field(3; "Reward Category"; Option)
        {
            OptionCaption = 'Cash Benefit,Non-Cash Benefit';
            OptionMembers = "Cash Benefit","Non-Cash Benefit";
        }
        field(4; Description; Text[255])
        {
        }
        field(5; Payroll; Boolean)
        {
        }
        field(6; "Earning Code"; Code[30])
        {
            // TableRelation = if (Payroll = const(true)) EarningsX.Code;
        }
        field(7; "Amount (LCY)"; Decimal)
        {
        }
        field(8; "Payroll Period"; Date)
        {
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
    }

    keys
    {
        key(Key1; "Document No.", "Reward ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

