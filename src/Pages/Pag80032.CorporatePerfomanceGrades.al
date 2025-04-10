

page 80032 "Corporate Perfomance Grades"
{
    PageType = List;
    SourceTable = "Corporate Perfomance Grades";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Min Score (%) Per. Contract"; Rec."Min Score (%) Per. Contract")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min Score (%) Per. Contract field.';
                }
                field("Max Score (%) Per. Contract"; Rec."Max Score (%) Per. Contract")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Score (%) Per. Contract field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

