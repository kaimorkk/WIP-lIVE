page 50458 "Expense Req. PRN Expenses"
{
    Caption = 'Expense PRN Expenses';
    PageType = List;
    SourceTable = "Expense Req. Allocation";
    UsageCategory = None;
    AutoSplitKey = true;
    SourceTableView = where(Type = const(PRN));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("ProcPlan Entry No."; "ProcPlan Entry No.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Proc Type"; "Proc Type")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("No."; "No.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Rate; Rate)
                {
                    Caption = 'Unit Cost';
                    ApplicationArea = Basic, Suite;
                }
                field(Total; Rec.Total)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total field.';
                }
                field("Expense Description"; Rec."Expense Description")
                {
                    Caption = 'Technical Specifications';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expense Description field.';
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Recalled By"; Rec."Recalled By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Recalled By field.';
                }
                field("Recalled On"; Rec."Recalled On")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Recalled On field.';
                }
                field("Source Line No."; Rec."Source Line No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Source Line No. field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Recall")
            {
                ApplicationArea = Basic, Suite;
                Visible = Rec.Status = Rec.Status::Committed;
                trigger OnAction()
                var
                    Committment: Codeunit Committment;
                begin
                    // if Confirm('Are you sure to recall commitments?', false) then
                    //     Committment.RecallExpRequisition(Rec.RecordId);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Recall_Promoted; Recall)
                {
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if ExpReqHeader.Get(ExpenseReqLine."Document No.") then begin
            ExpReqHeader.TestField("Procurement Plan ID");
            ExpReqHeader.TestField("Location Code");
            ExpReqHeader.TestField("PP Plan Category");
        end;

        Rec.Type := Rec.Type::PRN;
        Rec.Workplan := ExpenseReqLine.Workplan;
        Rec."Budget Code" := ExpenseReqline."Budget Code";
        Rec."Activity Id" := ExpenseReqLine."Activity Id";
        Rec."Global Dimension 1 Code" := ExpenseReqLine."Global Dimension 1 Code";
        Rec."Global Dimension 2 Code" := ExpenseReqLine."Global Dimension 2 Code";
        Rec."Shortcut Dimension 3 Code" := ExpenseReqLine."Shortcut Dimension 3 Code";
        Rec."Shortcut Dimension 4 Code" := ExpenseReqLine."Shortcut Dimension 4 Code";
        Rec."Shortcut Dimension 5 Code" := ExpenseReqLine."Shortcut Dimension 5 Code";
        Rec."Shortcut Dimension 6 Code" := ExpenseReqLine."Shortcut Dimension 6 Code";
        Rec."Shortcut Dimension 7 Code" := ExpenseReqLine."Shortcut Dimension 7 Code";
        Rec."Shortcut Dimension 8 Code" := ExpenseReqLine."Shortcut Dimension 8 Code";
        Rec."G/L Account" := ExpenseReqLine."G/L Account";
        Rec."Source Line No." := ExpenseReqLine."Line No.";
        Rec."Procurement Plan Id" := ExpReqHeader."Procurement Plan ID";
        Rec."PP Plan Category" := ExpReqHeader."PP Plan Category";
    end;

    var
        ExpenseReqLine: Record "Expense Requisition Line";
        ExpReqHeader: Record "Expense Requisition";

    procedure SetExpenseLine(ExpReqLine: Record "Expense Requisition Line")
    begin
        ExpenseReqLine := ExpReqLine;
    end;
}
