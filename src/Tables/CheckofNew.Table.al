Table 52193588 "Check of New"
{

    fields
    {
        field(1;"Staff Number";Code[30])
        {
        }
        field(2;Amount;Decimal)
        {
        }
        field(3;Interest;Decimal)
        {
        }
        field(4;Types;Option)
        {
            OptionCaption = 'Deposits,BBF,INVESTMENT,MAIN,EMER,SCHOOL,REFINANCE,ENTRANCE FEE,DEFAULTERS,ALMASI,JONGEA,SHUJAA,TIBA';
            OptionMembers = Deposits,BBF,INVESTMENT,MAIN,EMER,SCHOOL,REFINANCE,"ENTRANCE FEE",DEFAULTERS,ALMASI,JONGEA,SHUJAA,TIBA;
        }
        field(5;Number;Code[10])
        {
        }
        field(6;"Staff found";Boolean)
        {
        }
        field(7;"Loan Found";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;Number)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

