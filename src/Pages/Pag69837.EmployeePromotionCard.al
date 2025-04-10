page 69837 "Employee Promotion Card"
{
    PageType = Card;
    SourceTable = "Employee Acting Position";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = not IsApproved;
                field(No; No)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field';
                    ApplicationArea = All;
                }
                field("Promotion Type"; "Promotion Type")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Promotion Type field';
                    ApplicationArea = All;
                }
                label("Request:")
                {
                    Style = Strong;
                    StyleExpr = true;
                    ApplicationArea = All;
                }
                field("Request Date"; "Request Date")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request Date field';
                    ApplicationArea = All;
                }
                field("User ID"; "User ID")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the User ID field';
                    ApplicationArea = All;
                }
                field(PLWD; Rec.PLWD)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PLWD field.';
                }
                field("Current Duty Station"; Rec."Current Duty Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Duty Station field.';
                }
                field("Requested By"; "Requested By")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requested By field';
                    ApplicationArea = All;
                }
                field("Request Name"; "Request Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request Name field';
                    ApplicationArea = All;
                }
                label("Employee:")
                {
                    Style = Strong;
                    StyleExpr = true;
                    ApplicationArea = All;
                }
                field("Employee No."; "Employee No.")
                {
                    ToolTip = 'Specifies the value of the Employee No. field';
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field';
                    ApplicationArea = All;
                }
                label("Desired Position:")
                {
                    Style = Strong;
                    StyleExpr = true;
                    ApplicationArea = All;
                }
                field("Desired Position"; "Desired Position")
                {
                    ToolTip = 'Specifies the value of the Desired Position field';
                    ApplicationArea = All;
                }
                field("Position Name"; "Position Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Position Name field';
                    ApplicationArea = All;
                }
                field("New Job Group"; "New Scale")
                {
                    ToolTip = 'Specifies the value of the New Scale field';
                    ApplicationArea = All;
                }
                field("New Pointer"; "New Pointer")
                {
                    ToolTip = 'Specifies the value of the New Pointer field';
                    ApplicationArea = All;
                }
                field(Promoted; Promoted)
                {
                    ToolTip = 'Specifies the value of the Promoted field';
                    ApplicationArea = All;
                }
                field(Status; Status)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field';
                    ApplicationArea = All;
                }
            }
            group("Reason For Promotion")
            {
                Editable = not IsApproved;
                Caption = 'Reason For Promotion';
                field(Reason; Reason)
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Reason field';
                    ApplicationArea = All;
                }
            }
            group("Promotion Benefits")
            {
                Editable = false;
                field("Current Job Group"; "Current Scale")
                {
                    Caption = 'Current Salary Scale';
                    ToolTip = 'Specifies the value of the Current Job Group field';
                    ApplicationArea = All;
                }
                field("Current Pointer"; "Current Pointer")
                {
                    ToolTip = 'Specifies the value of the Current Pointer field';
                    ApplicationArea = All;
                }
                field("Current Benefits"; "Current Benefits")
                {
                    ToolTip = 'Specifies the value of the Current Benefits field';
                    ApplicationArea = All;
                }
                label("Grade Benefits")
                {
                    Style = Strong;
                    StyleExpr = true;
                    ApplicationArea = All;
                }
                field("New Benefits"; "New Benefits")
                {
                    ToolTip = 'Specifies the value of the New Benefits field';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin

                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }

                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin

                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        "Promotion Type" := "Promotion Type"::Promotion;
    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin

    end;

    var
        Employee: Record Employee;
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
        CanSendApproval: Boolean;
        CancancelApproval: Boolean;
        IsApproved: Boolean;
        //WorkflowResponse: Codeunit "Workflow Responses";
        Release: Boolean;

    procedure SetControlAppearance()
    begin
        CanSendApproval := false;
        CancancelApproval := false;
        IsApproved := false;
        if Status = Status::New then
            CanSendApproval := true;
        if Status = Status::"Pending Approval" then
            CancancelApproval := true;
        if Status = Status::Approved then
            IsApproved := true;
        //IsApproved
    end;
}

