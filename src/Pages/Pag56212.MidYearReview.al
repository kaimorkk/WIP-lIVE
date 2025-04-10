

page 56212 "Mid-Year Review"
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Agreed Annual  Performance Targets field.';
                }
                field("Achieved Targets  of Annual"; Rec."Achieved Targets  of Annual")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Achieved Results in line with projected indicators field.';
                }
                field("Performance Indicator"; Rec."Performance Indicator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Performance Indicator field.';
                }
                field("Percentage Cumulative Achievem"; Rec."Percentage Cumulative Achievem")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Percentage Cumulative Achievement field.';
                }
                field("Appraisal Score"; Rec."Appraisal Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Appraisal Score field.';
                }
                field("Targets changed or added"; Rec."Targets changed or added")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Targets changed or added field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks (Indicate level of achievement) field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

