Table 52193643 "Transactions Type Finance"
{
    DrillDownPageID = "Transaction Types Finance111";
    LookupPageID = "Transaction Types Finance111";

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; "Transaction Name"; Text[70])
        {
        }
        field(3; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(4; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor where("Debtor Type" = filter("Vendor Account"))
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const("Bank Account")) "Bank Account";
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

