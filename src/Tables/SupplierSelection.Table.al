Table 52193671 "Supplier Selection"
{

    fields
    {
        field(1;"Reference No.";Code[20])
        {
            TableRelation = "Procurement Request";

            trigger OnValidate()
            begin
                 if ProcurementRequest.Get("Reference No.") then
                 begin
                //  "Supplier Category":=ProcurementRequest.Category;
                 end;
            end;
        }
        field(2;"Supplier Name";Text[50])
        {
            TableRelation = "Prequalified Suppliers".Name;
        }
        field(3;"Supplier Category";Code[20])
        {
        }
        field(4;Invited;Boolean)
        {
        }
        field(5;Address;Text[50])
        {
            Caption = 'Address';
        }
        field(6;City;Text[30])
        {
            Caption = 'City';

            trigger OnLookup()
            begin
                //PostCode.LookUpCity(City,"Post Code",TRUE);
            end;

            trigger OnValidate()
            begin
                //PostCode.ValidateCity(City,"Post Code");
            end;
        }
        field(7;"Phone No.";Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(8;"Post Code";Code[20])
        {
            Caption = 'Post Code';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                //PostCode.LookUpPostCode(City,"Post Code",TRUE);
            end;

            trigger OnValidate()
            begin
                //PostCode.ValidatePostCode(City,"Post Code");
            end;
        }
        field(9;"Country/Region Code";Code[20])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
    }

    keys
    {
        key(Key1;"Reference No.","Supplier Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementRequest: Record "Procurement Request";
        PostCode: Record "Post Code";


    procedure CreateQuote(var SupplierSelection: Record "Supplier Selection")
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        PurchaseRequest: Record "Procurement Request";
        PreQualifiedList: Record "Prequalified Suppliers";
        ProcurementRequestLine: Record "Procurement Request Lines";
    begin
        /* Create a supplier from the list of Pre-Qualified Suppliers */
        
        if Invited then
        begin
        PreQualifiedList.Reset;
        PreQualifiedList.SetRange(PreQualifiedList.Name,SupplierSelection."Supplier Name");
        //PreQualifiedList.SETRANGE(PreQualifiedList.Category,SupplierSelection."Supplier Category");
        if PreQualifiedList.Find('-') then
        begin
        
        /*IF PreQualifiedList."Vendor No"='' THEN
        IF CONFIRM('The system will create Vendor %1 Do you want to continue?',TRUE,SupplierSelection."Supplier Name") THEN
        BEGIN
        PreQualifiedList.CreateVend(PreQualifiedList);
        END;*/
        
        PurchaseHeader.Init;
        PurchaseHeader."Document Type":=PurchaseHeader."document type"::Quote;
        PurchaseHeader."No.":='';
        PurchaseHeader."Buy-from Vendor No.":=PreQualifiedList."Vendor No";
        PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
        PurchaseHeader.Insert(true);
        
        ProcurementRequestLine.Reset;
        ProcurementRequestLine.SetRange(ProcurementRequestLine."Requisition No",SupplierSelection."Reference No.");
        if ProcurementRequestLine.Find('-') then
        repeat
        PurchaseLine.Init;
        PurchaseLine."Document Type":=PurchaseHeader."Document Type";
        PurchaseLine."Document No.":=PurchaseHeader."No.";
        PurchaseLine."Line No.":=ProcurementRequestLine."Line No";
        PurchaseLine."Buy-from Vendor No.":=PreQualifiedList."Vendor No";
        PurchaseLine.Type:=ProcurementRequestLine.Type;
        PurchaseLine."No.":=ProcurementRequestLine.No;
        PurchaseLine.Validate(PurchaseLine."No.");
        PurchaseLine.Description:=ProcurementRequestLine.Description;
        PurchaseLine."Unit of Measure":=ProcurementRequestLine."Unit of Measure";
        PurchaseLine.Validate(PurchaseLine."Unit of Measure");
        PurchaseLine.Quantity:=ProcurementRequestLine.Quantity;
        PurchaseLine.Insert;
        until ProcurementRequestLine.Next=0;
        end;
        Message('Orders %1 Has Been Created succeessfully', PurchaseHeader."No.");
        end;

    end;


    procedure CreateQuoteEvaluation(var SupplierSelection: Record "Supplier Selection")
    var
        PreQualifiedList: Record "Prequalified Suppliers";
        ProcurementRequestLine: Record "Procurement Request Lines";
        QuoteEvaluation: Record "Quote Evaluation";
        PPSetup: Record "Purchases & Payables Setup";
        QuoteEvaluationHeader: Record "Quote Evaluation Header";
    begin
        /* Create a supplier from the list of Pre-Qualified Suppliers */
        if Invited then
        begin
        PreQualifiedList.Reset;
        PreQualifiedList.SetRange(PreQualifiedList.Name,SupplierSelection."Supplier Name");
        //PreQualifiedList.SETRANGE(PreQualifiedList.Category,SupplierSelection."Supplier Category");
        if PreQualifiedList.Find('-') then
        begin
        if PreQualifiedList."Vendor No"='' then
        if Confirm('The system will create Vendor %1 Do you want to continue?',true,SupplierSelection."Supplier Name") then
        begin
        PreQualifiedList.CreateVend(PreQualifiedList);
        
        end;
        //Insert Header
        if ProcurementRequest.Get(SupplierSelection."Reference No.") then begin
           QuoteEvaluationHeader.Init;
        //    QuoteEvaluationHeader."Quote No":=ProcurementRequest."No.";
           QuoteEvaluationHeader.Title:=ProcurementRequest.Title;
           QuoteEvaluationHeader."Requisition No":=ProcurementRequest."Requisition No";
        
        // if not QuoteEvaluationHeader.Get(ProcurementRequest."No.") then
        //    QuoteEvaluationHeader.Insert;
         end;
        //Insert Lines
        ProcurementRequestLine.Reset;
        ProcurementRequestLine.SetRange(ProcurementRequestLine."Requisition No",SupplierSelection."Reference No.");
        if ProcurementRequestLine.FindFirst then begin
        repeat
        PPSetup.Get;
        QuoteEvaluation.Init;
        QuoteEvaluation."Quote No":=SupplierSelection."Reference No.";
        QuoteEvaluation."Vendor No":=PreQualifiedList."Vendor No";
        QuoteEvaluation.Validate(QuoteEvaluation."Vendor No");
        QuoteEvaluation.Type:=ProcurementRequestLine.Type;
        QuoteEvaluation."No.":=ProcurementRequestLine.No;
        QuoteEvaluation.Description:=ProcurementRequestLine.Description;
        QuoteEvaluation."Unit of Measure":=ProcurementRequestLine."Unit of Measure";
        QuoteEvaluation.Validate(QuoteEvaluation."Unit of Measure");
        QuoteEvaluation.Quantity:=ProcurementRequestLine.Quantity;
        QuoteEvaluation."Unit Amount":=ProcurementRequestLine."Unit Price";
        QuoteEvaluation.Amount:=ProcurementRequestLine.Amount;
        QuoteEvaluation."Line No":=ProcurementRequestLine."Line No";
        if ProcurementRequest.Get(SupplierSelection."Reference No.") then
        QuoteEvaluation.Title:=ProcurementRequest.Title;
        if not QuoteEvaluation.Get(SupplierSelection."Reference No.",PreQualifiedList."Vendor No",ProcurementRequestLine.No) then
         QuoteEvaluation.Insert;
        until ProcurementRequestLine.Next=0;
         end;
         end;
         //Archive the quotation
         if ProcurementRequest.Get(SupplierSelection."Reference No.") then  begin
            // ProcurementRequest.Status:=ProcurementRequest.Status::Archived;
            ProcurementRequest.Modify;
            Message(Format('The Quation Evaluation Has Been Created'));
          end;
         end;

    end;
}

