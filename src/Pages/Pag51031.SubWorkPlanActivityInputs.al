page 51031 "SubWorkPlan Activity Inputs"
{
    Caption = 'Inputs';
    PageType = List;
    SourceTable = "SubWorkPlan Activity Inputs";
    UsageCategory = None;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Activity Id"; "Activity Id")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No field.', Comment = '%';
                }
                field("Activity Description"; "Activity Description")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Input';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Quarter One Budget"; Rec."Quarter One Budget")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quarter One Budget field.';
                    Editable = false;
                }
                field("Quarter Two Budget"; Rec."Quarter Two Budget")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quarter Two Budget field.';
                    Editable = false;
                }
                field("Quarter Three Budget"; Rec."Quarter Three Budget")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quarter Three Budget field.';
                    Editable = false;
                }
                field("Quarter Four Budget"; Rec."Quarter Four Budget")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quarter Four Budget field.';
                    Editable = false;
                }
                field("Total Budget"; Rec."Total Budget")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Budget field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Budget Amounts")
            {
                ApplicationArea = Basic, Suite;
                Image = LedgerBudget;
                trigger OnAction()
                var
                    WorkplanBudgets: Record "Workplan Budget Line";
                    WorkPlanBudgetLines: Page "Workplan Budget Lines";
                    AnnualStrategy: Record "Annual Strategy Workplan";
                begin
                    if AnnualStrategy.Get("Workplan No.") then begin
                        AnnualStrategy.TestField("Global Dimension 1 Code");
                        AnnualStrategy.TestField("Global Dimension 2 Code");
                    end;

                    WorkplanBudgets.Reset;
                    WorkplanBudgets.SetRange("Strategy Plan ID", "Workplan No.");
                    WorkplanBudgets.SetRange("KRA ID", "KRA ID");
                    WorkplanBudgets.SetRange("Core Strategy ID", "Core Strategy ID");
                    WorkplanBudgets.SetRange("Strategy ID", "Strategy ID");
                    WorkplanBudgets.SetRange("Activity ID", "Activity Id");
                    WorkplanBudgets.SetRange("Input Line No.", "Line No.");

                    Clear(WorkPlanBudgetLines);
                    WorkPlanBudgetLines.SetTableView(WorkplanBudgets);
                    WorkPlanBudgetLines.Run();

                    Commit();

                    CurrPage.Update();
                end;
            }
            action(Comments)
            {
                ApplicationArea = Basic;
                Image = ViewComments;
                trigger OnAction()
                var
                    BudgetComments: Record "Budget Comment";
                begin
                    BudgetComments.ShowComments(Rec.RecordId, true);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Budget Amounts_Promoted"; "Budget Amounts")
                {
                }
                actionref(Comments_Promoted; Comments)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        AWP: Record "Annual Strategy Workplan";
        Activity: Record "Workplan Activity";
    begin
        Activity.Reset();
        Activity.SetRange("Strategic Plan ID", Rec."Workplan No.");
        Activity.SetRange(Code, Rec."Activity Id");
        if Activity.FindFirst() then
            Rec."Activity Description" := Activity.Descriptions;
    end;

    trigger OnOpenPage()
    var
        Header: Record "Annual Strategy Workplan";
    begin
        Header.Reset();
        Header.SetRange(No, Rec."Workplan No.");
        if Header.FindFirst() then begin
            if Header."Approval Status" <> Header."Approval Status"::Open then
                CurrPage.Editable := false;
        end;
    end;
}
