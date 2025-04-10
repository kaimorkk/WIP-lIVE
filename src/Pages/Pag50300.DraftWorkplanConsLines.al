page 50300 "Draft Workplan Cons Lines"
{
    Caption = 'Consolidation Lines';
    PageType = ListPart;
    SourceTable = "Annual Strategy Workplan";
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Select; Select)
                {
                    ApplicationArea = Basic, Suite;

                }
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No field.';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                    Editable = false;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                    Editable = false;
                    Visible = false;
                }
                field("Year Reporting Code"; Rec."Year Reporting Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Year Reporting Code field.';
                    Editable = false;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                    Editable = false;
                }
                field(Quarter1Amount; QuarterAmount[1])
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Caption = 'Quarter One Amount';
                }
                field(Quarter2Amount; QuarterAmount[2])
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Caption = 'Quarter Two Amount';
                }
                field(Quarter3Amount; QuarterAmount[3])
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Caption = 'Quarter Three Amount';
                }
                field(Quarter4Amount; QuarterAmount[4])
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Caption = 'Quarter Four Amount';
                }
                field(Quarter5Amount; QuarterAmount[5])
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Caption = 'Total Amount';
                }
                field("Ceiling Amount"; "Ceiling Amount")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = SendForReviewEnabled;
                }
                field("Supplementary Ceiling"; Rec."Supplementary Ceiling")
                {
                    ApplicationArea = All;
                    Caption = 'Supplementary Ceiling Amount';

                    ToolTip = 'Specifies the value of the Supplementary Ceiling field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group("Plan")
            {
                action("Open Card")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Card;
                    RunObject = Page "Draft Workplan Card";
                    RunPageLink = No = field(No);
                    RunPageMode=View;
                }
                action("Send for Review")
                {
                    ApplicationArea = Basic, Suite;
                    Image = ReviewWorksheet;
                    Enabled = SendForReviewEnabled;
                    trigger OnAction()
                    var
                        WorkPlanMgt: Codeunit "Workplan Management";
                        Workplan: Record "Annual Strategy Workplan";
                    begin
                        if Confirm('Are you sure to Send selected draft workplans for review?', false) then begin
                            Workplan.Reset;
                            Workplan.Setrange(Select, true);
                            Workplan.SetFilter("Planning Budget Type", '=%1|%2', Workplan."Planning Budget Type"::Supplementary, Workplan."Planning Budget Type"::"Supplementary 2");
                            Workplan.Setrange("Annual Workplan", BudgConsolidationHeader.Code);
                            Workplan.Setrange("Under Review", false);
                            Workplan.Setrange(Consolidated, true);
                            if Workplan.Findset() then begin
                                repeat
                                    WorkPlanMgt.SendDraftWorkPlanForReview(WorkPlan);
                                until WorkPlan.Next() = 0;
                            end;
                            Currpage.Update();
                        end;
                    end;
                }
                action("Comments")
                {
                    ApplicationArea = Basic, Suite;
                    Image = ViewComments;
                    Caption = 'Review Comments';
                    trigger OnAction()
                    var
                        BudgetComments: Record "Budget Comment";
                    begin
                        BudgetComments.ShowComments(Rec.RecordId, true);
                    end;
                }
                action("JSC Comments")
                {
                    ApplicationArea = Basic, Suite;
                    Image = ViewComments;
                    Caption = 'JSC Comments';
                    trigger OnAction()
                    var
                        BudgetComments: Record "Budget Comment";
                    begin
                        BudgetComments.ShowJSCComments(Rec.RecordId, true);
                    end;
                }
            }
        }
    }

    var
        QuarterAmount: array[5] of Decimal;
        SendForReviewEnabled: Boolean;
        BudgConsolidationHeader: Record "Budget Consolidation Header";

    trigger OnAfterGetRecord()
    begin
        Rec.GetBudgetAmount(QuarterAmount);
        if BudgConsolidationHeader.Get(Rec."Annual Workplan") then;
    end;

    procedure SetSendForReview(IsEnabled: Boolean)
    begin
        SendForReviewEnabled := IsEnabled;
    end;
}
