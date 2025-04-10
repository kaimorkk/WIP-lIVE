page 50428 "Eligible Positions"
{
    Caption = 'Eligible Positions';
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
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course field.';
                }
                field(Positions; Rec.Positions)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Positions field.';
                }
            }
        }
    }
}
