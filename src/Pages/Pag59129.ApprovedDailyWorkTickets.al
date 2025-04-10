

page 59129 "Approved Daily Work Tickets"
{
    Caption = 'Open Daily Work Ticket List';
    //CardPageID = "Daily Work Ticket Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Monthly Work Ticket Header";
    SourceTableView = where(Status = filter(Released));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Daily Work Ticket"; Rec."Daily Work Ticket")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily Work Ticket field.';
                }
                field("Vehicle Registration No"; Rec."Vehicle Registration No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Registration No field.';
                }
                field("Driver Allocated"; Rec."Driver Allocated")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver Allocated field.';
                }
                field("Date of Request"; Rec."Date of Request")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Request field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Closed by"; Rec."Closed by")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed by field.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Closed field.';
                }
                field("Opening Odometer"; Rec."Opening Odometer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Odometer field.';
                }
                field("Closing Odometer"; Rec."Closing Odometer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closing Odometer field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
                field("Total Km's Covered"; Rec."Total Km's Covered")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Km''s Covered field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

