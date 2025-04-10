Table 52193994 "Quote Evaluation"
{

    fields
    {
        field(1; "Quote No"; Code[20])
        {
            //TableRelation = Table0;
        }
        field(2; "Vendor No"; Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if Vendor.Get("Vendor No") then
                    "Vendor Name" := Vendor.Name;
            end;
        }
        field(3; Type; Option)
        {
            OptionCaption = ',G/L Account,Item';
            OptionMembers = ,"G/L Account",Item;
        }
        field(4; "No."; Code[20])
        {
            TableRelation = if (Type = const(Item)) Item
            else if (Type = const("G/L Account")) "G/L Account";
        }
        field(5; Description; Text[70])
        {
        }
        field(6; Quantity; Integer)
        {

            trigger OnValidate()
            begin
                Amount := Quantity * "Unit Amount";
            end;
        }
        field(7; "Unit Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                Amount := Quantity * "Unit Amount";
            end;
        }
        field(8; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                "Unit Amount" := Quantity / Amount;
            end;
        }
        field(9; Awarded; Boolean)
        {
        }
        field(10; "Unit of Measure"; Code[10])
        {
        }
        field(11; "Line No"; Integer)
        {
        }
        field(12; "Quote Generated"; Boolean)
        {
        }
        field(13; "Vendor Name"; Text[70])
        {
        }
        field(14; Title; Text[70])
        {
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

    var
        Vendor: Record Vendor;


    procedure CreateQuote(var QuoteEvaluation: Record "Quote Evaluation")
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        QuoteEvaluationHeader: Record "Quote Evaluation Header";
    begin

        with QuoteEvaluation do begin
            if Awarded then begin
                //Purchase Header
                PurchaseHeader.Init;
                PurchaseHeader."Document Type" := PurchaseHeader."document type"::Quote;
                PurchaseHeader."No." := '';
                PurchaseHeader."Buy-from Vendor No." := "Vendor No";
                PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
                PurchaseHeader."Quote No." := "Quote No";
                //PurchaseHeader."Tender/Quotation ref no":="Quote No";
                //QuoteEvaluationHeader.GET("Quote No");
                //PurchaseHeader.Minutes:=QuoteEvaluationHeader.Minutes;
                PurchaseLine.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."Quote No.", "Quote No");
                PurchaseHeader.SetRange(PurchaseHeader."Buy-from Vendor No.", "Vendor No");
                if not PurchaseHeader.FindFirst then
                    PurchaseHeader.Insert(true);

                //Purchase Lines
                PurchaseLine.Reset;
                PurchaseLine.SetRange(PurchaseLine."Document Type", PurchaseLine."document type"::Quote);
                PurchaseLine.SetRange(PurchaseLine."Document No.", PurchaseHeader."No.");
                PurchaseLine.SetRange(PurchaseLine."Line No.", "Line No");
                PurchaseLine.SetRange(PurchaseLine."Buy-from Vendor No.", "Vendor No");
                if not PurchaseLine.FindFirst then begin
                    PurchaseLine.Init;
                    PurchaseLine."Document Type" := PurchaseLine."document type"::Quote;
                    PurchaseLine."Document No." := PurchaseHeader."No.";
                    PurchaseLine."Buy-from Vendor No." := "Vendor No";
                    PurchaseLine.Type := Type;
                    PurchaseLine."No." := "No.";
                    PurchaseLine."Line No." := "Line No";
                    PurchaseLine.Validate(PurchaseLine."No.");
                    PurchaseLine.Description := Description;
                    PurchaseLine."Unit of Measure" := "Unit of Measure";
                    PurchaseLine.Quantity := Quantity;
                    PurchaseLine."Direct Unit Cost" := "Unit Amount";
                    PurchaseLine.Validate(PurchaseLine."Direct Unit Cost");
                    if not PurchaseLine.Get(PurchaseLine."document type"::Quote, PurchaseHeader."No.", "Line No") then
                        PurchaseLine.Insert;
                end;
                Codeunit.Run(Codeunit::"Purch.-Quote to Order", PurchaseHeader);
            end;
        end;
    end;
}

