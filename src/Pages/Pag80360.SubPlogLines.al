

page 80360 "Sub Plog Lines"
{
    PageType = List;
    SourceTable = "Sub Plog Lines";

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Planned Date"; Rec."Planned Date")
                {
                    ApplicationArea = Basic;
                }
                field("Achieved Date"; Rec."Achieved Date")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Achieved Target"; Rec."Achieved Target")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Activity Type"; Rec."Activity Type")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Targets"; Rec."Remaining Targets")
                {
                    ApplicationArea = Basic;
                }
                field("Weight %"; Rec."Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                }
                field(Variances; Rec.Variances)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

