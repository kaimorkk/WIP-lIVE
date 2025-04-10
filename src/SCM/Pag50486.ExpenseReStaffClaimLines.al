page 50486 "Expense Re. SClaim Lines"
{
    Caption = 'Staff Claim Lines';
    PageType = List;
    SourceTable = "Expense Req. Allocation";
    UsageCategory = None;
    AutoSplitKey = true;
    SourceTableView = where(Type = const("Staff Claim"));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Employee No."; "Resource No.")
                {
                    Caption = 'Employee No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
                field("Vote Item"; "Vote Item")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rate field.';
                }
                field(Total; Rec.Total)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total field.';
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
        Rec.Type := Rec.Type::"Staff Claim";
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
        Rec."Source Line No." := ExpenseReqLine."Line No.";
        Rec."G/L Account" := ExpenseReqLine."G/L Account";
    end;

    var
        ExpenseReqLine: Record "Expense Requisition Line";

    procedure SetExpenseLine(ExpReqLine: Record "Expense Requisition Line")
    begin
        ExpenseReqLine := ExpReqLine;
    end;
}
