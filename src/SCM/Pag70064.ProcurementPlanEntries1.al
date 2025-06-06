

page 70064 "Procurement Plan Entries1"
{
    AdditionalSearchTerms = 'general ledger budget entries';
    Caption = 'Procurement Plan Entries';
    DataCaptionFields = "G/L Account No.", "Budget Name";
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Procurement Plan Entry1";
    UsageCategory = History;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = Suite;
                    Editable = false;
                    ToolTip = 'Specifies the name of the G/L budget that the entry belongs to.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the date of the budget entry.';
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of the G/L account that the budget entry applies to, or, the account on the line where the budget figure has been entered.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a description of the budget figure.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    Enabled = GlobalDimension1CodeEnable;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    Visible = GlobalDimension1CodeVisible;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    Enabled = GlobalDimension2CodeEnable;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    Visible = GlobalDimension2CodeVisible;
                }
                field("Budget Dimension 1 Code"; Rec."Budget Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    Enabled = BudgetDimension1CodeEnable;
                    ToolTip = 'Specifies the dimension value code for the Budget Dimension 1 Code the budget entry is linked to.';
                    Visible = BudgetDimension1CodeVisible;
                }
                field("Budget Dimension 2 Code"; Rec."Budget Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    Enabled = BudgetDimension2CodeEnable;
                    ToolTip = 'Specifies the dimension value code for the Budget Dimension 2 Code the budget entry is linked to.';
                    Visible = BudgetDimension2CodeVisible;
                }
                field("Budget Dimension 3 Code"; Rec."Budget Dimension 3 Code")
                {
                    ApplicationArea = Dimensions;
                    Enabled = BudgetDimension3CodeEnable;
                    ToolTip = 'Specifies the dimension value code for the Budget Dimension 3 Code the budget entry is linked to.';
                    Visible = BudgetDimension3CodeVisible;
                }
                field("Budget Dimension 4 Code"; Rec."Budget Dimension 4 Code")
                {
                    ApplicationArea = Dimensions;
                    Enabled = BudgetDimension4CodeEnable;
                    ToolTip = 'Specifies the dimension value code for the Budget Dimension 4 Code the budget entry is linked to.';
                    Visible = BudgetDimension4CodeVisible;
                }
                field("Business Unit Code"; Rec."Business Unit Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the code for the business unit that the budget entry is linked to.';
                    Visible = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the amount of the budget entry.';
                }
                field("Budget Type"; Rec."Budget Type")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies a reference to a combination of dimension values. The actual values are stored in the Dimension Set Entry table.';
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ent&ry")
            {
                Caption = 'Ent&ry';
                Image = Entry;
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDimensions;
                        CurrPage.SaveRecord;
                    end;
                }
                action(SetDimensionFilter)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Set Dimension Filter';
                    Ellipsis = true;
                    Image = "Filter";
                    ToolTip = 'Limit the entries according to the dimension filters that you specify. NOTE: If you use a high number of dimension combinations, this function may not work and can result in a message that the SQL server only supports a maximum of 2100 parameters.';

                    trigger OnAction()
                    begin
                        Rec.SetFilter("Dimension Set ID", DimensionSetIDFilter.LookupFilter);
                    end;
                }
            }
        }
    }

    trigger OnClosePage()
    var
        UpdateAnalysisView: Codeunit "Update Analysis View";
    begin
        if LowestModifiedEntryNo < 2147483647 then
            UpdateAnalysisView.SetLastBudgetEntryNo(LowestModifiedEntryNo - 1);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if Rec."Entry No." < LowestModifiedEntryNo then
            LowestModifiedEntryNo := Rec."Entry No.";
        exit(IsEditable);
    end;

    trigger OnInit()
    begin
        BudgetDimension4CodeEnable := true;
        BudgetDimension3CodeEnable := true;
        BudgetDimension2CodeEnable := true;
        BudgetDimension1CodeEnable := true;
        GlobalDimension2CodeEnable := true;
        GlobalDimension1CodeEnable := true;
        BudgetDimension4CodeVisible := true;
        BudgetDimension3CodeVisible := true;
        BudgetDimension2CodeVisible := true;
        BudgetDimension1CodeVisible := true;
        GlobalDimension2CodeVisible := true;
        GlobalDimension1CodeVisible := true;
        LowestModifiedEntryNo := 2147483647;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Entry No." < LowestModifiedEntryNo then
            LowestModifiedEntryNo := Rec."Entry No.";
        exit(true);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if Rec.GetFilter("Budget Name") <> '' then
            Rec."Budget Name" := Rec.GetRangeMin("Budget Name");
        if GLBudgetName.No <> Rec."Budget Name" then
            GLBudgetName.Get(Rec."Budget Name");
        if Rec.GetFilter("G/L Account No.") <> '' then
            Rec."G/L Account No." := GetFirstGLAcc(Rec.GetFilter("G/L Account No."));
        Rec.Date := GetFirstDate(Rec.GetFilter(Date));
        Rec."User ID" := UserId;

        if Rec.GetFilter("Global Dimension 1 Code") <> '' then
            Rec."Global Dimension 1 Code" :=
            GetFirstDimValue(GLSetup."Global Dimension 1 Code", Rec.GetFilter("Global Dimension 1 Code"));

        if Rec.GetFilter("Global Dimension 2 Code") <> '' then
            Rec."Global Dimension 2 Code" :=
            GetFirstDimValue(GLSetup."Global Dimension 2 Code", Rec.GetFilter("Global Dimension 2 Code"));
        /*
    IF GETFILTER("Budget Dimension 1 Code") <> '' THEN
      "Budget Dimension 1 Code" :=
        GetFirstDimValue(GLBudgetName."Budget Dimension 1 Code",GETFILTER("Budget Dimension 1 Code"));

    IF GETFILTER("Budget Dimension 2 Code") <> '' THEN
      "Budget Dimension 2 Code" :=
        GetFirstDimValue(GLBudgetName."Budget Dimension 2 Code",GETFILTER("Budget Dimension 2 Code"));

    IF GETFILTER("Budget Dimension 3 Code") <> '' THEN
      "Budget Dimension 3 Code" :=
        GetFirstDimValue(GLBudgetName."Budget Dimension 3 Code",GETFILTER("Budget Dimension 3 Code"));

    IF GETFILTER("Budget Dimension 4 Code") <> '' THEN
      "Budget Dimension 4 Code" :=
        GetFirstDimValue(GLBudgetName."Budget Dimension 4 Code",GETFILTER("Budget Dimension 4 Code"));
        */
        if Rec.GetFilter("Business Unit Code") <> '' then
            Rec."Business Unit Code" := GetFirstBusUnit(Rec.GetFilter("Business Unit Code"));

    end;

    trigger OnOpenPage()
    var
        GLBudgetName: Record "Procurement Header";
    begin
        if Rec.GetFilter("Budget Name") = '' then
            GLBudgetName.Init
        else begin
            Rec.Copyfilter("Budget Name", GLBudgetName.No);
            GLBudgetName.FindFirst;
        end;
        CurrPage.Editable := not IsEditable;
        GLSetup.Get;
        GlobalDimension1CodeEnable := GLSetup."Global Dimension 1 Code" <> '';
        GlobalDimension2CodeEnable := GLSetup."Global Dimension 2 Code" <> '';
        /*BudgetDimension1CodeEnable := GLBudgetName."Budget Dimension 1 Code" <> '';
        BudgetDimension2CodeEnable := GLBudgetName."Budget Dimension 2 Code" <> '';
        BudgetDimension3CodeEnable := GLBudgetName."Budget Dimension 3 Code" <> '';
        BudgetDimension4CodeEnable := GLBudgetName."Budget Dimension 4 Code" <> '';
        GlobalDimension1CodeVisible := GLSetup."Global Dimension 1 Code" <> '';
        GlobalDimension2CodeVisible := GLSetup."Global Dimension 2 Code" <> '';
        BudgetDimension1CodeVisible := GLBudgetName."Budget Dimension 1 Code" <> '';
        BudgetDimension2CodeVisible := GLBudgetName."Budget Dimension 2 Code" <> '';
        BudgetDimension3CodeVisible := GLBudgetName."Budget Dimension 3 Code" <> '';
        BudgetDimension4CodeVisible := GLBudgetName."Budget Dimension 4 Code" <> '';*/

    end;

    var
        GLSetup: Record "General Ledger Setup";
        GLBudgetName: Record "Procurement Header";
        DimensionSetIDFilter: Page "Dimension Set ID Filter";
        LowestModifiedEntryNo: Integer;

        GlobalDimension1CodeVisible: Boolean;

        GlobalDimension2CodeVisible: Boolean;

        BudgetDimension1CodeVisible: Boolean;

        BudgetDimension2CodeVisible: Boolean;

        BudgetDimension3CodeVisible: Boolean;

        BudgetDimension4CodeVisible: Boolean;

        GlobalDimension1CodeEnable: Boolean;

        GlobalDimension2CodeEnable: Boolean;

        BudgetDimension1CodeEnable: Boolean;

        BudgetDimension2CodeEnable: Boolean;

        BudgetDimension3CodeEnable: Boolean;

        BudgetDimension4CodeEnable: Boolean;
        IsEditable: Boolean;

    local procedure GetFirstGLAcc(GLAccFilter: Text[250]): Code[20]
    var
        GLAcc: Record "G/L Account";
    begin
        with GLAcc do begin
            SetFilter("No.", GLAccFilter);
            if FindFirst then
                exit("No.");

            exit('');
        end;
    end;

    local procedure GetFirstDate(DateFilter: Text[250]): Date
    var
        Period: Record Date;
    begin
        if DateFilter = '' then
            exit(0D);
        with Period do begin
            SetRange("Period Type", "period type"::Date);
            SetFilter("Period Start", DateFilter);
            if FindFirst then
                exit("Period Start");

            exit(0D);
        end;
    end;

    local procedure GetFirstDimValue(DimCode: Code[20]; DimValFilter: Text[250]): Code[20]
    var
        DimVal: Record "Dimension Value";
    begin
        if (DimCode = '') or (DimValFilter = '') then
            exit('');
        with DimVal do begin
            SetRange("Dimension Code", DimCode);
            SetFilter(Code, DimValFilter);
            if FindFirst then
                exit(Code);

            exit('');
        end;
    end;

    local procedure GetFirstBusUnit(BusUnitFilter: Text[250]): Code[20]
    var
        BusUnit: Record "Business Unit";
    begin
        with BusUnit do begin
            SetFilter(Code, BusUnitFilter);
            if FindFirst then
                exit(Code);

            exit('');
        end;
    end;

    procedure SetEditable(NewIsEditable: Boolean)
    begin
        IsEditable := NewIsEditable;
    end;
}

#pragma implicitwith restore

