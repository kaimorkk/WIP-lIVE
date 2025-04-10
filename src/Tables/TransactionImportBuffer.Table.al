Table 52193574 "Transaction Import Buffer"
{

    fields
    {
        field(1;"Account Code";Code[30])
        {
        }
        field(2;"Customer ID. No.";Code[30])
        {
        }
        field(3;"Transaction Code";Code[30])
        {
        }
        field(4;Amount;Decimal)
        {
        }
        field(5;Date;Date)
        {
        }
        field(6;Cashier;Code[30])
        {
        }
        field(7;"Account Exists";Option)
        {
            OptionMembers = ,Yes,No;
        }
        field(8;"Transaction Posted";Boolean)
        {
        }
        field(9;"Transaction Type";Option)
        {
            OptionMembers = ,Deposits,"Normal Withdrawals","From Teller","To Teller","From Treasury","To Treasury","Non Cust Withdrawals","BOSA Deposits","Treasury Transactions","Inter Teller","Non Cust Cheques","Normal Cheques","Salary Processing","EFT Transfers","Standing Orders",Contributions;
        }
        field(10;"Reference No";Code[20])
        {
        }
        field(11;Description;Text[30])
        {
        }
        field(12;From;Code[30])
        {
        }
        field(13;"To";Code[30])
        {
        }
        field(14;Primary;Integer)
        {
            AutoIncrement = true;
        }
        field(15;"Cheque No";Code[20])
        {
        }
        field(16;"Cheque Type";Code[20])
        {
        }
        field(17;"Staff Category";Option)
        {
            OptionMembers = "N/A",Executive,Other;
        }
        field(18;"Rec Found";Boolean)
        {
        }
        field(19;"Rec Ref No";Code[20])
        {
        }
        field(20;"Bank Code";Code[20])
        {
        }
        field(21;"External Account No";Code[30])
        {
        }
        field(22;"External Account Name";Text[150])
        {
        }
        field(23;"STO Duration";DateFormula)
        {
        }
        field(24;"STO No";Code[20])
        {
        }
        field(25;"Transaction Category";Code[20])
        {
        }
        field(26;CurrentUserID;Code[20])
        {
        }
        field(27;"Growers No.";Code[20])
        {
        }
        field(28;"Bonus?";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Account Code","Growers No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

