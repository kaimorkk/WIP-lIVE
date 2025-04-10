

page 95119 "Audit Finding Rating Criterion"
{
    PageType = Card;
    SourceTable = "Audit Finding Rating Criteria";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Rating Code"; Rec."Rating Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Code field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
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

