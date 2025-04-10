page 80028 "Strategic Objectives"
{
    PageType = List;
    SourceTable = "Strategic Objective";
    UsageCategory = Tasks;
    DelayedInsert = true;
    ApplicationArea = All;
    Caption = 'Core Strategic Objectives';

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
            action(Strategies)
            {
                ApplicationArea = Basic;
                Image = Planning;
                RunObject = Page Strategies;
                RunPageLink = "Strategic Plan ID" = field("Strategic Plan ID"), "Theme ID" = field("Theme ID"), "Objective ID" = field("Objective ID");
                ToolTip = 'Executes the Strategies action.';
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

                actionref(Comments_Promoted; Comments)
                {
                }
            }
            group(Category_Category4)
            {
                actionref(Strategies_Promoted; Strategies)
                {
                }
            }
        }
    }
}


