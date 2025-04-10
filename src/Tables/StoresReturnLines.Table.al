Table 52194073 "Stores Return Lines"
{

    fields
    {
        field(1;"Requisition No";Code[20])
        {

            trigger OnValidate()
            begin

                if ReqHeader.Get("Requisition No") then
                begin
                 "Procurement Plan":=ReqHeader."Procurement Plan";
                //bkk for now  "Global Dimension 1 Code":=ReqHeader."Global Dimension 1 Code";

                end;
            end;
        }
        field(2;"Line No";Integer)
        {

            trigger OnValidate()
            begin
                if ReqHeader.Get("Requisition No") then
                begin
                 "Procurement Plan":=ReqHeader."Procurement Plan";
                // "Global Dimension 1 Code":=ReqHeader."Global Dimension 1 Code";

                end;
            end;
        }
        field(3;Type;Option)
        {
            OptionCaption = ' ,G/L Account,Item';
            OptionMembers = " ","G/L Account",Item;
        }
        field(4;No;Code[20])
        {
            TableRelation = if (Type=const("G/L Account")) "G/L Account"
                            else if (Type=const(Item)) Item;

            trigger OnValidate()
            begin
                 if Type=Type::Item then
                 begin
                 if ItemRec.Get(No) then
                 begin
                   Description:=ItemRec.Description;
                   "Unit of Measure":=ItemRec."Base Unit of Measure";

                   ItemRec.CalcFields(ItemRec.Inventory);
                   "Quantity in Store":=ItemRec.Inventory;
                   "Unit Price":=ItemRec."Unit Cost";

                 end;
                 end;
            end;
        }
        field(5;Description;Text[250])
        {
        }
        field(6;Quantity;Decimal)
        {

            trigger OnValidate()
            begin
                "Quantity Approved":=Quantity;
            end;
        }
        field(7;"Unit of Measure";Code[10])
        {
            TableRelation = "Unit of Measure";
        }
        field(8;"Unit Price";Decimal)
        {
        }
        field(9;Amount;Decimal)
        {
        }
        field(10;"Procurement Plan";Code[20])
        {
            TableRelation = "G/L Budget Name";
        }
        field(11;"Procurement Plan Item";Code[20])
        {
            TableRelation = "Procurement Plan1"."Plan Item No" where ("Plan Year"=field("Procurement Plan"));

            trigger OnValidate()
            begin
                 if ProcurementPlan.Get("Procurement Plan","Global Dimension 1 Code","Procurement Plan Item") then
                 begin
                 if ProcurementPlan."Procurement Type"=ProcurementPlan."procurement type"::Goods then
                 begin
                  Type:=Type::Item;
                   No:=ProcurementPlan."No.";
                 end;
                 if ProcurementPlan."Procurement Type"<>ProcurementPlan."procurement type"::Goods then
                 begin
                  Type:=Type::"G/L Account";
                  No:=ProcurementPlan."Source of Funds";
                 end;
                   "Budget Line":=ProcurementPlan."Source of Funds";
                    Description:=ProcurementPlan."Item Description";
                   "Unit of Measure":=ProcurementPlan."Unit of Measure";
                //    "Unit Price":=ProcurementPlan."Unit Price";

                 end;
            end;
        }
        field(12;"Budget Line";Code[20])
        {
        }
        field(13;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
                
                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 1 Code":="Global Dimension 1 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                END;
                
                PurchaseReqDet.VALIDATE(PurchaseReqDet."No."); */

            end;
        }
        field(14;"Amount LCY";Decimal)
        {
        }
        field(15;Select;Boolean)
        {
        }
        field(16;"Request Generated";Boolean)
        {
        }
        field(22;"Process Type";Option)
        {
            OptionCaption = ' ,Direct,RFQ,RFP,Tender';
            OptionMembers = " ",Direct,RFQ,RFP,Tender;
        }
        field(23;"Quantity Approved";Decimal)
        {
            Editable = true;
        }
        field(24;"Quantity in Store";Decimal)
        {
            Editable = false;
        }
        field(25;"Approved Budget Amount";Decimal)
        {
            CalcFormula = sum("G/L Budget Entry".Amount where ("Budget Name"=field("Procurement Plan"),
                                                               "G/L Account No."=field("Budget Line"),
                                                               "Global Dimension 1 Code"=field("Global Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(26;"Commitment Amount";Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(27;"Actual Expense";Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where ("G/L Account No."=field("Budget Line"),
                                                        "Global Dimension 1 Code"=field("Global Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(28;"Available amount";Decimal)
        {
            Editable = false;
        }
        field(29;"Requisition Status";Option)
        {
            OptionCaption = ' ,Approved,Rejected';
            OptionMembers = " ",Approved,Rejected;
        }
    }

    keys
    {
        key(Key1;"Requisition No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ReqHeader: Record "Requisition Header1";
        ProcurementPlan: Record "Procurement Plan1";
        ItemRec: Record Item;
}

