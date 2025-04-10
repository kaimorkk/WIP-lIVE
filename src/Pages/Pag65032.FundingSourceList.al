

page 65032 "Funding Source List"
{
    PageType = List;
    SourceTable = "Funding Source";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Date field.', Comment = '%';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Date field.', Comment = '%';
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Percentage field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup7)
            {
                action("Funding Agencies")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    // RunObject = Page "Funding Agency List";
                    ToolTip = 'Executes the Funding Agencies action.';
                }
                action("Procurement Plan Entries")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    // RunObject = Page "Procurement Plan Entry";
                    // RunPageLink = "Funding Source ID" = field(Code);
                    ToolTip = 'Executes the Procurement Plan Entries action.';
                }
                action("Funded Projects")
                {
                    ApplicationArea = Basic;
                    Image = ProjectExpense;
                    RunObject = Page "Job List";
                    // RunPageLink = "Funding Source" = field(Code);
                    ToolTip = 'Executes the Funded Projects action.';
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Image = Statistics;
                    // RunObject = Page "Posted Receipts List";
                    ToolTip = 'Executes the Statistics action.';
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Funding Agencies_Promoted"; "Funding Agencies")
                {
                }
                actionref("Procurement Plan Entries_Promoted"; "Procurement Plan Entries")
                {
                }
                actionref("Funded Projects_Promoted"; "Funded Projects")
                {
                }
                actionref(Statistics_Promoted; Statistics)
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

