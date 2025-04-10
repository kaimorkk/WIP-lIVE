

page 56210 "Annual Appraisal Lines"
{
    PageType = ListPart;
    SourceTable = "Annual  Appraisal Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Agreed Performance Targets"; Rec."Agreed Performance Targets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agreed Annual  Performance Targets field.';
                }
                field("Achieved Targets  of Annual"; Rec."Achieved Targets  of Annual")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achieved Results in line with projected indicators field.';
                }
                field("Performance Indicator"; Rec."Performance Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Indicator field.';
                }
                field("Percentage Cumulative Achievem"; Rec."Percentage Cumulative Achievem")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage Cumulative Achievement field.';
                }
                field("Appraisal Score"; Rec."Appraisal Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Score field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

