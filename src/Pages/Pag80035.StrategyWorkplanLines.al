page 80035 "Strategy Workplan Lines"
{
    PageType = ListPart;
    SourceTable = "Strategy Workplan Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible=false;
                    Caption='STAJ';
                }
                field("KRA ID"; Rec."KRA ID")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Core Strategy ID"; Rec."Core Strategy ID")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Strategy ID"; Rec."Strategy ID")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Activity ID"; Rec."Activity ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    Caption='Activities';
                    ApplicationArea = Basic;
                }
                field("Perfomance Indicator"; Rec."Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Caption = 'Perfomance Indicator';
                }
                field("Annual Target"; Rec."Annual Target2")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Functions ")
            {
                Caption = 'Inputs and Budgets';
                Image = AnalysisView;
                action("Sub-Activities ")
                {
                    Caption = 'Budget Inputs';
                    ApplicationArea = Basic;
                    Image = Notes;
                    RunObject = Page "SubWorkPlan Activity Inputs";
                    RunPageLink = "Workplan No." = field(No),
                                  "KRA ID" = field("KRA ID"),
                                   "Core Strategy ID" = field("Core Strategy ID"),
                                   "Strategy ID" = field("Strategy ID"),
                                   "Activity Id" = field("Activity ID");
                }
                action("Update Targets & Budget")
                {
                    ApplicationArea = Basic;
                    Image = UpdateDescription;
                    Visible = false;
                    trigger OnAction()
                    begin
                        if not Confirm('Sure to update budget and lines from inputs?') then
                            exit;
                        // Rec.UpdateTargetsandBudgets(true);
                        Message('Targets and Budgets Updated!');
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
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        AWP: Record "Annual Strategy Workplan";
    begin
        if AWP.Get(Rec.No) then begin
            Rec."Resource Req. No" := AWP."Resource Req. No";
            Rec."Strategy Plan ID" := AWP."Strategy Plan ID";
        end;
    end;
}

