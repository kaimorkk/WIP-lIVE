page 69389 "Employee Transfer Requisition"
{
    Caption = 'Employee Requisition';
    PageType = Card;
    SourceTable = "Employee Transfers";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';


                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;

                    ToolTip = 'Specifies the value of the Employee No field.';
                }

                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                    Editable = false;
                }
                field("Job Cadre"; Rec."Job Cadre")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                    Editable = false;
                }
                field("No of Employee Requested"; "No of Employee Requested")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field("Requesting Station"; Rec."Requesting Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requesting Station field.';
                }
                field("Requesting Station  Name"; Rec."Requesting Station  Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Preferred Station 1 Name field.';
                }
                field("Transfer Reason Code"; Rec."Transfer Reason Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Reason Code field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;

                    ToolTip = 'Specifies the value of the Remarks field.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }

            }

            part("Employee Requisition Lines"; "Employee Requsition Lines")
            {
                Caption = 'Employee Requisition Lines';
                SubPageLink = "Document No" = field("Document No");
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(navigation)
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


            }
            action(Print)
            {
                ApplicationArea = Suite;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No", Rec."Document No");

                    Report.Run(70047, true, true, Rec);
                end;
            }

            action("Employee  Transfer History")
            {
                ApplicationArea = Basic;
                Caption = 'Employee  Transfer History';
                Image = History;
                RunObject = Page "Employee  Transfer History";
                RunPageLink = "Employee No" = field("Employee No");
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
            }
            group(Category_Category6)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowXrec: Boolean)
    var
        myInt: Integer;
    begin
        Rec.Type := Rec.Type::"Employee Requisition";
        Rec."Request Date" := Today;
        Rec."Document Type" := Rec."Document Type"::Application;
    end;

    var
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        // Procurement: Codeunit "Procurement Processing";
        ShowWorkflowStatus: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PRN: Record "Purchase Header";
        // ProcCommType: Record "Procurement Committee Types";
        // IfsCommitteMembers: Record "IFS Tender Committee Member";
        NoOfMembers: Integer;

    local procedure populateEmpReq()
    var
        UserSetup: Record "User Setup";
        Employee: Record Employee;
    begin
        Rec.Type := Rec.Type::"Management initiated";
        Rec."Request Date" := Today;
        Rec."Document Type" := Rec."Document Type"::"Employee Requisition";
        UserSetup.get(UserId);
        Rec.Validate("Employee No", UserSetup."Employee No.");
        Employee.Get(UserSetup."Employee No.");
        Rec."Employee Name" := Employee."First Name" + ' ' + Employee."Last Name";
        Rec."Job Cadre" := Employee."Job Title2";

    end;
}

#pragma implicitwith restore

