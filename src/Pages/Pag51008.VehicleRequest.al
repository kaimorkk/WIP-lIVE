page 51008 "Vehicle Request"
{
    Caption = 'Motor Vehicle Request';
    PageType = Card;
    SourceTable = "Vehicle Request";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Request No."; Rec."Request No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request No. field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requested By field.';
                }
                field("Station No."; Rec."Station No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Station No. field.';
                }
                field("Station Description"; Rec."Station Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Station Description field.';
                }
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle Type field.';
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Capacity field.';
                }
                field("Request Type"; Rec."Request Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Type field.';
                }
                field(Justification; Rec.Justification)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Justification field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. Series. field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group(Vehicle)
            {
                Editable = Status = Status::Approved;
                Visible = Status = Status::Approved;

                field("Vehicle Issued"; Rec."Vehicle Issued")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle Issued field.';
                }
                field("Date Issued"; Rec."Date Issued")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Issued field.';
                }
                field("License Plate Number Issued"; Rec."License Plate Number Issued")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the License Plate Number Issued field.';
                }
                field("Issued By"; Rec."Issued By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issued By field.';
                }
                field("Time Issued"; Rec."Time Issued")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Time Issued field.';
                }
                field("Notification Remarks"; Rec."Notification Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Notification Remarks field.';
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Approve)
            {
                ApplicationArea = All;
                Caption = 'Approve';
                Image = Approve;
                ToolTip = 'Approve the requested changes.';
                Visible = OpenApprovalEntriesExistForCurrUser;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                end;
            }
            action(Reject)
            {
                ApplicationArea = All;
                Caption = 'Reject';
                Image = Reject;
                ToolTip = 'Reject the approval request.';
                Visible = OpenApprovalEntriesExistForCurrUser;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                end;
            }
            action(Delegate)
            {
                ApplicationArea = All;
                Caption = 'Delegate';
                Image = Delegate;
                ToolTip = 'Delegate the approval to a substitute approver.';
                Visible = OpenApprovalEntriesExistForCurrUser;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                end;
            }
            action(Comment)
            {
                ApplicationArea = All;
                Caption = 'Comments';
                Image = ViewComments;
                ToolTip = 'View or add comments for the record.';
                Visible = OpenApprovalEntriesExistForCurrUser;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.GetApprovalComment(Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = All;
                Caption = 'Approvals';
                Image = Approvals;
                ToolTip = 'View or add approvals for the record.';
                Visible = OpenApprovalEntriesExistForCurrUser;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Re&open';
                Visible = false;
                // Enabled = Status <> Status::Open;
                Image = ReOpen;
                ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed.';
                trigger OnAction()
                var
                    ReleaseSalesDoc: Codeunit "Release Sales Document";
                begin
                    // ReleaseSalesDoc.PerformManualReopen(Rec);
                    //   CurrPage.SalesLines.PAGE.ClearTotalSalesHeader();
                end;
            }




            action(SendApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                ToolTip = 'Request approval of the document.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    Variant: Variant;
                begin
                    Rec.ValidatePreApproval();
                    Variant := Rec;
                    if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(Variant) then
                        ApprovalsMgmt.OnSendDocForApproval(Variant);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cancel Approval Re&quest';
                // Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                Image = CancelApprovalRequest;
                ToolTip = 'Cancel the approval request.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    Variant: Variant;
                begin
                    Rec.TestField(Status, Rec.Status::Pending);
                    Variant := Rec;
                    ApprovalsMgmt.OnCancelDocApprovalRequest(Variant);
                end;
            }


            action(IssueVehicle)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Issue Vehicle';
                Image = IssueFinanceCharge;
                trigger OnAction()
                begin
                    Rec.IssueVehicle();
                end;
            }


        }
        area(Promoted)
        {
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Approval', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Action', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(IssueVehicle_Promoted; IssueVehicle)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    var

        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}
