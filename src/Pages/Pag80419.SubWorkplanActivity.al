

page 80419 "Sub Workplan Activity"
{
    Caption = 'Sub Workplan Activities';
    PageType = List;
    SourceTable = "Sub Workplan Activity";
    //AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sub-Indicator"; Rec."Sub Initiative No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Sub-Initiative"; Rec."Objective/Initiative")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(Target; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Target';
                }
                field("Total Budget"; Rec."Total Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Completion Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                }
                field(Weight; Rec.Weight)
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
            action("SubWorkPlan Activity Inputs")
            {
                RunObject = Page "SubWorkPlan Activity Inputs";
                RunPageLink = "Workplan No." = field("Workplan No."),
                    "Activity Id" = field("Activity Id"), "Initiative No." = field("Initiative No."),
                    "Sub Initiative No." = field("Sub Initiative No.");
                ApplicationArea = All;
            }

        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("SubWorkPlan Activity Inputs_Promoted"; "SubWorkPlan Activity Inputs")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

