page 75322 "Invitation to Tender Subform"
{
    AutoSplitKey = true;
    Caption = 'Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Standard Sales Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Type; Type)
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies whether the line is for a general ledger account, item, resource, fixed asset or item charge.';

                    trigger OnValidate()
                    begin
                        TypeOnAfterValidate;
                    end;
                }
                field(FilteredTypeField; TypeAsText)
                {
                    ApplicationArea = Suite;
                    Caption = 'Type';
                    Editable = CurrPageIsEditable;
                    LookupPageID = "Option Lookup List";
                    TableRelation = "Option Lookup Buffer"."Option Caption" where("Lookup Type" = const(Sales));
                    ToolTip = 'Specifies whether the line is for a general ledger account, item, fixed asset or item charge.';
                    Visible = IsFoundation;

                    trigger OnValidate()
                    begin
                        // TempOptionLookupBuffer.SetCurrentType(Type);
                        // IF TempOptionLookupBuffer.AutoCompleteOption(TypeAsText,TempOptionLookupBuffer."Lookup Type"::Sales) THEN
                        //   VALIDATE(Type,TempOptionLookupBuffer.ID);
                        // TempOptionLookupBuffer.ValidateOption(TypeAsText);
                        // UpdateTypeText;
                        // TypeOnAfterValidate;
                    end;
                }
                field("No."; "No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of a general ledger account, item, resource, additional cost, or fixed asset, depending on the contents of the Type field.';

                    trigger OnValidate()
                    begin
                        if not ApplicationAreaMgmtFacade.IsFoundationEnabled then
                            exit;

                        if "No." = xRec."No." then
                            exit;

                        UpdateTypeText;
                    end;
                }
                field("Variant Code"; "Variant Code")
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies the variant of the item on the line.';
                    Visible = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a description of the entry, which is based on the contents of the Type and No. fields.';

                    trigger OnValidate()
                    begin
                        if Description = xRec.Description then
                            exit;

                        if "No." = '' then
                            Type := Type::" ";
                        UpdateTypeText;
                    end;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of units of the item on the line.';
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                    Visible = false;
                }
                field("Amount Excl. VAT"; "Amount Excl. VAT")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the net amount for the standard sales line. This field only applies to lines of type G/L Account and Charge (Item).';
                    Visible = false;
                }
                field("Disposal Type"; "Disposal Type")
                {
                    ApplicationArea = All;
                }
                field("Awarded Quote No"; "Awarded Quote No")
                {
                    ApplicationArea = All;
                }
                field("Sell to Customer No"; "Sell to Customer No")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; "Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Actual Unit Cost(LCY)"; "Actual Unit Cost(LCY)")
                {
                    ApplicationArea = All;
                }
                field("Actual Total Cost(LCY)"; "Actual Total Cost(LCY)")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action(Dimensions)
                {
                    AccessByPermission = TableData 348 = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Scope = Repeater;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        ShowDimensions;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPageIsEditable := CurrPage.EDITABLE;
    end;

    trigger OnAfterGetRecord()
    begin
        ShowShortcutDimCode(ShortcutDimCode);
        UpdateTypeText;
    end;

    trigger OnInit()
    begin
        // TempOptionLookupBuffer.FillBuffer(TempOptionLookupBuffer."Lookup Type"::Sales);
        IsFoundation := ApplicationAreaMgmtFacade.IsFoundationEnabled;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if ApplicationAreaMgmtFacade.IsAdvancedEnabled then
            Type := xRec.Type;

        if ApplicationAreaMgmtFacade.IsFoundationEnabled then
            Type := Type::Item;
        UpdateTypeText;

        CLEAR(ShortcutDimCode);
    end;

    trigger OnOpenPage()
    begin
        SetDimensionsVisibility;
    end;

    var
        TempOptionLookupBuffer: Record "Option Lookup Buffer" temporary;
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
        ShortcutDimCode: array[8] of Code[20];
        TypeAsText: Text[30];
        IsFoundation: Boolean;
        CurrPageIsEditable: Boolean;
        DimVisible1: Boolean;
        DimVisible2: Boolean;
        DimVisible3: Boolean;
        DimVisible4: Boolean;
        DimVisible5: Boolean;
        DimVisible6: Boolean;
        DimVisible7: Boolean;
        DimVisible8: Boolean;

    local procedure TypeOnAfterValidate()
    begin
        CLEAR(ShortcutDimCode);
    end;

    local procedure UpdateTypeText()
    var
        RecRef: RecordRef;
    begin
        RecRef.GETTABLE(Rec);
        TypeAsText := TempOptionLookupBuffer.FormatOption(RecRef.FIELD(FIELDNO(Type)));
    end;

    local procedure SetDimensionsVisibility()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimVisible1 := false;
        DimVisible2 := false;
        DimVisible3 := false;
        DimVisible4 := false;
        DimVisible5 := false;
        DimVisible6 := false;
        DimVisible7 := false;
        DimVisible8 := false;

        DimMgt.UseShortcutDims(
          DimVisible1, DimVisible2, DimVisible3, DimVisible4, DimVisible5, DimVisible6, DimVisible7, DimVisible8);

        CLEAR(DimMgt);
    end;
}

