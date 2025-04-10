page 50233 "HR Leave Activities Cue"
{
    Caption = 'HR Leave Activities Cue';
    PageType = CardPart;
    SourceTable = "HR Activities Cue";

    layout
    {
        area(content)
        {
            cuegroup(General)
            {
                Caption = 'General';

                field("Staff on Leave Count"; Rec."Staff on Leave Count")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Employee List";
                    ToolTip = 'Specifies the value of the Staff on Leave Count field.';
                }
                field("Staff on Leave"; Rec."Staff on Leave")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Staff on Leave field.';
                }
                field("Approved Leave"; Rec."Approved Leave")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approved Leave field.';
                }
                field("Posted Leave"; Rec."Posted Leave")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Leave field.';
                }
                field("Posted Leave Recall"; Rec."Posted Leave Recall")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Leave Recall field.';
                }
                field("Posted Leave Reimbursements"; Rec."Posted Leave Reimbursements")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Leave Reimbursements field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
        Employee: Record Employee;
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Employee No." <> '' then begin
                if Employee.Get(UserSetup."Employee No.") then
                    Rec.SetFilter("Implementing Unit Filter", Employee."Directorate Code");
            end;
        end;
    end;
}
