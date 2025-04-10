Table 52193490 "Account Notices"
{

    fields
    {
        field(1;"Account Type";Code[20])
        {
            NotBlank = true;
            TableRelation = "Account Types".Code;
        }
        field(2;"Code";Code[20])
        {
            NotBlank = false;
        }
        field(3;Description;Text[100])
        {
        }
        field(4;Duration;DateFormula)
        {
        }
        field(5;Penalty;Decimal)
        {
        }
        field(6;Type;Option)
        {
            OptionMembers = Other,"Limit Withdrawal","Account Closure";
        }
        field(7;"GL Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(8;"Percentage Of Amount";Decimal)
        {
        }
        field(9;"Use Percentage";Boolean)
        {
        }
        field(10;Minimum;Decimal)
        {
        }
        field(11;Maximum;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Account Type","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

