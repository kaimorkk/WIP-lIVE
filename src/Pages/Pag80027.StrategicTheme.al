page 80027 "Strategic Theme"
{
    Caption = 'Key Result Areas';
    PageType = List;
    SourceTable = "Strategic Theme";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Theme ID"; Rec."Theme ID")
                {
                    Caption = 'KRA ID';
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
            action("Strategic Objectives")
            {
                ApplicationArea = Basic;
                Image = Route;
                RunObject = Page "Strategic Objectives";
                RunPageLink = "Strategic Plan ID" = field("Strategic Plan ID"), "Theme ID" = field("Theme ID");
                ToolTip = 'Executes the Strategic Objectives action.';
                Caption = 'Strategy Core Objectives';
            }
            action(Comments)
            {
                ApplicationArea = Basic;
                Image = ViewComments;
                trigger OnAction()
                var
                    // BudgetComments: Record "Budget Comment";
                begin
                    // BudgetComments.ShowComments(Rec.RecordId, true);
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
                actionref("Strategic Objectives_Promoted"; "Strategic Objectives")
                {
                }
            }
        }
    }
}

