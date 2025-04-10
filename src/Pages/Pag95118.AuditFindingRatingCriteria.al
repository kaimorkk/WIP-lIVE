

page 95118 "Audit Finding Rating Criteria"
{
    CardPageID = "Audit Finding Rating Criterion";
    PageType = List;
    SourceTable = "Audit Finding Rating Criteria";

    layout
    {
        area(content)
        {
            repeater(Group)
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

