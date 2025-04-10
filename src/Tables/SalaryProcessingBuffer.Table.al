Table 52193515 "Salary Processing Buffer"
{

    fields
    {
        field(1;"No.";Integer)
        {
            NotBlank = false;
        }
        field(2;"Account No.";Code[20])
        {
            TableRelation = Vendor."No." where ("Creditor Type"=const(Account),
                                                "Account Type"=const('SAVINGS'));
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                Acc.Reset;
                Acc.SetRange(Acc."No.","Account No.");
                if Acc.Find('-') then begin
                if "Staff No." = '' then
                "Staff No.":=Acc."Staff No";
                if Name = '' then
                Name:=Acc.Name;

                end;
            end;
        }
        field(3;"Staff No.";Code[20])
        {
        }
        field(4;Name;Text[50])
        {
        }
        field(5;Amount;Decimal)
        {
        }
        field(6;"Account Not Found";Boolean)
        {
        }
        field(7;"Date Filter";Date)
        {
            FieldClass = FlowFilter;
        }
        field(8;Processed;Boolean)
        {
        }
        field(9;"Document No.";Code[20])
        {
        }
        field(10;Date;Date)
        {
        }
        field(11;"No. Series";Code[20])
        {
        }
        field(12;"Original Account No.";Code[30])
        {
        }
        field(13;"Multiple Salary";Boolean)
        {
        }
        field(14;Reversed;Boolean)
        {
        }
        field(15;"Branch Reff.";Code[20])
        {
        }
        field(16;"Account Name";Text[50])
        {
        }
        field(17;"ID No.";Code[30])
        {
        }
        field(18;Closed;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        SalBuffer.Reset;
        if SalBuffer.Find('+') then
        "No.":=SalBuffer."No."+1;
    end;

    var
        Acc: Record Vendor;
        NoSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalBuffer: Record "Salary Processing Buffer";
}

