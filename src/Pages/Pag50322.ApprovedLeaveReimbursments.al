page 50322 "Approved Leave Reimbursments"
{
    Caption = 'Approved Leave Reimbursments';
    PageType = List;
    Editable = false;
    SourceTable = "HR Leave Allocation Request";
    SourceTableView = where(Status = filter(Approved));
    CardPageId = "Leave Reimbursment Card";
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    ApplicationArea = All;
                }
                field("Application Type"; Rec."Application Type")
                {
                    ToolTip = 'Specifies the value of the Application Type field.';
                    ApplicationArea = All;
                }
                field("Adjustment Type"; Rec."Adjustment Type")
                {
                    ToolTip = 'Specifies the value of the Adjustment Type field.';
                    ApplicationArea = All;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ToolTip = 'Specifies the value of the Leave Type field.';
                    ApplicationArea = All;
                }
                field("Applied Days"; Rec."Applied Days")
                {
                    ToolTip = 'Specifies the value of the Applied Days field.';
                    ApplicationArea = All;
                }
                field("Days Approved"; Rec."Days Approved")
                {
                    ToolTip = 'Specifies the value of the Days Approved field.';
                    ApplicationArea = All;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ToolTip = 'Specifies the value of the Employee Name field.';
                    ApplicationArea = All;
                }
                field("Employee Dept"; Rec."Employee Dept")
                {
                    ToolTip = 'Specifies the value of the Employee Dept field.';
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                    ApplicationArea = All;
                }
                field(Posted; Rec.Posted)
                {
                    ToolTip = 'Specifies the value of the Posted field.';
                    ApplicationArea = All;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ToolTip = 'Specifies the value of the Posted By field.';
                    ApplicationArea = All;
                }
                field(Purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                }
                field(HOD; Rec.HOD)
                {
                    ToolTip = 'Specifies the value of the HOD field.';
                    ApplicationArea = All;
                }
                field("Approver ID"; Rec."Approver ID")
                {
                    ToolTip = 'Specifies the value of the Approver ID field.';
                    ApplicationArea = All;
                }
                field("Approvers Comments"; Rec."Approvers Comments")
                {
                    ToolTip = 'Specifies the value of the Approvers Comments field.';
                    ApplicationArea = All;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ToolTip = 'Specifies the value of the Department Code field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}