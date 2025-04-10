page 69839 "Acting Position Card"
{

    PageType = Card;
    SourceTable = "Employee Acting Position";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; No)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field';
                    ApplicationArea = All;
                }
                field("Promotion Type"; "Promotion Type")
                {
                    Caption = 'Acting Type';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Promotion Type field';
                    ApplicationArea = All;
                }
                field(Position; Position)
                {
                    Caption = 'Acting Position';
                    ToolTip = 'Specifies the value of the Position field';
                    ApplicationArea = All;
                }
                field("Job Description"; "Job Description")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Description field';
                    ApplicationArea = All;
                }
                field("Relieved Employee"; "Relieved Employee")
                {
                    ToolTip = 'Specifies the value of the Relieved Employee field';
                    ApplicationArea = All;
                }
                field("Relieved Name"; "Relieved Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Relieved Name field';
                    ApplicationArea = All;
                }
                field("Start Date"; "Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field';
                    ApplicationArea = All;
                }
                field("End Date"; "End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field';
                    ApplicationArea = All;
                }
                field("Duties Taken Over By"; "Employee No.")
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
                field(Qualified; Qualified)
                {
                    ToolTip = 'Specifies the value of the Qualified field';
                    ApplicationArea = All;
                }
                field(Promoted; Promoted)
                {
                    Editable = false;
                    Visible = false;
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
            group("Reason For Acting")
            {
                Caption = 'Reason For Acting';
                field(Reason; Reason)
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Reason field';
                    ApplicationArea = All;
                }
            }
            group("Financial Implication")
            {
                Editable = false;
                field("Basic Pay"; "Basic Pay")
                {
                    ToolTip = 'Specifies the value of the Basic Pay field';
                    ApplicationArea = All;
                }
                field("Acting Amount"; "Acting Amount")
                {
                    ToolTip = 'Specifies the value of the Acting Amount field';
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

        "Promotion Type" := "Promotion Type"::"Acting Position";
    end;

    var
        Employee: Record Employee;
    // ApprovalsMgmt: Codeunit ApprovalMgtCuExtension;
    // Workflow: Codeunit "Workflow Responses";
}

