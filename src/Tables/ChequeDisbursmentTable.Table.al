Table 52193582 "Cheque Disbursment Table"
{

    fields
    {
        field(1;codes;Code[30])
        {

            trigger OnValidate()
            begin

                if codes<> xRec.codes then begin
                  SalesSetup.Get;
                  NoSeriesMgt.TestManual(SalesSetup."Micro Finance Loan Nos");
                  "No. Series" := '';
                end;
            end;
        }
        field(2;"Loan Number";Code[30])
        {
        }
        field(3;"Cheque Number";Code[20])
        {
        }
        field(4;"Cheque Amount";Decimal)
        {
        }
        field(5;"No. Series";Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(6;"Bank Account";Code[20])
        {
            TableRelation = if ("Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Account Type"=const(Customer)) Customer
                            else if ("Account Type"=const(Vendor)) Vendor
                            else if ("Account Type"=const("Bank Account")) "Bank Account"
                            else if ("Account Type"=const("Fixed Asset")) "Fixed Asset"
                            else if ("Account Type"=const("IC Partner")) "IC Partner";
        }
        field(7;"Dedact From";Boolean)
        {
        }
        field(8;"Posting Date";Date)
        {
        }
        field(9;"Account Type";Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
    }

    keys
    {
        key(Key1;codes,"Loan Number","Cheque Number")
        {
            Clustered = true;
            SumIndexFields = "Cheque Amount";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
         if codes = '' then begin
          SalesSetup.Get;
         SalesSetup.TestField(SalesSetup."Micro Finance Loan Nos");
          NoSeriesMgt.InitSeries(SalesSetup."Micro Finance Loan Nos",xRec."No. Series",0D,codes,"No. Series");
         end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

