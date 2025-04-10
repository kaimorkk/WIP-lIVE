page 50358 "Workplan Budget Lines"
{
    Caption = 'Budget Amounts';
    PageType = List;
    SourceTable = "Workplan Budget Line";
    DataCaptionFields = "Strategy Plan ID";
    RefreshOnActivate = true;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Budget Item"; Rec."Budget Item")
                {
                    ApplicationArea = All;
                    ToolTip = 'If you cannot see your budget item here then contact finance to make it available for workplanning.';
                }
                field("Budget Item Description"; Rec."Budget Item Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Item Description field.';
                }
                field("Shorcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shorcut Dimension 3 Code field.';
                }
                field("Shorcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shorcut Dimension 4 Code field.';
                }
                field("Shorcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shorcut Dimension 5 Code field.';
                }
                field("Shorcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shorcut Dimension 6 Code field.';
                }
                field("Q1 Quantity"; "Q1 Quantity")
                {
                    ApplicationArea = Basic, Suite;
                    //Editable = false;
                }
                field("Q1 Unit Amount"; "Q1 Unit Amount")
                {
                    ApplicationArea = Basic, Suite;
                    //Editable = false;
                }
                field("Q1 Amount"; Rec."Q1 Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Q1 Amount field.';
                }
                field("Q2 Quantity"; "Q2 Quantity")
                {
                    ApplicationArea = Basic, Suite;
                    //Editable = false;
                }
                field("Q2 Unit Amount"; "Q2 Unit Amount")
                {
                    ApplicationArea = Basic, Suite;
                    //Editable = false;
                }
                field("Q2 Amount"; Rec."Q2 Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Q2 Amount field.';
                }
                field("Q3 Quantity"; "Q3 Quantity")
                {
                    ApplicationArea = Basic, Suite;
                    //Editable = false;
                }
                field("Q3 Unit Amount"; "Q3 Unit Amount")
                {
                    ApplicationArea = Basic, Suite;
                    //Editable = false;
                }
                field("Q3 Amount"; Rec."Q3 Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Q3 Amount field.';
                }
                field("Q4 Quantity"; "Q4 Quantity")
                {
                    ApplicationArea = Basic, Suite;
                    //Editable = false;
                }
                field("Q4 Unit Amount"; "Q4 Unit Amount")
                {
                    ApplicationArea = Basic, Suite;
                    //Editable = false;
                }
                field("Q4 Amount"; Rec."Q4 Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Q4 Amount field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Total Item Amount"; Rec."Total Item Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Item Amount field.', Comment = '%';
                }
                field("Total Ceiling"; Rec."Total Ceiling")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Ceiling field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Workings")
            {
                ApplicationArea = Basic, Suite;
                Image = LedgerBudget;
                trigger OnAction()
                var
                    Workings: Record "Workplan Workings";
                    WorkPlanBudgetLines: Page Workings;
                    AnnualStrategy: Record "Annual Strategy Workplan";
                begin

                    Workings.Reset;
                    Workings.SetRange("Strategy Plan ID", "Strategy Plan ID");
                    Workings.SetRange("KRA ID", "KRA ID");
                    Workings.SetRange("Core Strategy ID", "Core Strategy ID");
                    Workings.SetRange("Strategy ID", "Strategy ID");
                    Workings.SetRange("Activity ID", "Activity Id");
                    Workings.SetRange("Input Line No.", "Input Line No.");
                    Workings.SetRange("Budget Item", "Budget Item");
                    Workings.SetRange("Line No.", "Line No.");

                    Clear(WorkPlanBudgetLines);
                    WorkPlanBudgetLines.SetTableView(Workings);
                    WorkPlanBudgetLines.Run();

                    Commit();

                    CurrPage.Update();
                end;
            }

        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Workings_Promoted; Workings)
                {
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        Header: Record "Annual Strategy Workplan";
    begin
        Header.Reset();
        Header.SetRange(No, Rec.GetFilter("Strategy Plan ID"));
        if Header.FindFirst() then begin
            if Header."Approval Status" <> Header."Approval Status"::Open then
                CurrPage.Editable := false;
        end;
    end;
}
