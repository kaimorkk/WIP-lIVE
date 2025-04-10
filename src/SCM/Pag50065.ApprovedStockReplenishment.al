

page 50163 "Approved Stock Replenishment"
{
    AutoSplitKey = true;
    Caption = 'Lines';
    DelayedInsert = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = "Purchase Line";
    SourceTableView = where("Document Type" = filter("Store Requisition"),
                            Ordered = const(false),
                            "Fully Issued" = const(false),
                            Type = filter(Item | "Charge (Item)"),
                            Status = const(Released),
                            "Requisition Header Type" = filter("Stock Replenishment"));


    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Select2; Rec.Select2)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Select field.';
                }
                field("Selected By"; Rec."Selected By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Selected By field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the document number.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Service/Item Code"; Rec."Service/Item Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Service/Item Code field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the line type.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    trigger OnValidate()
                    begin
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate;
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies a description of the blanket purchase order.';
                }
                field("PO Number"; Rec."PO Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PO Number field.';
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    Editable = false;
                    ToolTip = 'Specifies the cost of one unit of the selected item or resource.';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the cost, in LCY, of one unit of the item or resource on the line.';
                }
                field("VAT %"; Rec."VAT %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the VAT % field.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the VAT specification of the involved item or resource to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    Editable = false;
                    ToolTip = 'Specifies the net amount, excluding any invoice discount amount, that must be paid for products on the line.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the sum of amounts in the Line Amount field on the purchase order lines.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Including VAT field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,3';
                    Editable = false;
                    Visible = true;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[3] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(3, ShortcutDimCode[3]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,4';
                    Visible = true;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[4] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(4, ShortcutDimCode[4]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                    end;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,5';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[5] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(5, ShortcutDimCode[5]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                    end;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,6';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[6] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(6, ShortcutDimCode[6]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                    end;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,7';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[7] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(7, ShortcutDimCode[7]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                    end;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,8';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[8] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(8, ShortcutDimCode[8]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Purchase Order")
            {
                Caption = 'Purchase Order';
                Image = Delivery;
                action("Add to Purchase Order")
                {
                    ApplicationArea = Basic;
                    Caption = 'Add to Purchase Order';
                    Image = AddAction;
                    ToolTip = 'Executes the Add to Purchase Order action.';
                    trigger OnAction()
                    begin
                        //OpenSalesOrderForm;



                        if Confirm('Are you sure you would like to Create LPOs from the selected items?', false) = true then begin

                            ReqLine.Reset;
                            ReqLine.SetRange(ReqLine."Document Type", ReqLine."document type"::"Store Requisition");
                            ReqLine.SetRange(ReqLine.Select2, true);
                            ReqLine.SetRange("Selected By", UserId);
                            ReqLine.SetRange(ReqLine.Ordered, false);
                            ReqLine.SetRange(ReqLine."Fully Issued", false);
                            ReqLine.SetRange(ReqLine.Category, ReqLine.Category::Item);

                            if ReqLine.Find('-') then begin
                                repeat
                                    //MESSAGE('%1',ReqLine."No.");

                                    PURCHLINE.Reset;
                                    PURCHLINE.SetRange(PURCHLINE."Document Type", PURCHLINE."document type"::Order);
                                    PURCHLINE.SetRange(PURCHLINE."Document No.", ReqLine."PO Number");

                                    if PURCHLINE.Find('-') then begin
                                        repeat
                                            LineNo := PURCHLINE."Line No.";
                                        //MESSAGE('%1',ReqLine."No.");
                                        until PURCHLINE.Next = 0;
                                    end else begin

                                        LineNo := 0;
                                    end;



                                    //MESSAGE('%1',ReqLine."No.");
                                    PURCHLINE.Reset;
                                    PURCHLINE.SetRange(PURCHLINE."Document Type", PURCHLINE."document type"::Order);
                                    PURCHLINE.SetRange(PURCHLINE."Document No.", ReqLine."PO Number");
                                    PURCHLINE.SetRange(PURCHLINE.Type, ReqLine.Type);
                                    PURCHLINE.SetRange(PURCHLINE."No.", ReqLine."No.");

                                    if PURCHLINE.FindFirst = false then begin

                                        // MESSAGE('%1',ReqLine."Service/Item Code");

                                        //MESSAGE('%1',ReqLine."No.");
                                        PURCHLINE.Init;
                                        PURCHLINE."Line No." := LineNo + 10000;

                                        PURCHLINE."Document Type" := PURCHLINE."document type"::Order;
                                        PURCHLINE."Document No." := ReqLine."PO Number";

                                        PURCHLINE.Type := ReqLine.Type;
                                        //PURCHLINE.VALIDATE(PURCHLINE.Type);
                                        PURCHLINE."No." := ReqLine."No.";
                                        if Rec.Type = Rec.Type::"G/L Account" then begin
                                            if Acct.Get(ReqLine."No.") then begin
                                                PURCHLINE."Gen. Bus. Posting Group" := Acct."Gen. Bus. Posting Group";
                                                PURCHLINE."Gen. Prod. Posting Group" := Acct."Gen. Prod. Posting Group";
                                                PURCHLINE."VAT Bus. Posting Group" := Acct."VAT Bus. Posting Group";
                                                PURCHLINE."VAT Prod. Posting Group" := Acct."VAT Prod. Posting Group";
                                            end;

                                        end;
                                        PURCHLINE.Category := ReqLine.Category;
                                        //PURCHLINE.VALIDATE(PURCHLINE.Category);
                                        PURCHLINE."Item Category" := ReqLine."Item Category";

                                        PURCHLINE."Service/Item Code" := ReqLine."Service/Item Code";
                                        PURCHLINE."Location Code" := ReqLine."Location Code";
                                        //PURCHLINE.VALIDATE(PURCHLINE."Service/Item Code");
                                        //PURCHLINE.Type:=ReqLine.Type;
                                        //PURCHLINE.VALIDATE(PURCHLINE.Type);
                                        PURCHLINE.Quantity := ReqLine."Qty. Requested";
                                        PURCHLINE."Dimension Set ID" := ReqLine."Dimension Set ID";
                                        PURCHLINE.Validate(PURCHLINE."Dimension Set ID");
                                        PURCHLINE.Insert(true);
                                        //MESSAGE('%1',PURCHLINE."Service/Item Code");
                                        //END;
                                        PURCHLINE.Validate("Service/Item Code");
                                        PURCHLINE."Requisition No." := ReqLine."No.";

                                        if PURCHLINE.Type = PURCHLINE.Type::"G/L Account" then begin
                                            PURCHLINE.Validate(PURCHLINE."No.");
                                            PURCHLINE.Modify;
                                        end;
                                        //PURCHLINE.VALIDATE("Service/Item Code");
                                        //PURCHLINE.VALIDATE(PURCHLINE.Category);
                                        PURCHLINE.Validate(PURCHLINE.Quantity);
                                        LineNo := LineNo + 10000;
                                        //END;


                                        //MESSAGE('%1',ReqLine."No.");
                                        ReqLine2.Reset;
                                        ReqLine2.SetRange(ReqLine2.Type, ReqLine.Type);
                                        ReqLine2.SetRange(ReqLine2."No.", ReqLine."No.");
                                        ReqLine2.SetRange(ReqLine2.Select2, true);
                                        ReqLine2.SetFilter(ReqLine2."Document No.", '>=%1', ReqLine."Document No.");
                                        ReqLine2.SetFilter(ReqLine2."Line No.", '<>%1', ReqLine."Line No.");

                                        if ReqLine2.Find('-') then begin

                                            repeat
                                                //MESSAGE('%1',ReqLine2."No.");
                                                PURCHLINE.Reset;
                                                PURCHLINE.SetRange(PURCHLINE."Document Type", PURCHLINE."document type"::Order);
                                                PURCHLINE.SetRange(PURCHLINE."Document No.", ReqLine."PO Number");
                                                PURCHLINE.SetRange(PURCHLINE.Type, ReqLine.Type);
                                                PURCHLINE.SetRange(PURCHLINE."No.", ReqLine."No.");

                                                if PURCHLINE.FindFirst then begin
                                                    PURCHLINE.Quantity := PURCHLINE.Quantity + ReqLine2."Qty. Requested";
                                                    PURCHLINE.Validate(PURCHLINE.Quantity);
                                                    PURCHLINE.Modify;
                                                end;


                                            until ReqLine2.Next = 0;
                                        end;

                                    end;
                                until ReqLine.Next = 0;
                            end;

                            ReqLine.Reset;
                            ReqLine.SetRange(ReqLine."Document Type", ReqLine."document type"::"Store Requisition");
                            ReqLine.SetRange(ReqLine.Select2, true);
                            ReqLine.SetRange(ReqLine.Ordered, false);


                            if ReqLine.Find('-') then begin
                                repeat

                                    PURCHLINE.Reset;
                                    PURCHLINE.SetRange(PURCHLINE."Document Type", PURCHLINE."document type"::Order);
                                    PURCHLINE.SetRange(PURCHLINE."Document No.", ReqLine."PO Number");
                                    PURCHLINE.SetRange(PURCHLINE.Type, ReqLine.Type);
                                    PURCHLINE.SetRange(PURCHLINE."No.", ReqLine."No.");

                                    if PURCHLINE.FindFirst then begin
                                        PURCHLINE.Category := ReqLine.Category;
                                        PURCHLINE."Service/Item Code" := ReqLine."Service/Item Code";
                                        PURCHLINE."Location Code" := ReqLine."Location Code";
                                        PURCHLINE.Description := ReqLine.Description;
                                        PURCHLINE.Modify;
                                        /*

                                        //BEGIN--insert line dimension
                                         DocDim.RESET;
                                         DocDim.SETRANGE(DocDim."Table ID",39);
                                         DocDim.SETRANGE(DocDim."Document Type",ReqLine."Document Type");
                                         DocDim.SETRANGE(DocDim."Document No.",ReqLine."Document No.");
                                         DocDim.SETRANGE(DocDim."Line No.",ReqLine."Line No.");

                                         IF DocDim.FIND('-') THEN BEGIN
                                         REPEAT

                                         IF DocDim2.GET(38,PURCHLINE."Document Type"::Order,PURCHLINE."Document No.",0,DocDim."Dimension Code")
                                         THEN BEGIN
                                         DocDim2."Dimension Code":=DocDim."Dimension Code";
                                         DocDim2.VALIDATE( DocDim2."Dimension Code");
                                         DocDim2."Dimension Value Code":=DocDim."Dimension Value Code";
                                         DocDim2.VALIDATE(DocDim2."Dimension Value Code");
                                         DocDim2."Dimension Code":=DocDim."Dimension Code";
                                         DocDim2.MODIFY;

                                         END ELSE BEGIN
                                         DocDim2.INIT;
                                         DocDim2."Table ID":=38;
                                         DocDim2."Document Type":=PURCHLINE."Document Type";
                                         DocDim2."Document No.":=PURCHLINE."Document No.";
                                         DocDim2."Line No.":=0;
                                         DocDim2."Dimension Code":=DocDim."Dimension Code";
                                         DocDim2.VALIDATE( DocDim2."Dimension Code");
                                         DocDim2."Dimension Value Code":=DocDim."Dimension Value Code";
                                         DocDim2.VALIDATE(DocDim2."Dimension Value Code");
                                         DocDim2.INSERT(TRUE);

                                         END;


                                         IF DocDim2.GET(39,PURCHLINE."Document Type"::Order,PURCHLINE."Document No.",PURCHLINE."Line No.",DocDim."Dimension Code")
                                         THEN BEGIN
                                         DocDim2."Dimension Code":=DocDim."Dimension Code";
                                         DocDim2.VALIDATE( DocDim2."Dimension Code");
                                         DocDim2."Dimension Value Code":=DocDim."Dimension Value Code";
                                         DocDim2.VALIDATE(DocDim2."Dimension Value Code");
                                         DocDim2."Dimension Code":=DocDim."Dimension Code";
                                         DocDim2.MODIFY;

                                         END ELSE BEGIN
                                         DocDim2.INIT;
                                         DocDim2."Table ID":=39;
                                         DocDim2."Document Type":=PURCHLINE."Document Type";
                                         DocDim2."Document No.":=PURCHLINE."Document No.";
                                         DocDim2."Line No.":=PURCHLINE."Line No.";
                                         DocDim2."Dimension Code":=DocDim."Dimension Code";
                                         DocDim2.VALIDATE( DocDim2."Dimension Code");
                                         DocDim2."Dimension Value Code":=DocDim."Dimension Value Code";
                                         DocDim2.VALIDATE(DocDim2."Dimension Value Code");
                                         DocDim2.INSERT(TRUE);

                                         END;

                                         UNTIL DocDim.NEXT=0;
                                         END;


                                        //END--insert line dimension

                                         */

                                    end;


                                    ReqLine.Ordered := true;
                                    ReqLine."Ordered by" := UserId;
                                    ReqLine."Order Creation date" := Today;
                                    ReqLine."Order Creation Time" := Time;
                                    ReqLine.Modify;


                                until ReqLine.Next = 0;
                            end;


                            /*


                            //MESSAGE('%1',ReqLine."No.");
                             ReqLine2.RESET;
                             ReqLine2.SETRANGE(ReqLine2.Type,ReqLine.Type);
                             ReqLine2.SETRANGE(ReqLine2."No.",ReqLine."No.");
                             ReqLine2.SETFILTER(ReqLine2."Document No.",'>%1',ReqLine."Document No.");

                            IF ReqLine2.FIND('-') THEN BEGIN

                            REPEAT
                            //MESSAGE('%1',ReqLine."No.");
                            PURCHLINE.RESET;
                            PURCHLINE.SETRANGE(PURCHLINE."Document Type",PURCHLINE."Document Type"::Order);
                            PURCHLINE.SETRANGE(PURCHLINE."Document No.",ReqLine."PO Number");
                            PURCHLINE.SETRANGE(PURCHLINE.Type,ReqLine.Type);
                            PURCHLINE.SETRANGE(PURCHLINE."No.",ReqLine."No.");

                            IF PURCHLINE.FINDFIRST  THEN BEGIN
                            PURCHLINE.Quantity:=PURCHLINE.Quantity+ReqLine2."Qty. Requested";
                            PURCHLINE.VALIDATE(PURCHLINE.Quantity);
                            PURCHLINE.MODIFY;
                            END;


                            UNTIL ReqLine2.NEXT=0;
                            END;


                            */

                        end;

                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Add to Purchase Order_Promoted"; "Add to Purchase Order")
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnDeleteRecord(): Boolean
    var
        ReservePurchLine: Codeunit "Purch. Line-Reserve";
    begin
        if (Rec.Quantity <> 0) and Rec.ItemExists(Rec."No.") then begin
            Commit;
            if not ReservePurchLine.DeleteLineConfirm(Rec) then
                exit(false);
            ReservePurchLine.DeleteLine(Rec);
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.InitType;
        Clear(ShortcutDimCode);
    end;

    var
        TransferExtendedText: Codeunit "Transfer Extended Text";
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
        ShortcutDimCode: array[8] of Code[20];
        UpdateAllowedVar: Boolean;
        Text000: label 'Unable to execute this function while in view only mode.';
        PurchHeader: Record "Purchase Header";
        PurchPriceCalcMgt: Codeunit "Purch. Price Calc. Mgt.";
        Text001: label 'You cannot use the Explode BOM function because a prepayment of the purchase order has been invoiced.';
        PO: Record "Purchase Header";
        PURCHLINE: Record "Purchase Line";
        ReqLine: Record "Purchase Line";
        ReqLine2: Record "Purchase Line";
        LineNo: Integer;
        Acct: Record "G/L Account";
        DocDim: Record "Dimension Set Entry";
        DocDim2: Record "Dimension Set Entry";


    procedure ApproveCalcInvDisc()
    begin
        Codeunit.Run(Codeunit::"Purch.-Disc. (Yes/No)", Rec);
    end;


    procedure CalcInvDisc()
    begin
        Codeunit.Run(Codeunit::"Purch.-Calc.Discount", Rec);
    end;


    procedure ExplodeBOM()
    begin
        if Rec."Prepmt. Amt. Inv." <> 0 then
            Error(Text001);
        Codeunit.Run(Codeunit::"Purch.-Explode BOM", Rec);
    end;


    procedure OpenSalesOrderForm()
    var
        SalesHeader: Record "Sales Header";
        SalesOrder: Page "Sales Order";
    begin
        Rec.TestField("Sales Order No.");
        SalesHeader.SetRange("No.", Rec."Sales Order No.");
        SalesOrder.SetTableview(SalesHeader);
        SalesOrder.Editable := false;
        SalesOrder.Run;
    end;


    procedure InsertExtendedText(Unconditionally: Boolean)
    begin
        if TransferExtendedText.PurchCheckIfAnyExtText(Rec, Unconditionally) then begin
            CurrPage.SaveRecord;
            TransferExtendedText.InsertPurchExtText(Rec);
        end;
        if TransferExtendedText.MakeUpdate then
            UpdateForm(true);
    end;


    procedure ShowTracking()
    var
        TrackingForm: Page "Order Tracking";
    begin
        TrackingForm.SetPurchLine(Rec);
        TrackingForm.RunModal;
    end;


    procedure OpenSpecOrderSalesOrderForm()
    var
        SalesHeader: Record "Sales Header";
        SalesOrder: Page "Sales Order";
    begin
        Rec.TestField("Special Order Sales No.");
        SalesHeader.SetRange("No.", Rec."Special Order Sales No.");
        SalesOrder.SetTableview(SalesHeader);
        SalesOrder.Editable := false;
        SalesOrder.Run;
    end;


    procedure UpdateForm(SetSaveRecord: Boolean)
    begin
        CurrPage.Update(SetSaveRecord);
    end;


    procedure SetUpdateAllowed(UpdateAllowed: Boolean)
    begin
        UpdateAllowedVar := UpdateAllowed;
    end;


    procedure UpdateAllowed(): Boolean
    begin
        if UpdateAllowedVar = false then begin
            Message(Text000);
            exit(false);
        end;
        exit(true);
    end;


    procedure ShowPrices()
    begin
        PurchHeader.Get(Rec."Document Type", Rec."Document No.");
        Clear(PurchPriceCalcMgt);
        PurchPriceCalcMgt.GetPurchLinePrice(PurchHeader, Rec);
    end;


    procedure ShowLineDisc()
    begin
        PurchHeader.Get(Rec."Document Type", Rec."Document No.");
        Clear(PurchPriceCalcMgt);
        PurchPriceCalcMgt.GetPurchLineLineDisc(PurchHeader, Rec);
    end;

    local procedure NoOnAfterValidate()
    begin
        InsertExtendedText(false);
        if (Rec.Type = Rec.Type::"Charge (Item)") and (Rec."No." <> xRec."No.") and
           (xRec."No." <> '')
        then
            CurrPage.SaveRecord;
    end;

    local procedure CrossReferenceNoOnAfterValidat()
    begin
        InsertExtendedText(false);
    end;
}

#pragma implicitwith restore

