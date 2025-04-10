

page 56200 "Customer Feedback List"
{
    CardPageID = "Customer Feedback Card";
    Editable = false;
    PageType = List;
    SourceTable = "Customer FeedbackS";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Feedback Date"; Rec."Feedback Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Feedback Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date created"; Rec."Date created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date created field.';
                }
                field("Time created"; Rec."Time created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time created field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

