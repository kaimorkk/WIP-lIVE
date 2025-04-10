
table 70036 "Inspection Header1"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Inspection No"; Code[20])
        {
        }
        field(2; "Order No"; Code[20])
        {
            Caption = 'Contract/Order No';
            TableRelation = if (Type = filter(Standard)) "Purchase Header"."No." where("Document Type" = const(Order))
            else
            if (Type = filter(Works)) "Purchase Header"."No." where("Document Type" = const("Blanket Order"));

            trigger OnValidate()
            begin
                PurchLines.Reset;
                //PurchLines.SETRANGE(PurchLines."Document Type",PurchLines."Document Type"::Order);
                PurchLines.SetRange(PurchLines."Document No.", "Order No");
                if PurchLines.Find('-') then begin
                    repeat
                        InspectLines.Init;
                        InspectLines."Inspection No" := "Inspection No";
                        InspectLines."Line No" := PurchLines."Line No.";
                        InspectLines.Description := PurchLines.Description;
                        InspectLines."Technical Specification" := PurchLines."Technical Specifications";
                        InspectLines."Unit of Measure" := PurchLines."Unit of Measure Code";
                        InspectLines."Quantity Ordered" := PurchLines.Quantity;
                        InspectLines."Quantity Received" := PurchLines.Quantity;
                        InspectLines."Received Qty" := PurchLines."Quantity Received";
                        if not InspectLines.Get(InspectLines."Inspection No", InspectLines."Line No") then
                            InspectLines.Insert;
                    until PurchLines.Next = 0;
                end;
                PO.Reset;
                PO.SetRange("No.", "Order No");
                if PO.FindSet then begin
                    "Supplier Name" := PO."Buy-from Vendor Name";
                    "Tender/Quotation No." := PO."Contract No.";
                    Description := 'Inspection of: ' + PO."Tender Name";
                    //"Commitee Appointment No":=PO.
                end;
            end;
        }
        field(3; "Commitee Appointment No"; Code[20])
        {
            TableRelation = "IFS Tender Committee"."Document No." where(Inspection = const(true), "Approval Status" = const(Released));
        }
        field(4; "Inspection Date"; Date)
        {
        }
        field(5; "Supplier Name"; Text[80])
        {
        }
        field(6; "No. Series"; Code[20])
        {
        }
        field(7; Status; Option)
        {
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Rejected,Payment Processing,Submitted';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected,"Payment Processing",Submitted;
        }
        field(8; Amount; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = const(Order),
                                                            "Document No." = field("Order No")));
            Editable = true;
            FieldClass = FlowField;
        }
        field(9; "Amount Invoiced"; Decimal)
        {
            CalcFormula = sum("Purch. Inv. Line".Amount where("Document No." = field("Order No")));
            FieldClass = FlowField;
        }
        field(10; "Temp Amount"; Decimal)
        {
        }
        field(11; "Tender/Quotation No."; Code[20])
        {
            Editable = false;
        }
        field(12; "Delivery Note No."; Text[30])
        {
        }
        field(13; Description; Text[250])
        {
        }
        field(14; "General Committe Remarks"; Text[250])
        {
        }
        field(15; Type; Option)
        {
            OptionCaption = 'Standard,Works';
            OptionMembers = Standard,Works;
        }
    }

    keys
    {
        key(Key1; "Inspection No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        PurchSetup.Get;
        PurchSetup.TestField(PurchSetup."Inspection Nos");
        NoSeriesMgt.InitSeries(PurchSetup."Inspection Nos", xRec."No. Series", 0D, "Inspection No", "No. Series");
    end;

    var
        PurchLines: Record "Purchase Line";
        InspectLines: Record "Inspection Lines1";
        PO: Record "Purchase Header";
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

