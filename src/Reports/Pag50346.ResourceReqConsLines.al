page 50346 "Resource Req Cons Lines"
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
                    //Visible = false;
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
                }
                field("Draft Workplan Generated"; "Draft Workplan Generated")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Draft Workplan No"; "Draft Workplan No.")
                {
                    ApplicationArea = Basic, Suite;
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
                action("Send for Review")
                {
                    ApplicationArea = Basic, Suite;
                    Image = ReviewWorksheet;
                    Scope = Repeater;
                    Enabled = SendForReviewEnabled;
                    trigger OnAction()
                    var
                        WorkPlanMgt: Codeunit "Workplan Management";
                        Workplan: Record "Annual Strategy Workplan";
                    begin
                        if Confirm('Are you sure to Send selected draft workplans for review?', false) then begin
                            Workplan.Reset;
                            Workplan.Setrange(Select, true);
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
                action("Open Card")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Card;
                    RunObject = Page "Functional AWP Card";
                    RunPageLink = No = field(No);
                    RunPageMode = View;

                }
                action("Comments")
                {
                    ApplicationArea = Basic, Suite;
                    Image = ViewComments;
                    trigger OnAction()
                    var
                        BudgetComments: Record "Budget Comment";
                    begin
                        BudgetComments.ShowComments(Rec.RecordId, true);
                    end;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin

    end;

    var
        QuarterAmount: array[5] of Decimal;
        SendForReviewEnabled: Boolean;
        BudgConsolidationHeader: Record "Budget Consolidation Header";

    trigger OnAfterGetRecord()
    begin
        Rec.GetBudgetAmount(QuarterAmount);
        SendForReviewEnabled := (not Rec."Draft Workplan Generated");
        if BudgConsolidationHeader.Get(Rec."Annual Workplan") then;
    end;


}
