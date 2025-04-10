

page 59033 "Limit Types"
{
    CardPageID = "Limit Types Card";
    PageType = List;
    SourceTable = "Limit Types";
    UsageCategory = Administration;
    ApplicationArea = All;

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
                field("Request Duration"; Rec."Request Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Duration field.';
                }
                field("Lower Limit"; Rec."Lower Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lower Limit field.';
                }
                field("Upper Limit"; Rec."Upper Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Upper Limit field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

