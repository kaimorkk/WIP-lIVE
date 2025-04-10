

page 80031 "Corporate Perfomance Criteria"
{
    PageType = List;
    SourceTable = "Corporate Perfomance Criteria";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Perfomance Criteria Category"; Rec."Perfomance Criteria Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Perfomance Criteria Category field.';
                }
                field("Weight (%)"; Rec."Weight (%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weight (%) field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

