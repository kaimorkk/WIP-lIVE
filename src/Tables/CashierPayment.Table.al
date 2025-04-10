Table 52193599 "Cashier Payment"
{

    fields
    {
        field(1;No;Code[20])
        {
        }
        field(2;"Member No.";Code[20])
        {
            TableRelation = if ("Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Account Type"=const(Customer)) Customer;

            trigger OnValidate()
            begin

                 if "Account Type"="account type"::Customer then begin
                cust.Reset;
                cust.SetRange(cust."No.","Member No.");
                if cust.Find('-') then begin
                "Member name":=cust.Name;

                end;
                end;

                if "Account Type"="account type"::"G/L Account" then begin
                "GL Account".Reset;
                "GL Account".SetRange("GL Account"."No.","Member No.");
                if "GL Account".Find('-') then begin
                "Member name":="GL Account".Name;
                end;
                end;
            end;
        }
        field(3;"Payment Date";Date)
        {
        }
        field(4;Amount;Decimal)
        {
            CalcFormula = sum("Receipts Lines".Amount where (No=field(No)));
            FieldClass = FlowField;
        }
        field(5;"No. Series";Code[20])
        {
        }
        field(6;Cashier;Code[20])
        {
        }
        field(7;"Bank Account";Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(8;"Ext. Document No.";Code[20])
        {
        }
        field(9;Posted;Boolean)
        {
            Editable = true;
        }
        field(10;"payment mode";Option)
        {
            OptionMembers = "CASH ",CHEQUE;
        }
        field(11;"Member name";Text[60])
        {
        }
        field(12;"CHEQUE NO";Code[10])
        {

            trigger OnValidate()
            begin
                if ("cashier receipt"."payment mode"="cashier receipt"."payment mode"::CHEQUE) then

                //IF ("cashier receipt"."CHEQUE NO"=0) THEN

                  Error('YOU MUST FILL CHEQUE NUMBER');
            end;
        }
        field(13;"Account Type";Option)
        {
            OptionCaption = 'G/L Account,Customer';
            OptionMembers = "G/L Account",Customer;
        }
        field(14;"Account Name";Code[20])
        {
        }
        field(15;"Amount Received";Decimal)
        {
        }
        field(24;"Activity Code";Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
        key(Key2;"Payment Date")
        {
        }
        key(Key3;"Member No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Posted then
        Error('The the transaction is posted');
    end;

    trigger OnInsert()
    begin
        if No = '' then begin
         SalesSetup.Get;
         SalesSetup.TestField(SalesSetup."Reminder Nos.");
         NoSeriesMgt.InitSeries(SalesSetup."Reminder Nos.",xRec."No. Series",0D, No,"No. Series");
        end;
        "Payment Date":=Today;
        Cashier:=UserId;
    end;

    trigger OnModify()
    begin
        if Posted then
        Error('The the transaction is posted');
    end;

    trigger OnRename()
    begin
        if Posted then
        Error('The the transaction is posted');
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        cust: Record Customer;
        "cashier receipt": Record "Cashier Payment";
        "GL Account": Record "G/L Account";
        cashrec: Record "Cashier Payment Rec. Line1";
        cashierr: Record "Cashier Payment Rec. Line1";
}

