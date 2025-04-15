Table 52193653 "RTGS Lines"
{

    fields
    {
        field(1; No; Code[30])
        {
            TableRelation = "RTGS Header".No;
        }
        field(2; Lines; Integer)
        {
        }
        field(5; "Source Account No"; Code[30])
        {
            NotBlank = true;
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Account Type" = const("Bank Account")) "Bank Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin
                case "Account Type" of
                    "account type"::"G/L Account":
                        begin
                            if GLAccount.Get("Source Account No") then
                                "Source Account Name" := GLAccount.Name;
                        end;
                    "account type"::Customer:
                        begin
                            if Cust.Get("Source Account No") then
                                "Source Account Name" := Cust.Name;
                        end;
                    "account type"::Vendor:
                        begin
                            if Vendor.Get("Source Account No") then
                                "Source Account Name" := Vendor.Name;
                        end;
                    "account type"::"Bank Account":
                        begin
                            if BankAccount.Get("Source Account No") then
                                "Source Account Name" := BankAccount.Name;
                        end;


                end;
            end;
        }
        field(6; "Source Account Name"; Text[60])
        {
        }
        field(7; Amount; Decimal)
        {
        }
        field(8; "Account Type Name"; Text[50])
        {
        }
        field(9; "Account No"; Code[30])
        {
            // TableRelation = Vendor where("Debtor Type" = filter());

            trigger OnValidate()
            begin
                if Vendor.Get("Account No") then begin
                    // "Account Name" := Vendor.Name;
                    // "Account Code" := Vendor."Account Type";
                end;
            end;
        }
        field(10; "Account Name"; Text[60])
        {
        }
        field(11; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(12; Description; Text[150])
        {
        }
        field(13; "Transaction Type"; Code[20])
        {
            //TableRelation = Table0;
        }
        field(14; "Account Code"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLAccount: Record "G/L Account";
        Cust: Record Customer;
        Vendor: Record Vendor;
        FixedAsset: Record "Fixed Asset";
        BankAccount: Record "Bank Account";
}

