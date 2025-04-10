

page 69296 "Need Requests"
{
    PageType = ListPart;
    SourceTable = "Training Needs Requests";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Course ID"; Rec."Course ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Course Name';
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Duty Station"; Rec."Duty Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duty Station field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                
                field(Source; Rec.Source)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

