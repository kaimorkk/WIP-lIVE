Table 52193523 RandPTypes
{

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[100])
        {
        }
        field(3;"Account Type";Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(4;Type;Option)
        {
            OptionMembers = " ",Receipt,Payment;
        }
        field(5;"VAT Chargeable";Option)
        {
            OptionMembers = No,Yes;
        }
        field(6;"Withholding Tax Chargeable";Option)
        {
            OptionMembers = No,Yes;
        }
        field(7;"VAT Code";Code[20])
        {
        }
        field(8;"Withholding Tax Code";Code[20])
        {
        }
        field(9;"Default Grouping";Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
        }
        field(10;"Account No.";Code[20])
        {
            TableRelation = "G/L Account"."No.";

            trigger OnValidate()
            begin

                case "Account Type" of
                 "account type"::"G/L Account":
                  begin
                   if GLAccount.Get("Account No.") then
                      Description:=GLAccount.Name;
                  end;
                  "account type"::Customer:
                  begin
                  if Cust.Get("Account No.") then
                    Description:=Cust.Name;
                  end;
                  "account type"::Vendor:
                  begin
                   if Vendor.Get("Account No.") then
                      Description:=Vendor.Name;
                   end;
                 end;
            end;
        }
        field(11;"Require Surrender";Boolean)
        {
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
        GLAccount: Record "G/L Account";
        Cust: Record Customer;
        Vendor: Record Vendor;
}

