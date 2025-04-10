

page 80114 "Sub Objectives/Intiatives"
{
    PageType = List;
    SourceTable = "Sub PC Objective";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sub Initiative No."; Rec."Sub Initiative No.")
                {
                    ApplicationArea = Basic;
                }
                field("Sub-Initiative"; Rec."Objective/Initiative")
                {
                    ApplicationArea = Basic;
                }
                field("Sub-Indicator"; Rec."Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Target; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Target';
                }
                field("Completion Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Sub Activity weight %"; Rec."Sub Activity weight %")
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
            action("Sub Activities")
            {
                RunObject = page "Sub PC Objective Activities";
                RunPageLink = "Workplan No." = field("Workplan No."), "Initiative No." = field("Initiative No."),
                "Goal Template ID" = field("Goal Template ID"), "Strategy Plan ID" = field("Strategy Plan ID"),
                "Sub Initiative No." = field("Sub Initiative No."), "Entry Number" = field("Entry Number");
                ApplicationArea = All;

            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Sub Activities_Promoted"; "Sub Activities")
                {
                }
            }
        }

    }
}

#pragma implicitwith restore

