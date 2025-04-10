page 80029 "Strategies"
{
    PageType = List;
    SourceTable = Strategy;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Theme ID"; Rec."Theme ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'KRA ID';
                }
                field("Objective ID"; Rec."Objective ID")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy ID"; Rec."Strategy ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(StrategyOutput)
            {
                ApplicationArea = Basic;
                Image = OutputJournal;
                RunObject = Page "Strategy Output";
                RunPageLink = "Strategic Plan ID" = field("Strategic Plan ID"),
                "Strategy ID" = field("Strategy ID"), "Line No." = field("Line No.");
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
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(StrategyOutput_Promoted; StrategyOutput)
                {
                }
                actionref(Comments_Promoted; Comments)
                {
                }
            }
        }
    }
}


