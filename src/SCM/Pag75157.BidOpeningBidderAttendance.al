

page 75157 "Bid Opening Bidder Attendance"
{
    PageType = List;
    SourceTable = "Bid Opening Bidder Attendance";

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
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Bidder Representative Name"; Rec."Bidder Representative Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Representative Name field.';
                }
                field("Representative Email"; Rec."Representative Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Representative Email field.';
                }
                field("Representative Tel No"; Rec."Representative Tel No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Representative Tel No field.';
                }
                field("Date/Time Notified"; Rec."Date/Time Notified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date/Time Notified field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

