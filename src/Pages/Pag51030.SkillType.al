page 51030 "Skill Type"
{
    Caption = 'Skill Type';
    PageType = List;
    SourceTable = Reasons;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
