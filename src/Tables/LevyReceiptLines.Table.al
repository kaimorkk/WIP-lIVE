Table 52193993 "Levy Receipt Lines"
{
    DrillDownPageID = "Levy Receipt Line List";
    LookupPageID = "Levy Receipt Line List";

    fields
    {
        field(1;"Registration No.";Code[20])
        {
            TableRelation = "Levy Receipt Header";
        }
        field(2;"Line No.";Integer)
        {
            NotBlank = true;
        }
        field(3;"Payment Type";Option)
        {
            OptionMembers = " ",Levy,Penalty,Registration;
        }
        field(5;"In Payment For";Text[100])
        {
        }
        field(6;"Document No";Code[20])
        {
        }
        field(7;"Payment Date";Date)
        {
        }
        field(8;"Customer No.";Code[20])
        {
        }
        field(10;"Levy Reference No.";Integer)
        {
            TableRelation = Levy;

            trigger OnValidate()
            begin
                if Levies.Get("Levy Reference No.") then
                "In Payment For":=Levies.Name;
            end;
        }
        field(11;Amount;Decimal)
        {
        }
        field(12;"Account Type";Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(13;"Account No.";Code[20])
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
                  if Cust.Get("Account No.") then
                    "Account Name":=Cust.Name;
                  end;
                 "account type"::Customer:
                  begin
                   if GLAccount.Get("Account No.") then
                      "Account Name":=GLAccount.Name;
                  end;
                  "account type"::Vendor:
                  begin
                   if Vendor.Get("Account No.") then
                      "Account Name":=Vendor.Name;
                   end;
                 end;
            end;
        }
        field(14;"Account Name";Text[50])
        {
        }
        field(15;Posted;Boolean)
        {
        }
        field(17;"Global Dimension 1 Code";Code[20])
        {
        }
        field(18;"Global Dimension 2 Code";Code[20])
        {
        }
        field(19;"Amount Due";Decimal)
        {
        }
        field(20;"Applies to Doc. No";Code[20])
        {

            trigger OnLookup()
            begin

                "Applies to Doc. No":='';
                  Amt:=0;
                 CustLedger.Reset;
                 CustLedger.SetCurrentkey(CustLedger."Customer No.",Open,"Document No.");
                 CustLedger.SetRange(CustLedger."Customer No.","Customer No.");
                 CustLedger.SetRange(Open,true);
                 CustLedger.CalcFields(CustLedger.Amount);
                if Page.RunModal(0,CustLedger) = Action::LookupOK then begin

                if CustLedger."Applies-to ID"<>'' then begin
                 CustLedger1.Reset;
                 CustLedger1.SetCurrentkey(CustLedger1."Customer No.",Open,"Applies-to ID");
                 CustLedger1.SetRange(CustLedger1."Customer No.","Customer No.");
                 CustLedger1.SetRange(Open,true);
                 CustLedger1.SetRange("Applies-to ID",CustLedger."Applies-to ID");
                 if CustLedger1.Find('-') then begin
                   repeat
                     CustLedger1.CalcFields(CustLedger1.Amount);
                     Amt:=Amt+Abs(CustLedger1.Amount);
                   until CustLedger1.Next=0;
                  end;

                if Amt<>Amt then
                 //ERROR('Amount is not equal to the amount applied on the application form');
                 if Amount=0 then
                 Amount:=Amt;
                 Validate(Amount);
                 "Applies to Doc. No":=CustLedger."Document No.";
                end else begin
                if Amount<>Abs(CustLedger.Amount) then
                CustLedger.CalcFields(CustLedger."Remaining Amount");
                 if Amount=0 then
                Amount:=Abs(CustLedger."Remaining Amount");
                Validate(Amount);
                "Applies to Doc. No":=CustLedger."Document No.";

                end;
                end;
                Validate(Amount);
            end;
        }
        field(21;"Levy Type Code";Code[20])
        {
            TableRelation = "Levy Types";
        }
    }

    keys
    {
        key(Key1;"Registration No.","Line No.")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    var
        Levies: Record Levy;
        Customer: Record Customer;
        LeviesHeader: Record "Levy Receipt Header";
        GLAccount: Record "G/L Account";
        Cust: Record Customer;
        Vendor: Record Vendor;
        FixedAsset: Record "Fixed Asset";
        BankAccount: Record "Bank Account";
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        Amt: Decimal;
}

