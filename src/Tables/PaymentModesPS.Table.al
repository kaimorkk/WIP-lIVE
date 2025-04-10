Table 52194056 "Payment ModesPS"
{
    DrillDownPageID = "Payment Modes111-SACCO";
    LookupPageID = "Payment Modes111-SACCO";

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[50])
        {
        }
        field(3;"Account Affected";Option)
        {
            OptionMembers = Cashier,Predefined,Postdefined;
        }
        field(4;"Account Type";Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(5;"Account No.";Code[20])
        {
            Caption = 'Account No.';
            TableRelation = if ("Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Account Type"=const(Customer)) Customer
                            else if ("Account Type"=const(Vendor)) Vendor
                            else if ("Account Type"=const("Bank Account")) "Bank Account"
                            else if ("Account Type"=const("Fixed Asset")) "Fixed Asset"
                            else if ("Account Type"=const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin
                if "Account Type" in ["account type"::Customer,"account type"::Vendor,"account type"::"IC Partner"] then

                case "Account Type" of
                  "account type"::"G/L Account":
                    begin
                      GLAcc.Get("Account No.");
                      //"Account Name":=GLAcc.Name;
                    end;
                  "account type"::Customer:
                    begin
                      Cust.Get("Account No.");
                      //"Account Name":=Cust.Name;
                    end;
                  "account type"::Vendor:
                    begin
                      Vend.Get("Account No.");
                      //"Account Name":=Vend.Name;
                    end;
                  "account type"::"Bank Account":
                    begin
                      BankAcc.Get("Account No.");
                      //"Account Name":=BankAcc.Name;
                    end;
                  "account type"::"Fixed Asset":
                    begin
                      FA.Get("Account No.");
                      //"Account Name":=FA.Description;
                    end;
                end;
            end;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLAcc: Record "G/L Account";
        Cust: Record Customer;
        Vend: Record Vendor;
        FA: Record "Fixed Asset";
        BankAcc: Record "Bank Account";
}

