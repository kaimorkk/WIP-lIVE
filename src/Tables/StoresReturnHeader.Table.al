Table 52194072 "Stores Return Header"
{
    // DrillDownPageID = "Fuel Card-Closed";
    // LookupPageID = "Fuel Card-Closed";

    fields
    {
        field(1;"No.";Code[22])
        {
        }
        field(2;"Employee Code";Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                 /*IF Empl.GET("Employee Code") THEN
                 "Employee Name":=Empl."First Name"+' '+Empl."Last Name"
                 ELSE
                 "Employee Name":='';
                 MODIFY;
                  */

            end;
        }
        field(3;"Employee Name";Text[100])
        {
        }
        field(5;"Store Requisition";Code[20])
        {
            // TableRelation = "Requisition Header1" where (Posted=const(true),
            //                                              "Requisition Type"=const(Contributions));

            trigger OnValidate()
            begin
                if StoreRequisition.Get("Store Requisition") then begin
                  "Employee Code":=StoreRequisition."Employee Code";
                  "Employee Name":=StoreRequisition."Employee Name";
                  "Global Dimension 1 Code":=StoreRequisition."Global Dimension 1 Code";
                  "Global Dimension 2 Code":=StoreRequisition."Global Dimension 2 Code";
                  "Procurement Plan":=StoreRequisition."Procurement Plan";
                end;
                //Populate Stores Return Lines
                 RequisitionLines.SetRange(RequisitionLines."Requisition No","Store Requisition");
                 if RequisitionLines.FindFirst then begin
                  repeat
                   StoresLine."Requisition No":="No.";
                   StoresLine."Line No":=RequisitionLines."Line No";
                   StoresLine.Type:=RequisitionLines.Type;
                   StoresLine.No:=RequisitionLines.No;
                   StoresLine.Description:=RequisitionLines.Description;
                   StoresLine.Quantity:=RequisitionLines.Quantity;
                   StoresLine."Unit of Measure":=RequisitionLines."Unit of Measure";
                   //StoresLine."Unit Price":=RequisitionLines."Unit Price";
                   StoresLine.Amount:=RequisitionLines.Amount;
                   StoresLine."Procurement Plan":=RequisitionLines."Procurement Plan";
                   StoresLine."Budget Line":=RequisitionLines."Budget Line";
                   StoresLine."Global Dimension 1 Code":=RequisitionLines."Global Dimension 1 Code";
                   StoresLine."Amount LCY":=RequisitionLines."Amount LCY";
                   StoresLine."Quantity Approved":=RequisitionLines."Quantity Approved";
                   StoresLine."Quantity in Store":=RequisitionLines."Quantity in Store";

                  if not StoresLine.Get("No.",StoresLine."Line No") then
                   StoresLine.Insert;
                   until
                   RequisitionLines.Next=0;
                  end;
            end;
        }
        field(6;"Return Date";Date)
        {
        }
        field(7;Status;Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(10;"Raised by";Code[20])
        {
        }
        field(14;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(21;Rejected;Boolean)
        {
        }
        field(23;"Global Dimension 1 Code";Code[20])
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
        field(37;Ordered;Boolean)
        {
        }
        field(38;User;Code[10])
        {
            TableRelation = User;
        }
        field(39;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
                
                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN  BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 2 Code":="Global Dimension 2 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                 END;*/

            end;
        }
        field(40;"Global Dimension 3 Code";Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(3));

            trigger OnValidate()
            begin
                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 3 Code":="Global Dimension 3 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                
                 END;
                
                {IF "Global Dimension 2 Code" = '' THEN
                  EXIT;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 2 Code","Global Dimension 2 Code");
                
                }  */

            end;
        }
        field(41;"Procurement Plan";Code[20])
        {
        }
        field(42;"Purchaser Code";Code[10])
        {
        }
        field(43;"Document Type";Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Purchase Requisition,Store Requisition,Imprest,Claim-Accounting,Appointment,Payment Voucher';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Purchase Requisition","Store Requisition",Imprest,"Claim-Accounting",Appointment,"Payment Voucher";
        }
        field(44;"Currency Code";Code[20])
        {
            TableRelation = Currency;
        }
        field(45;"Date of Use";Date)
        {
        }
        field(46;"Requisition Type";Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Payment Voucher,Imprest,Staff Claim,Imprest Surrender,Petty Cash,Imprest Requisitioning,Purchase Requisition,Store Requisition,Stores Return';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher",Imprest,"Staff Claim","Imprest Surrender","Petty Cash","Imprest Requisitioning","Purchase Requisition","Store Requisition","Stores Return";
        }
        field(47;Posted;Boolean)
        {
            Editable = false;
        }
        field(48;"No of Approvals";Integer)
        {
            CalcFormula = count("Approval Entry" where ("Table ID"=const(51511675),
                                                        "Document No."=field("No.")));
            Editable = false;
            FieldClass = FlowField;
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
        if "No." = '' then begin
        if "Requisition Type"="requisition type"::"Purchase Requisition" then
        begin
          PurchSetup.Get;
          PurchSetup.TestField("Purchase Req No");
          NoSeriesMgt.InitSeries(PurchSetup."Purchase Req No",xRec."No.",0D,"No.","No. Series");
        end;

        if "Requisition Type"="requisition type"::"Store Requisition" then
        begin
          PurchSetup.Get;
          PurchSetup.TestField(PurchSetup."Store Requisition Nos.");
          NoSeriesMgt.InitSeries(PurchSetup."Store Requisition Nos.",xRec."No.",0D,"No.","No. Series");
        end;

        if "Requisition Type"="requisition type"::"Stores Return" then
        begin
          PurchSetup.Get;
          PurchSetup.TestField(PurchSetup."Store Return Nos");
          NoSeriesMgt.InitSeries(PurchSetup."Store Return Nos",xRec."No.",0D,"No.","No. Series");
        end;


        end;

        "Raised by":=UserId;

        if UsersRec.Get(UserId) then
        begin
        if Empl.Get(UsersRec."Employee No.") then
        begin
        "Employee Code":=Empl."No.";
        "Employee Name":=Empl."First Name"+' '+Empl."Last Name";
         "Global Dimension 1 Code":=Empl."Global Dimension 1 Code";
        "Procurement Plan":=PurchSetup."Effective Procurement Plan";
        end;
        end;

        "Return Date":=Today;
        "Procurement Plan":=PurchSetup."Effective Procurement Plan";
    end;

    var
        Empl: Record Employee;
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UsersRec: Record "User Setup";
        RequisitionLines: Record "Requisition Lines1";
        StoreRequisition: Record "Requisition Header1";
        StoresLine: Record "Requisition Lines1";
}

