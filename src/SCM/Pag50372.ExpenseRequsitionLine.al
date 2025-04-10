page 50372 "Expense Requsition Line"
{
    Caption = 'Expense Requsition Line';
    PageType = ListPart;
    SourceTable = "Expense Requisition Line";
    // AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Resource Req. No."; "Resource Req. No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Activity Id"; "Activity Id")
                {
                    ApplicationArea = all;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the G/L Account Name field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 8 Code field.';
                }
                field("Budget Allocation"; Rec."Budget Allocation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Allocation field.';
                }
                field("Budget Balance"; Rec."Budget Balance")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Available Balance';
                }
                field("Total Committments"; Rec."Total Committments")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Committments field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Total Allocation"; Rec."Total Allocation")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Error; Rec.Error)
                {
                    ApplicationArea = Basic, Suite;
                    StyleExpr = 'Attention';
                }
                field("Error Message"; Rec."Error Message")
                {
                    ApplicationArea = Basic, Suite;
                    StyleExpr = 'Attention';
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
            }
        }
    }
    actions
    {
        area(processing)
        {
            group(Process)
            {
                action(RecallLines)
                {
                    Caption = 'Recall';
                    ApplicationArea = Basic, Suite;
                    Enabled = Rec.Status = Rec.Status::Committed;
                    trigger OnAction()
                    var
                        Committment: Codeunit Committment;
                    begin
                        // if Confirm('Are you sure to recall commitments?', false) then
                        //     Committment.RecallExpRequisition(Rec.RecordId);
                    end;
                }
            }
            group(Imprest)
            {
                action(Impr)
                {
                    Visible = (Rec."Requires Imprest");
                    Caption = 'Imprest';
                    ApplicationArea = Basic, Suites;
                    Image = Employee;
                    trigger OnAction()
                    var
                        ExpenseReqImpLines: Page "Expense Re. Imprest Lines";
                        ExpenseReqAllocationLine: Record "Expense Req. Allocation";
                    begin
                        ExpenseReqAllocationLine.Reset;
                        ExpenseReqAllocationLine.SetRange("Document No.", Rec."Document No.");
                        ExpenseReqAllocationLine.SetRange(Type, ExpenseReqAllocationLine.Type::Imprest);
                        ExpenseReqAllocationLine.SetRange("Source Line No.", "Line No.");
                        Clear(ExpenseReqImpLines);
                        ExpenseReqImpLines.SetTableView(ExpenseReqAllocationLine);
                        ExpenseReqImpLines.Editable := CurrPage.Editable;
                        ExpenseReqImpLines.SetExpenseLine(Rec);
                        ExpenseReqImpLines.Run();
                    end;
                }
            }
            group("StaffClaim")
            {
                Caption = 'Staff Claim';
                action(SClaim)
                {
                    Visible = (Rec."Requires Direct Payment" and (Rec."Direct Payment Type" = Rec."Direct Payment Type"::"Staff Claim"));
                    Caption = 'Staff Claim';
                    ApplicationArea = Basic, Suites;
                    Image = Employee;
                    trigger OnAction()
                    var
                        ExpenseReqSClaimLines: Page "Expense Re. SClaim Lines";
                        ExpenseReqAllocationLine: Record "Expense Req. Allocation";
                    begin
                        ExpenseReqAllocationLine.Reset;
                        ExpenseReqAllocationLine.SetRange("Document No.", Rec."Document No.");
                        ExpenseReqAllocationLine.SetRange(Type, ExpenseReqAllocationLine.Type::"Staff Claim");
                        ExpenseReqAllocationLine.SetRange("Source Line No.", "Line No.");
                        Clear(ExpenseReqSClaimLines);
                        ExpenseReqSClaimLines.SetTableView(ExpenseReqAllocationLine);
                        ExpenseReqSClaimLines.Editable := CurrPage.Editable;
                        ExpenseReqSClaimLines.SetExpenseLine(Rec);
                        ExpenseReqSClaimLines.Run();
                    end;
                }
            }
            group("Direct Expense")
            {
                action(DExpenses)
                {
                    Visible = Rec."Requires Direct Payment" and (Rec."Direct Payment Type" = Rec."Direct Payment Type"::"Non Staff Claim");
                    Caption = 'Direct Expenses';
                    ApplicationArea = Basic, Suite;
                    Image = SuggestVendorPayments;
                    trigger OnAction()
                    var
                        DirectPaymentLines: Page "Expense Req. Direct Expenses";
                        ExpenseReqAllocationLine: Record "Expense Req. Allocation";
                    begin
                        ExpenseReqAllocationLine.Reset;
                        ExpenseReqAllocationLine.SetRange("Document No.", Rec."Document No.");
                        ExpenseReqAllocationLine.SetRange(Type, ExpenseReqAllocationLine.Type::"Direct Expense");
                        ExpenseReqAllocationLine.SetRange("Source Line No.", "Line No.");
                        Clear(DirectPaymentLines);
                        DirectPaymentLines.SetTableView(ExpenseReqAllocationLine);
                        DirectPaymentLines.Editable := CurrPage.Editable;
                        DirectPaymentLines.SetExpenseLine(Rec);
                        DirectPaymentLines.Run();
                    end;
                }
            }
            group("Purchase Requisition")
            {
                Caption = 'Purchase Requisition';
                action(DPRNExpense)
                {
                    Visible = Rec."Requires PRN";
                    Caption = 'Purchase Requisition';
                    ApplicationArea = Basic, Suite;
                    Image = NewPurchaseInvoice;
                    trigger OnAction()
                    var
                        DirectPaymentLines: Page "Expense Req. PRN Expenses";
                        ExpenseReqAllocationLine: Record "Expense Req. Allocation";
                    begin
                        ExpenseReqAllocationLine.Reset;
                        ExpenseReqAllocationLine.SetRange("Document No.", Rec."Document No.");
                        ExpenseReqAllocationLine.SetRange(Type, ExpenseReqAllocationLine.Type::PRN);
                        ExpenseReqAllocationLine.SetRange("Source Line No.", "Line No.");
                        ExpenseReqAllocationLine.SetRange("Procurement Plan Id", rec."Procurement Plan");
                        ExpenseReqAllocationLine.SetRange("Budget Code", Rec."Budget Code");
                        ExpenseReqAllocationLine.SetRange("G/L Account", Rec."G/L Account");
                        Clear(DirectPaymentLines);
                        DirectPaymentLines.SetTableView(ExpenseReqAllocationLine);
                        DirectPaymentLines.Editable := CurrPage.Editable;
                        DirectPaymentLines.SetExpenseLine(Rec);
                        DirectPaymentLines.Run();
                    end;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
        ExpReq: Record "Expense Requisition";
    begin


    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        ExpReq: Record "Expense Requisition";
    begin
        // if ExpReq.Get("Document No.") then begin
        //     Rec.Workplan := ExpReq.Workplan;
        //     Rec."Budget Code" := ExpReq."Budget Code";
        //     Rec."Activity Id" := ExpReq."Activity Code";
        //     Rec."Global Dimension 1 Code" := ExpReq."Global Dimension 1 Code";
        //     Rec."Global Dimension 2 Code" := ExpReq."Global Dimension 2 Code";
        //     Rec."Requires Direct Payment" := ExpReq."Requires Direct Payment";
        //     Rec."Requires Imprest" := ExpReq."Requires Imprest";
        //     Rec."Requires PRN" := ExpReq."Requires PRN";
        // end;
    end;

    var
        ImprestVisible, DirectExpenseVisible : Boolean;
        GlobalExpReq: Record "Expense Requisition";
        PRNVisible: Boolean;
}
