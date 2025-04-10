Table 52193598 "Customer Pv Break Down"
{

    fields
    {
        field(1; No; Code[10])
        {
        }
        field(2; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(3; "Account No"; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Account Type" = const("Bank Account")) "Bank Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin
                if "Account Type" = "account type"::Customer then begin
                    if CUST.Get("Account No") then
                        Name := CUST.Name;
                    "Staff Number" := CUST."Staff No";
                end
                else if "Account Type" = "account type"::"G/L Account" then begin
                    if ACCOUNT.Get("Account No") then
                        Name := ACCOUNT.Name;
                end
                else if "Account Type" = "account type"::"Bank Account" then begin
                    if Bank.Get("Account No") then
                        Name := Bank.Name;
                end;
            end;
        }
        field(4; Name; Text[60])
        {
        }
        field(5; Descrition; Text[60])
        {
        }
        field(6; Amount; Decimal)
        {
        }
        field(7; "Transaction Type"; Option)
        {
            OptionCaption = ' ,Registration Fee,Loan,Repayment,Withdrawal,Interest Due,Interest Paid,BBF Contribution,Shares Contribution,Investment,Deposit Contribution';
            OptionMembers = " ","Registration Fee",Loan,Repayment,Withdrawal,"Interest Due","Interest Paid","BBF Contribution","Shares Contribution",Investment,"Deposit Contribution";
        }
        field(8; "Loan No"; Code[60])
        {
            // TableRelation = if ("Account Type"=const(Customer)) Loans."Loan No." where ("Member No."=field("Account No"));
        }
        field(9; "Staff Number"; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Account No", "Account Type", "Transaction Type", "Loan No", Amount, No)
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    var
        CUST: Record Customer;
        ACCOUNT: Record "G/L Account";
        Bank: Record "Bank Account";
}

