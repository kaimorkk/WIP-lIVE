

page 75137 "IFS Prebid Bidder Attendance"
{
    PageType = List;
    SourceTable = "IFS Prebid Bidder Attendance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Prebid Register ID"; Rec."Prebid Register ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prebid Register ID field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Bidder No"; Rec."Bidder No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder No field.';
                }
                field("Representative Name"; Rec."Representative Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Representative Name field.';
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
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
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

