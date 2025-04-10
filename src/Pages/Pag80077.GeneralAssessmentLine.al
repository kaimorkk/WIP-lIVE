

page 80077 "General Assessment Line"
{
    PageType = List;
    SourceTable = "General Assessment Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("General Assessment Template ID"; Rec."General Assessment Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Assessment Template ID field.';
                }
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Type field.';
                }
                field("Assessment Area ID"; Rec."Assessment Area ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assessment Area ID field.';
                }
                field("Response Type"; Rec."Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

