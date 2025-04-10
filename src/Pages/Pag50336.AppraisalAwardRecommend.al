page 50336 "Appraisal Award Recommend"
{
    Caption = 'Appraisal Award Recommend';
    PageType = ListPart;
    SourceTable = "Appraisal Award Recomm";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Award type"; Rec."Award type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Award type field.';
                }
                field("Awards Name"; Rec."Awards Name")
                {
                    ApplicationArea = All;
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
