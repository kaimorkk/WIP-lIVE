Table 52193971 "Investment Posting Groups"
{
    // //DrillDownPageID = UnknownPage74000;
    // //LookupPageID = UnknownPage74000;

    fields
    {
        field(1; "Code"; Code[30])
        {
            NotBlank = true;
        }
        field(2; Description; Text[30])
        {
        }
        field(3; "Investment Cost Account"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(4; "Investment Revaluation Account"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(5; "Investment Income Account"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(6; "Ledger Code"; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(7; "Gain/Loss on Disposal Account"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(8; "Capital Reserve Account"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(9; "Mortgage Arrears Account"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(10; "Revaluation Gain/Loss"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(11; "Commissions Ac"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(12; "Security Cost Ac"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(13; "Other Cost Ac"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(14; "Dividend Receivable AC"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(15; "Dividend Income AC"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(16; "Withholding Tax Account"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(17; "Unit Trust Members A/c"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(18; "Bonus Income AC"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(19; "Interest Receivable Account"; Code[20])
        {
            TableRelation = "G/L Account";
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

