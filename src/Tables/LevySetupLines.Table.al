Table 52194068 LevySetupLines
{

    fields
    {
        field(1;LevySetupLinesID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;LevySetupID;Integer)
        {
        }
        field(3;LevyCode;Code[10])
        {
        }
        field(4;LevyModeID;Integer)
        {
        }
        field(5;Value;Decimal)
        {
        }
        field(6;QueryString;Text[250])
        {
        }
        field(7;ReasonsForPayment;Text[250])
        {
        }
        field(8;ApplicationFee;Boolean)
        {
        }
        field(9;PenaltyFee;Boolean)
        {
        }
        field(10;Mandatory;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;LevySetupLinesID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

