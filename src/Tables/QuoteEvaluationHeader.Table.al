Table 52193995 "Quote Evaluation Header"
{

    fields
    {
        field(1; "Quote No"; Code[20])
        {
            NotBlank = true;
            //TableRelation = Table0;
        }
        field(2; Title; Text[70])
        {
        }
        field(3; "Requisition No"; Code[20])
        {
            //TableRelation = Table0;
        }
        field(4; "Quote Generated"; Boolean)
        {
        }
        field(5; Minutes; Boolean)
        {
        }
        field(6; "Awarding Committee"; Code[20])
        {
            //TableRelation = Table0;
        }
        field(7; "Date of Award"; Date)
        {
        }
        field(8; "No. series"; Code[10])
        {
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Quote No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Quote No" = '' then begin
            PurchSetup.Get;
            PurchSetup.TestField(PurchSetup."Quote Evaluation Nos");
            NoSeriesMgt.InitSeries(PurchSetup."Quote Evaluation Nos", xRec."No. series", 0D, "Quote No", "No. series");
        end;
    end;

    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

