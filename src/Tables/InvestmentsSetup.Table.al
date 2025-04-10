Table 52193969 "Investments Setup"
{

    fields
    {
        field(1;"Primary Key";Code[10])
        {
        }
        field(2;"Investment Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(3;"Money Market Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(4;"Property Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5;"Equity Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(6;"Mortgages/Loans";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(7;"CBK Year Days";Integer)
        {
        }
        field(8;"CBK 6months Days";Integer)
        {
        }
        field(9;"Warning Period";DateFormula)
        {
        }
        field(10;"Retirement Age";Integer)
        {
        }
        field(11;"Market Mortgage Interest Rate";Decimal)
        {
        }
        field(12;"Government Mortgage Rate";Decimal)
        {
        }
        field(13;"Calendar Days";Integer)
        {
        }
        field(14;"Withholding Tax Percentage";Decimal)
        {
        }
        field(15;"Management Fee Receivables AC";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(16;"Management Fee Income AC";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(17;"Witholding Tax%-Fixed Deposits";Decimal)
        {
        }
        field(18;"Other Commission Percentage";Decimal)
        {
        }
        field(19;"Unit Trust Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(20;"Unit Trust Member Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(21;"Forex Exchange Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(22;"NSE Website";Text[80])
        {
        }
        field(23;"General Journal";Code[10])
        {
        }
        field(24;"Accrued JV";Code[20])
        {
        }
        field(25;"Offshore Investment Nos.";Code[20])
        {
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

