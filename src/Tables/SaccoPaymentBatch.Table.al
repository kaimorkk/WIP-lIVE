Table 52193613 "Sacco Payment Batch"
{
    LookupPageID = "SACCO Payment Batches";

    fields
    {
        field(1;"Journal Batch Name";Code[20])
        {
            NotBlank = true;
        }
        field(2;Company;Code[20])
        {
            TableRelation = "Members Company".Code;
        }
        field(3;"Posting Date";Date)
        {
        }
        field(4;"Slip/Rcpt No";Code[50])
        {
        }
        field(5;"Total Amount";Decimal)
        {
            CalcFormula = sum("Payment Lines_new".Amount where ("Journal Template Name"=const('SALES'),
                                                                "Journal Batch Name"=field("Journal Batch Name")));
            FieldClass = FlowField;
        }
        field(6;"Bank Account";Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(7;"Date Filter";Text[100])
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1;"Journal Batch Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

