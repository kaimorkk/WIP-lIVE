

page 80105 "Improvement Plan Line"
{
    PageType = ListPart;
    SourceTable = "Improvement Plan Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("PIP ID"; Rec."PIP ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PIP ID field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Expectation to be met"; Rec."Expectation to be met")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expectation to be met field.';
                }
                field("Performance Deficiency ID"; Rec."Performance Deficiency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Deficiency ID field.';
                }
                field("Achievement Due Date"; Rec."Achievement Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achievement Due Date field.';
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
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Qty field.';
                }
                field("Achievement Qty"; Rec."Achievement Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achievement Qty field.';
                }
                field("Final Performance Rating"; Rec."Final Performance Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Performance Rating field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

