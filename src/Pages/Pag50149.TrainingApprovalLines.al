page 52193513 "Training Approval Lines"
{
    Caption = 'Training Approval Lines';
    PageType = ListPart;
    SourceTable = "Training Approval Lines";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application No field.';
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
                field(Course; Rec.Course)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Verdict; Rec.Verdict)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Verdict field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
    }
}
