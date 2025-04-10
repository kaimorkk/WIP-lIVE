
table 70022 "Tender Bids"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Requisition No"; Code[50])
        {
            TableRelation = "Procurement Request";

            trigger OnValidate()
            begin

                /*
                IF ReqHeader.GET("Requisition No") THEN
                BEGIN
                 "Procurement Plan":=ReqHeader."Procurement Plan";
                 "Global Dimension 1 Code":=ReqHeader."Global Dimension 1 Code";
                END;*/
                ProcurementLines.Reset;
                ProcurementLines.SetRange("Requisition No", "Requisition No");
                if ProcurementLines.FindSet then begin
                    Type := ProcurementLines.Type;
                    No := ProcurementLines.No;
                    Description := ProcurementLines.Description;

                end;

            end;
        }
        field(2; "Bidder Name"; Text[150])
        {

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange("Search Name", "Bidder Name");
                if Vendor.FindFirst then
                    "Linked vendor" := Vendor."No.";
            end;
        }
        field(3; "Bidder Email"; Text[60])
        {
        }
        field(4; "Line No"; Integer)
        {

            trigger OnValidate()
            begin
                /*
                IF ReqHeader.GET("Requisition No") THEN
                BEGIN
                 "Procurement Plan":=ReqHeader."Procurement Plan";
                 "Global Dimension 1 Code":=ReqHeader."Global Dimension 1 Code";
                END;
                */

            end;
        }
        field(5; Type; Option)
        {
            OptionCaption = ' ,Non Stock Item,Item,,Fixed Asset';
            OptionMembers = " ","Non Stock Item",Item,,"Fixed Asset";
        }
        field(6; No; Code[10])
        {
            TableRelation = if (Type = const("Non Stock Item")) "G/L Account"
            else
            if (Type = const(Item)) Item
            else
            if (Type = const("Fixed Asset")) "Fixed Asset";
        }
        field(7; Description; Text[250])
        {
        }
        field(8; Quantity; Decimal)
        {
        }
        field(9; "Unit of Measure"; Code[10])
        {
            TableRelation = "Unit of Measure";
        }
        field(10; "Unit Price"; Decimal)
        {

            trigger OnValidate()
            begin

                Amount := Quantity * "Unit Price";
            end;
        }
        field(11; Amount; Decimal)
        {
        }
        field(12; "Amount LCY"; Decimal)
        {
        }
        field(13; Discount; Decimal)
        {
        }
        field(14; Remarks; Text[250])
        {
        }
        field(15; contactNo; Code[20])
        {
        }
        field(16; Selected; Boolean)
        {

            trigger OnValidate()
            var
                rec1: Record "Prequalified Suppliers1";
            begin
            end;
        }
        field(17; "Vendor No"; Code[30])
        {
        }
        field(18; EntryNo; Integer)
        {
            AutoIncrement = true;
        }
        field(19; Awarded; Boolean)
        {
        }
        field(50028; "Linked vendor"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(50029; "Item No"; Code[10])
        {
            TableRelation = if (Type = const("Non Stock Item")) "G/L Account"
            else
            if (Type = const(Item)) Item
            else
            if (Type = const("Fixed Asset")) "Fixed Asset";
        }
    }

    keys
    {
        key(Key1; "Requisition No", "Line No", "Bidder Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementLines: Record "Procurement Request Lines";
        TenderBids: Record "Tender Bids";
        ReqHeader: Record "Procurement Request";
        Vendor: Record Vendor;
}

