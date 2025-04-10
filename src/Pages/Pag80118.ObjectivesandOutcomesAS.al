

page 80118 "Objectives and Outcomes-AS"
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
                    ToolTip = 'Specifies the value of the Scorecard ID field.';
                }
                field("Scorecard Line No"; Rec."Scorecard Line No")
                {
                    ApplicationArea = Basic;
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
                    ToolTip = 'Specifies the value of the Outcome Perfomance Indicator field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
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
                    ToolTip = 'Specifies the value of the Performance Rating Scale field.';
                }
                field("Scale Type"; Rec."Scale Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scale Type field.';
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
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
                    ToolTip = 'Specifies the value of the AppraiserReview Qty field.';
                }
                field("Final/Actual Qty"; Rec."Final/Actual Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final/Actual Qty field.';
                }
                field("Raw Performance Score"; Rec."Raw Performance Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Raw Performance Score field.';
                }
                field("Weight %"; Rec."Weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weight % field.';
                }
                field("Final Weighted Line Score"; Rec."Final Weighted Line Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Weighted Line Score field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

