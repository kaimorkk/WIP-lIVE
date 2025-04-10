Table 52193501 "Treasury Coinage"
{

    fields
    {
        field(1;No;Code[20])
        {
            TableRelation = "Treasury Transactions" where (No=field(No));
        }
        field(2;"Code";Code[20])
        {
            NotBlank = true;
            TableRelation = Denominations;

            trigger OnValidate()
            begin
                if Coinage.Get(Code) then begin
                Description:=Coinage.Description;
                //Type:=;
                //Value:=Coinage."Currency Code";
                end;
            end;
        }
        field(3;Description;Text[50])
        {
        }
        field(4;Type;Option)
        {
            OptionMembers = Note,Coin;
        }
        field(5;Value;Decimal)
        {
        }
        field(6;Quantity;Integer)
        {

            trigger OnValidate()
            begin
                TotalDN:=0;
                AddVarDN:=0;

                Modify;

                TransactionDetails.Reset;

                TransactionDetails.SetRange(TransactionDetails.No,No);

                if TransactionDetails.Find('-') then begin
                repeat

                AddVarDN:=0;
                AddVarDN:=TransactionDetails.Value*TransactionDetails.Quantity;
                TotalDN:=TotalDN+AddVarDN;

                until TransactionDetails.Next=0;
                end;

                Transactions.Reset;
                if Transactions.Get(No) then begin;
                Transactions."Coinage Amount":=TotalDN;
                Transactions.Modify;
                end;

                if Quantity<>0 then
                "Total Amount":=Quantity*Value;
            end;
        }
        field(7;"Total Amount";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;No,"Code")
        {
            Clustered = true;
            SumIndexFields = "Total Amount";
        }
    }

    fieldgroups
    {
    }

    var
        Coinage: Record Denominations;
        TotalDN: Decimal;
        AddVarDN: Decimal;
        Transactions: Record "Treasury Transactions";
        TransactionDetails: Record "Treasury Coinage";
}

