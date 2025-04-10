page 50371 "Submitted Time Offs"
{
    Caption = 'Submitted Time Offs';
    PageType = List;
    SourceTable = "HR Leave Allocation Request";
    SourceTableView = where("Application Type" = const("Time Off"), Status = const(Posted));
    CardPageId = "HR Leave Requests";

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
    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
            if Employee.Get(UserSetup."Employee No.") then begin
                if Employee."Head of Station" then begin
                    Rec.SetFilter("Duty Station", Employee."Current Duty Station");
                end;
            end;
        end else begin
            Error(Text001);
        end;
    end;

    var
        Employee: Record Employee;
        UserSetup: Record "User Setup";
        Text001: Label 'You do not have access to this page since you are either not set up on the user setup or you are not a HOS';
}
