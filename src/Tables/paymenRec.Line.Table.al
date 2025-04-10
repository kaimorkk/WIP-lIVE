Table 52193521 "paymen Rec. Line"
{

    fields
    {
        field(1;No;Code[20])
        {
        }
        field(2;"Transaction Type";Option)
        {
            OptionCaption = ' ,Investment,Loan,Repayment,Withdrawal,Interest Due,Interest Paid,Deposit Contribution,Ess scheme,Cpe Scheme,Registration Fee,Chidren Scheme,Dividend,Holiday Scheme,Shares Contributions,Plot Scheme,Loan Adjustment';
            OptionMembers = " ",Investment,Loan,Repayment,Withdrawal,"Interest Due","Interest Paid","Deposit Contribution","Ess scheme","Cpe Scheme","Registration Fee","Chidren Scheme",Dividend,"Holiday Scheme","Shares Contributions","Plot Scheme","Loan Adjustment";
        }
        field(3;Amount;Decimal)
        {
        }
        field(4;"Account  No.";Code[20])
        {
            TableRelation = Charges.Code where (Percentage=field("Member No."));

            trigger OnValidate()
            begin
                   loanapp.Reset;
                   loanapp.SetRange(loanapp.Code,"Account  No.");
                   if loanapp.Find('-') then begin
                   "Loan Type":=loanapp.Description;
                   "Loan Desc":=loanapp.Description;
                   end;
            end;
        }
        field(5;"Member No.";Decimal)
        {
        }
        field(6;"Loan Type";Code[20])
        {
        }
        field(7;"Account type";Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(8;"Account No";Code[20])
        {
            TableRelation = if ("Account type"=const("G/L Account")) "G/L Account"
                            else if ("Account type"=const(Customer)) Customer
                            else if ("Account type"=const(Vendor)) Vendor
                            else if ("Account type"=const("Bank Account")) "Bank Account"
                            else if ("Account type"=const("Fixed Asset")) "Fixed Asset"
                            else if ("Account type"=const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin
                 loanapp.Reset;
                 loanapp.SetCurrentkey(loanapp.Code);
                 loanapp.SetRange(loanapp.Code,"Account No");
                 if loanapp.Find('-')then begin
                  "Loan Type":=loanapp.Description;
                  end;
            end;
        }
        field(9;"Loan Desc";Text[40])
        {
        }
    }

    keys
    {
        key(Key1;No,"Member No.","Account  No.","Transaction Type")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key2;"Member No.")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    var
        loanapp: Record Charges;
}

