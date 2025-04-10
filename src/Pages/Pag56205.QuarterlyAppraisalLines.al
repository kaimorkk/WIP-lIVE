

page 56205 "Quarterly Appraisal Lines"
{
    PageType = ListPart;
    SourceTable = "Quarterly  Appraisal Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Agreed Performance Targets"; Rec."Agreed Performance Targets")
                {
                    ApplicationArea = Basic;
                }
                field("Acheived Targets for the Quart"; Rec."Acheived Targets for the Quart")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Indicator"; Rec."Performance Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("Percentage Cumulative Achievem"; Rec."Percentage Cumulative Achievem")
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

