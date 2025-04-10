

page 80210 "Secondary Workplan Initiatives"
{
    Caption = 'Secondary Workplan Initiatives';
    PageType = ListPart;
    SourceTable = "Secondary PC Objective";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field("Initiative No."; Rec."Initiative No.")
                {
                    ApplicationArea = Basic;
                }
                field("Objective/Initiative"; Rec."Objective/Initiative")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Outcome Perfomance Indicator"; Rec."Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Imported Annual Target Qty"; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agreed Targets';
                }
                field("Assigned Weight (%)"; Rec."Assigned Weight (%)")
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
            group("Line Functions")
            {
                action("Sub Intiatives")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Sub Objectives/Intiatives";
                    RunPageLink = "Workplan No." = field("Workplan No."),
                                  "Initiative No." = field("Initiative No."),
                                  "Goal ID" = field("Goal ID");
                }
            }
        }
    }
}

#pragma implicitwith restore

