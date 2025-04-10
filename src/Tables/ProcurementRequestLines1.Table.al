Table 52193795 "Procurement Request Lines1"
{

    fields
    {
        field(1;"Requisition No";Code[50])
        {
            TableRelation = "Procurement Request1";

            trigger OnValidate()
            begin

                if ReqHeader.Get("Requisition No") then
                begin
                 "Procurement Plan":=ReqHeader."Procurement Plan";
                 "Global Dimension 1 Code":=ReqHeader."Global Dimension 1 Code";

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
                 "Global Dimension 1 Code":=ReqHeader."Global Dimension 1 Code";

                end;
            end;
        }
        field(3;Type;Option)
        {
            OptionCaption = ' ,Non Stock Item,Item,,Fixed Asset';
            OptionMembers = " ","Non Stock Item",Item,,"Fixed Asset";
        }
        field(4;No;Code[50])
        {
            TableRelation = if (Type=const("Non Stock Item")) "G/L Account"
                            else if (Type=const(Item)) Item
                            else if (Type=const("Fixed Asset")) "Fixed Asset";
        }
        field(5;Description;Text[250])
        {
        }
        field(6;Quantity;Decimal)
        {
        }
        field(7;"Unit of Measure";Code[10])
        {
            TableRelation = "Unit of Measure";
        }
        field(8;"Unit Price";Decimal)
        {

            trigger OnValidate()
            begin

                  Amount:=Quantity*"Unit Price";
            end;
        }
        field(9;Amount;Decimal)
        {
        }
        field(10;"Procurement Plan";Code[50])
        {
            TableRelation = "G/L Budget Name";
        }
        field(11;"Procurement Plan Item";Code[50])
        {
            TableRelation = "Procurement Plan1"."Plan Item No" where ("Plan Year"=field("Procurement Plan"),
                                                                      "Department Code"=field("Global Dimension 1 Code"));

            trigger OnValidate()
            begin
                 if ProcurementPlan.Get("Procurement Plan","Global Dimension 1 Code","Procurement Plan Item") then
                 begin
                 if ProcurementPlan."Procurement Type"=ProcurementPlan."procurement type"::Goods then
                 begin
                  Type:=Type::Item;
                 end;
                 /*
                 IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN
                 BEGIN
                  Type:=Type::"Fixed Asset";
                 END;
                  */
                 if ProcurementPlan."Procurement Type"<>ProcurementPlan."procurement type"::Goods then
                 begin
                  Type:=Type::"Non Stock Item";
                  No:=ProcurementPlan."Source of Funds";
                 end;
                  "Budget Line":=ProcurementPlan."Source of Funds";
                   Description:=ProcurementPlan."Item Description";
                 end;

            end;
        }
        field(12;"Budget Line";Code[10])
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

    trigger OnInsert()
    begin
        if ReqHeader.Get("Requisition No") then
        begin
         "Procurement Plan":=ReqHeader."Procurement Plan";
         "Global Dimension 1 Code":=ReqHeader."Global Dimension 1 Code";

        end;
    end;

    var
        ReqHeader: Record "Requisition Header1";
        ProcurementPlan: Record "Procurement Plan1";
}

