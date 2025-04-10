page 75238 "Purchase Requisition Lines"
{
    AutoSplitKey = true;
    Caption = 'Lines';
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "Purchase Line";
    SourceTableView = where("Document Type" = filter("Purchase Requisition"));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(ProcurementPlanID; "Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type; "Requisition Product Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Type';
                }
                field(ProcurementPlanItemNo; "Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Plan Item No';
                }
                field(Control6; Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ShowMandatory = true;
                    Visible = true;

                    trigger OnValidate()
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate;
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Line Description';
                    Editable = false;
                    ShowMandatory = true;
                }
                field(TechnicalSpecifications; "Technical Specifications")
                {
                    ApplicationArea = Basic;
                }
                field(UnitofMeasureCode; "Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                }
                field(QuantityInStore; "Quantity In Store")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Direct Unit Cost Inc. VAT"; Rec."Direct Unit Cost Inc. VAT")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Direct Unit Cost Inc. VAT field.';
                }
                // field(DirectUnitCostInclVAT; "Direct Unit Cost")
                // {
                //     ApplicationArea = Basic;
                //     BlankZero = true;
                //     Caption = 'Direct Unit Cost Incl VAT';
                //     Editable = true;

                //     trigger OnValidate()
                //     begin
                //         //TESTFIELD(Quantity);
                //         //IF "Available Funds"<"Line Amount" THEN
                //         //ERROR(Text002,"Available Funds");
                //     end;
                // }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                    Editable = AmountEditable;
                }
                field(AmountIncludingVAT; "Amount Including VAT")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(LocationCode; "Location Code")
                {
                    ApplicationArea = Basic;
                }
                field(UnitCostLCY; "Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(VATProdPostingGroup; "VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                // field(VAT; "VAT %")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                // field(VariantCode; "Variant Code")
                // {
                //     ApplicationArea = Basic;
                // }
                field(ItemCategoryCode; "Item Category Code")
                {
                    ApplicationArea = Basic;
                }

                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field(Budget; Rec.Budget)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Financial Budget field.';
                }
                field("Budget Line"; Rec."Budget Line")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Line field.';
                }
                field(PPTotalAvailableBudget; "PP Total Available Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field(PPFundingSourceID; "PP Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field(PPTotalBudget; "PP Total Budget")
                {
                    ApplicationArea = Basic;
                }
                field(PPTotalActualCosts; "PP Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                field(PPTotalCommitments; "PP Total Commitments")
                {
                    ApplicationArea = Basic;
                }

                field(PPSolicitationType; "PP Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field(PPProcurementMethod; "PP Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field(PPPreferenceReservationCode; "PP Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field(PRNConversionProcedure; "PRN Conversion Procedure")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requistion Conversion';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = '&Line';
                Image = Line;
                group(ItemAvailabilityby)
                {
                    Caption = 'Item Availability by';
                    Image = ItemAvailability;
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        ShowDimensions;
                    end;
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;

                    trigger OnAction()
                    begin
                        ShowLineComments;
                    end;
                }
                action(ItemChargeAssignment)
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Charge &Assignment';

                    trigger OnAction()
                    begin
                        ShowItemChargeAssgnt;
                    end;
                }
            }
            group(Functions)
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(ExplodeBOM1)
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xplode BOM';
                    Image = ExplodeBOM;

                    trigger OnAction()
                    begin
                        ExplodeBOM;
                    end;
                }
                action("Insert Ext. Texts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Insert &Ext. Texts';
                    Image = Text;

                    trigger OnAction()
                    begin
                        InsertExtendedText(true);
                    end;
                }
                action(Reserve)
                {
                    ApplicationArea = Basic;
                    Caption = '&Reserve';
                    Ellipsis = true;
                    Image = Reserve;

                    trigger OnAction()
                    begin
                        Find;
                        ShowReservation;
                    end;
                }
                action(OrderTracking)
                {
                    ApplicationArea = Basic;
                    Caption = 'Order &Tracking';
                    Image = OrderTracking;

                    trigger OnAction()
                    begin
                        ShowTracking;
                    end;
                }
            }
            group("Order")
            {
                Caption = 'O&rder';
                Image = "Order";
                group(DropShipment)
                {
                    Caption = 'Dr&op Shipment';
                    Image = Delivery;
                    action(SalesOrder)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Sales &Order';
                        Image = Document;

                        trigger OnAction()
                        begin
                            OpenSalesOrderForm;
                        end;
                    }
                }
                group(SpecialOrder)
                {
                    Caption = 'Speci&al Order';
                    Image = SpecialOrder;
                    action(Action1901038504)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Sales &Order';
                        Image = Document;

                        trigger OnAction()
                        begin
                            OpenSpecOrderSalesOrderForm;
                        end;
                    }
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnDeleteRecord(): Boolean
    var
        ReservePurchLine: Codeunit "Purch. Line-Reserve";
    begin
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        InitType;
        Clear(ShortcutDimCode);
        // IF "Document Type"="Document Type"::"Purchase Requisition" THEN BEGIN
        // PurchHeader.RESET;
        // PurchHeader.SETRANGE("No.","Document No.");
        // PurchHeader.SETRANGE("Document Type",Rec."Document Type"::"Purchase Requisition");
        //  "Procurement Plan ID":=PurchHeader."Procurement Plan ID";
        // "PP Planning Category":=PurchHeader."PP Planning Category";
        // MODIFY(TRUE);
        //  END;
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
        Text002: label 'The Amount Requested is more than the available funds.The available funds are Kshs. %1';
        "----------Editable.............................................................": Integer;
        AmountEditable: Boolean;
        LineAmountEditable: Boolean;
        QuantityEditable: Boolean;
        DirectAmtEditable: Boolean;
        FillItem: Boolean;
        FillService: Boolean;
    // Planitems: Record UnknownRecord70008;


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
        if "Prepmt. Amt. Inv." <> 0 then
            Error(Text001);
        Codeunit.Run(Codeunit::"Purch.-Explode BOM", Rec);
    end;


    procedure OpenSalesOrderForm()
    var
        SalesHeader: Record "Sales Header";
        SalesOrder: Page "Sales Order";
    begin
        TestField("Sales Order No.");
        SalesHeader.SetRange("No.", "Sales Order No.");
        SalesOrder.SetTableview(SalesHeader);
        SalesOrder.Editable := false;
        SalesOrder.Run;
    end;


    procedure InsertExtendedText(Unconditionally: Boolean)
    begin
    end;


    procedure ShowTracking()
    var
        TrackingForm: Page "Order Tracking";
    begin
    end;


    procedure OpenSpecOrderSalesOrderForm()
    var
        SalesHeader: Record "Sales Header";
        SalesOrder: Page "Sales Order";
    begin
        TestField("Special Order Sales No.");
        SalesHeader.SetRange("No.", "Special Order Sales No.");
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
    end;


    procedure ShowLineDisc()
    begin
    end;

    local procedure NoOnAfterValidate()
    begin
        InsertExtendedText(false);
        if (Type = Type::"Charge (Item)") and ("No." <> xRec."No.") and
           (xRec."No." <> '')
        then
            CurrPage.SaveRecord;
    end;

    local procedure CrossReferenceNoOnAfterValidat()
    begin
        InsertExtendedText(false);
    end;
}

