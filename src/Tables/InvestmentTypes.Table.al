Table 52193970 "Investment Types"
{
    // //DrillDownPageID = UnknownPage74032;
    // //LookupPageID = UnknownPage74032;

    fields
    {
        field(1; "Code"; Code[10])
        {
            NotBlank = true;
        }
        field(2; Description; Text[30])
        {
        }
        field(3; Type; Option)
        {
            OptionMembers = " ","Money Market",Property,Equity,Mortgage;
        }
        field(4; "Interest Rate p.a"; Decimal)
        {
        }
        field(5; "Repayment Frequency"; DateFormula)
        {
        }
        field(6; "Grace Period"; DateFormula)
        {
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

