Table 52193988 "Receipt Lines"
{

    fields
    {
        field(1;"Line No";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Receipt No.";Code[20])
        {
            TableRelation = Receipts1;
        }
        field(3;"Account Type";Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(4;"Account No.";Code[20])
        {
            TableRelation = if ("Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Account Type"=const(Customer)) Customer
                            else if ("Account Type"=const(Vendor)) Vendor
                            else if ("Account Type"=const("Fixed Asset")) "Fixed Asset"
                            else if ("Account Type"=const("Bank Account")) "Bank Account";

            trigger OnValidate()
            begin

                case "Account Type" of
                 "account type"::"G/L Account":
                  begin
                   if GLAccount.Get("Account No.") then
                      begin
                     "Account Name":=GLAccount.Name;Message('Test');
                      Description:= GLAccount.Name;

                      end;
                  end;
                  "account type"::Customer:
                  begin
                  if Cust.Get("Account No.") then
                     begin
                     "Account Name":=Cust.Name;
                     Description:=  Cust.Name;
                     end;
                  end;
                  "account type"::Vendor:
                  begin
                   if Vendor.Get("Account No.") then
                      begin
                      "Account Name":=Vendor.Name;
                      Description:=Vendor.Name;
                      end;
                   end;
                 end;
            end;
        }
        field(5;"Account Name";Text[30])
        {

            trigger OnValidate()
            begin

                if  "Account Type"="account type"::"G/L Account" then

                      Description:= GLAccount.Name;

                if "Account Type"="account type"::Customer then
                     Description:=  Cust.Name;

                if "Account Type"= "account type"::Vendor then
                      Description:=Vendor.Name;
            end;
        }
        field(6;Description;Text[70])
        {
        }
        field(7;"VAT Code";Code[20])
        {
            TableRelation = "VAT Product Posting Group";
        }
        field(8;"W/Tax Code";Code[20])
        {
            TableRelation = "VAT Product Posting Group";
        }
        field(9;"VAT Amount";Decimal)
        {
        }
        field(10;"W/Tax Amount";Decimal)
        {
        }
        field(11;Amount;Decimal)
        {

            trigger OnValidate()
            begin
                "Net Amount":=Amount;
            end;
        }
        field(12;"Net Amount";Decimal)
        {
        }
        field(13;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(14;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
    }

    keys
    {
        key(Key1;"Line No")
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

