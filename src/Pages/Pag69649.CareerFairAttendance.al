

page 69649 "Career Fair Attendance"
{
    PageType = List;
    SourceTable = "Career Fair Attendance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Attendee Type"; Rec."Attendee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attendee Type field.';
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
                field("Notified on Email"; Rec."Notified on Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notified on Email field.';
                }
                field("Date/Time Notified"; Rec."Date/Time Notified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date/Time Notified field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Links)
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

