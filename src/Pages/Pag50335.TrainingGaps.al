page 50335 "Training Gaps"
{
    Caption = 'Training Gaps';
    PageType = ListPart;
    SourceTable = "Training Gaps";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Course ID"; Rec."Course ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course ID field.';
                }
                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course Name field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
            }
        }
    }
}
