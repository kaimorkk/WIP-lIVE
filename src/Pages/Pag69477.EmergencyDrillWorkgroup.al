

page 69477 "Emergency Drill Workgroup"
{
    PageType = Card;
    SourceTable = "Emergency Drill Workgroup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Drill ID"; Rec."Drill ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill ID field.';
                }
                field("Record Type"; Rec."Record Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Record Type field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Workgroup Type"; Rec."Workgroup Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workgroup Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Person field.';
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Telephone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Date Informed"; Rec."Date Informed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Informed field.';
                }
                field("Comments/Additional Notes"; Rec."Comments/Additional Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments/Additional Notes field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

