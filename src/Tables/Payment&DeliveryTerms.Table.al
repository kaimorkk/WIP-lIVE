Table 52193979 "Payment & Delivery Terms"
{

    fields
    {
        field(1;"Installment No";Integer)
        {
        }
        field(2;"Percentage of Contract Price";Decimal)
        {
        }
        field(3;Amount;Decimal)
        {
        }
        field(4;"Inclusive of VAT";Boolean)
        {
        }
        field(5;"Contract Code";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Installment No","Contract Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
          PaymentTerms.Reset;
          PaymentTerms.SetRange("Contract Code","Contract Code");
          if PaymentTerms.Find('+') then
           "Installment No":=PaymentTerms."Installment No"+1;
    end;

    var
        PaymentTerms: Record "Payment & Delivery Terms";
}

