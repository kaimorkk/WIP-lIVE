page 50176 "Eligible Grades"
{

    Caption = 'Eligible Grades';
    PageType = ListPart;
    SourceTable = "Training Grades";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Course; Rec.Course)
                {
                    ToolTip = 'Specifies the value of the Course field.';
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Grade; Rec.Grade)
                {
                    ToolTip = 'Specifies the value of the Grade field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
