page 50357 "Workplan Activities"
{
    ApplicationArea = All;
    Caption = 'Workplan Activities';
    PageType = List;
    SourceTable = "Workplan Activity";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Descriptions; Rec.Descriptions)
                {
                    ApplicationArea = All;
                    Caption = 'Activities';
                    ToolTip = 'Specifies the value of the Descriptions field.';
                }
                field(Outputs; Rec.Outputs)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Outputs field.';
                }
                field("Performance Measures"; Rec."Performance Measures")
                {
                    ApplicationArea = All;
                    Caption = 'Perfomance Indicator';
                    ToolTip = 'Specifies the value of the Performance Measures field.';
                }
                field("Annual Target"; Rec."Annual Target")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Annual Target field.';
                }
                field("Strategic Plan ID"; Rec."Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Target field.';
                    Visible = false;
                }
                field("Line N0."; Rec."Line N0.")
                {
                    ApplicationArea = All;
                    Visible=false;
                    ToolTip = 'Specifies the value of the Line N0. field.', Comment = '%';
                }
            }
        }
    }
}
