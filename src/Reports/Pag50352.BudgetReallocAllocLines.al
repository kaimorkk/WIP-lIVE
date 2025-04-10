page 50352 "Budget Realloc. Alloc. Lines"
{
    Caption = 'Allocation Lines';
    SourceTable = "Budget Reallocation Line";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Quarter; Rec.Quarter)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field(Workplan; Rec.Workplan)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Workplan field.', Comment = '%';
                }
                field("G/L Account No"; Rec."G/L Account No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account No field.';
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account Name field.';
                }
                field("Shortuct Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortuct Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortuct Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortuct Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortuct Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Shortuct Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Current Balance"; Rec."Current Balance")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Current Balance field.';
                }
                field("Allocated Amount"; "Allocated Amount")
                {
                    Caption = 'Current Allocated Amount';
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("New Balance"; Rec."New Balance")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the New Balance field.';
                }
                field("New Allocated Amount"; Rec."Total Allocated")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                    Caption = 'New Allocated Amount';
                }
                field("Quarter Start Date"; Rec."Quarter Start Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Quarter End Date"; Rec."Quarter End Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Source Line No"; Rec."Source Line No")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    var
        BudgetReAllocationHeader: Record "Budget Reallocation Header";
    begin
        "Budget Code" := ReallocLine."Budget Code";
        Quarter := ReallocLine.Quarter;
        "Source Line No" := ReallocLine."Line No";
        "Document No." := ReallocLine."Document No";
        "ReAllocation Request" := ReallocLine."ReAllocation Request";
        Rec.Validate(Quarter);
    end;

    trigger OnAfterGetRecord()
    var
        Header: Record "Budget ReAllocation Header";
    begin
        Header.Reset();
        Header.SetRange("Document No", Rec."Document No.");
        if Header.FindFirst() then
            if Header."Approval Status" <> Header."Approval Status"::Open then
                CurrPage.Editable := false;
    end;

    trigger OnAfterGetCurrRecord()
    begin

    end;

    var
        ReallocLine: Record "Budget Modification Lines";

    procedure GetBudgetLines(BudgLine: Record "Budget Modification Lines")
    begin
        ReallocLine := BudgLine;
    end;

}
