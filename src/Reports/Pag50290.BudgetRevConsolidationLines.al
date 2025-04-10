#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80530 "Budget RevConsolidation Lines"
{
    PageType = ListPart;
    SourceTable = "Budget Consolidation Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Vote id"; Rec."Vote id")
                {
                    ApplicationArea = Basic;
                }
                field("Vote Desription"; Rec."Vote Desription")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Description';
                }
                field("Draft Budgeted Amount"; Rec."Draft Budgeted Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Awp Budget';
                }
                field("GL Budgeted Amount"; Rec."GL Budgeted Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Budget';
                    Editable = false;
                }
                field("Actual Budgeted Amount"; Rec."Actual Budgeted Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Rationalized Budget';
                    Visible = false;
                }
                field("Deficit/Surplus"; Rec."Deficit/Surplus")
                {
                    ApplicationArea = Basic;
                    Caption = 'Variance ';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
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
                Caption = 'Line Function';
                Image = AnalysisView;
                action("Budget Consolidation Entries")
                {
                    ApplicationArea = Basic;
                    Image = Notes;
                    RunObject = Page "Budget Consolidation Entries";
                    RunPageLink = "Consolidation Header No" = field("Consolidation Header No"),
                                  "Job No" = field("Job No"),
                                  "Vote id" = field("Vote id");
                }
                action("Update Deficit/Surplus")
                {
                    ApplicationArea = Basic;
                    Image = Notes;

                    trigger OnAction()
                    begin
                        BudgetConsolidationLines.Reset;
                        BudgetConsolidationLines.SetRange("Consolidation Header No", Rec."Consolidation Header No");
                        if BudgetConsolidationLines.Find('-') then begin
                            repeat
                                BudgetConsolidationLines.CalcFields("Draft Budgeted Amount", "Actual Budgeted Amount");
                                BudgetConsolidationLines."Deficit/Surplus" := BudgetConsolidationLines."Draft Budgeted Amount" - BudgetConsolidationLines."GL Budgeted Amount";
                                BudgetConsolidationLines.Modify;
                            until BudgetConsolidationLines.Next = 0;
                        end;

                        Message('Surplus/Deficit updated successfully');
                    end;
                }
            }
        }
    }

    var
        BudgetConsolidationLines: Record "Budget Consolidation Lines";
}

#pragma implicitwith restore

