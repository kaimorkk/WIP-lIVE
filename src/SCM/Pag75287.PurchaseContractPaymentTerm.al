

page 75287 "Purchase Contract Payment Term"
{
    PageType = List;
    SourceTable = "Purchase Contract Payment Term";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Instalment Code"; Rec."Instalment Code")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Certificate Type"; Rec."Payment Certificate Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Payment %"; Rec."Payment %")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Amount"; Rec."Planned Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Amount (LCY)"; Rec."Planned Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Paid Amount"; Rec."Paid Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Paid Amount (LCY)"; Rec."Paid Amount (LCY)")
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
            group(Lines)
            {
                Caption = 'Lines';
                action("Purchase Contract Milestone")
                {
                    ApplicationArea = Basic;
                    Image = PlanningWorksheet;
                    RunObject = Page "Purchase Contract Milestone";
                    RunPageLink = "No." = field("No."),
                                  "Payment Instalment Code" = field("Instalment Code");
                }
            }
        }
        area(Promoted)
        {
            group(Category_Category4)
            {
                actionref("Purchase Contract Milestone_Promoted"; "Purchase Contract Milestone")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

