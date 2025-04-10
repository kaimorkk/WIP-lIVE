

page 80133 "Objectives and Outcomes-Self"
{
    PageType = ListPart;
    SourceTable = "Objective Evaluation Result";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Evaluation ID"; Rec."Performance Evaluation ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Performance Evaluation ID field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Scorecard ID"; Rec."Scorecard ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Scorecard ID field.';
                }
                field("Scorecard Line No"; Rec."Scorecard Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Scorecard Line No field.';
                }
                field("Objective/Initiative"; Rec."Objective/Initiative")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective/Initiative field.';
                }
                field("Outcome Perfomance Indicator"; Rec."Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Outcome Perfomance Indicator field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                }
                field("Performance Rating Scale"; Rec."Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Performance Rating Scale field.';
                }
                field("Scale Type"; Rec."Scale Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Scale Type field.';
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Target Qty field.';
                }
                field("Self-Review Qty"; Rec."Self-Review Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Self-Review Qty field.';

                }
                field("AppraiserReview Qty"; Rec."AppraiserReview Qty")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Editable = false;
                    ToolTip = 'Specifies the value of the AppraiserReview Qty field.';
                }
                field("Final/Actual Qty"; Rec."Final/Actual Qty")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Final/Actual Qty field.';
                }
                // field(Remarks; Rec.Remarks)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Remarks field.';
                // }
                // field(Recommendation; Rec.Recommendation)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Recommendation field.';
                // }
                // field("2nd Supervisor Review Qty"; Rec."2nd Supervisor Review Qty")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the 2nd Supervisor Review Qty field.';
                // }
                // field("2nd Supervisor Recommendation"; Rec."2nd Supervisor Recommendation")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the 2nd Supervisor Recommendation field.';
                // }
                // field("2nd Supervisor Remarks"; Rec."2nd Supervisor Remarks")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the 2nd Supervisor Remarks field.';
                // }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

