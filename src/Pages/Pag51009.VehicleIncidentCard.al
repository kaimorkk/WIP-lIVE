page 51009 "Vehicle Incident Card"
{
    Caption = 'Vehicle Incident Card';
    PageType = Card;
    SourceTable = "Vehicle Incident";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = Status = Status::Open;

                field("Incident No.";
                Rec."Incident No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Incident No. field.';
                }
                field("Reporting Date"; Rec."Reporting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reporting Date field.';
                }
                field("Incident Date"; Rec."Incident Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Incident Date field.';
                }
                field("Incident Time"; Rec."Incident Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Incident Time field.';
                }

                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver ID field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Driver Phone Number"; Rec."Driver Phone Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Contact Information field.';
                }
                field("Driver Licence Details"; Rec."Driver Licence Details")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Licence Details field.';
                }
                field("Vehicle ID"; Rec."Vehicle ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle ID field.';
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field("Licence Plate Number"; Rec."Licence Plate Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Licence Plate Number field.';
                }
                field("Current Milleage"; Rec."Current Milleage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Milleage field.';
                }
                field("Incident Description"; Rec."Incident Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Incident Description field.';
                }
                field("Person Culpable"; Rec."Person Culpable")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Person Culpable field.';
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Responsible Employee field.';
                }
                field("Work Ticket No"; Rec."Work Ticket No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Work Ticket No field.';
                    LookupPageId = "Daily Work Ticket List";
                }
                field("Duty Station"; Rec."Duty Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duty Station field.';
                }
                field("Station Name"; Rec."Station Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Station Name field.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Submitted field.';
                }
                field("Submitted By"; Rec."Submitted By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Submitted By field.';
                }
                field("Submitted on"; Rec."Submitted on")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Submitted on field.';
                }

            }
            group(Service)
            {
                Editable = Submitted = true;
                Visible = Submitted = true;

                field(Recommendations;
                Rec.Recommendations)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Recommendations field.';
                }
                field("Service Provider"; Rec."Service Provider")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Provider field.';
                }
                field("Service Provider Name"; Rec."Service Provider Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Provider Name field.';
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Action Taken field.';
                }
                field("Inspection Remarks"; Rec."Inspection Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inspection Remarks field.';
                }
                field("Estimated Amount"; Rec."Estimated Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Estimated Amount field.';
                }
                field("Estimated Number"; Rec."Estimated Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Estimated Number field.';
                }
                field("Insurance Policy Number"; Rec."Insurance Policy Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Insurance Policy Number field.';
                }
                field(Grounded; Rec.Grounded)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grounded field.';
                }
                field("Grounded By"; Rec."Grounded By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grounded By field.';
                }
                field("Grounded On"; Rec."Grounded On")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grounded On field.';
                }

            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50038),
                              "No." = field("Incident No.");
            }
            systempart(Control1000000019; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000020; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
        }

        area(processing)
        {

            action(Submit)
            {
                ApplicationArea = All;
                Image = SuggestBin;
                trigger OnAction()
                begin
                    Rec.ValidatePreSubmission();
                    Rec.ProcessSubmission();
                end;
            }
            action(Ground)
            {
                ApplicationArea = All;
                Image = Delete;
                trigger OnAction()
                begin
                    Rec.GroundVehicle();
                end;
            }

            action(Approve)
            {
                ApplicationArea = All;
                Caption = 'Approve';
                Image = Approve;
                ToolTip = 'Approve the requested changes.';
                //               Visible = OpenApprovalEntriesExistForCurrUser;

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
                //           Visible = OpenApprovalEntriesExistForCurrUser;

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
                //  Visible = OpenApprovalEntriesExistForCurrUser;

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
                //Visible = OpenApprovalEntriesExistForCurrUser;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.GetApprovalComment(Rec);
                end;
            }




            action(SendApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                ToolTip = 'Request approval of the document.';
                trigger OnAction()
                var
                    CustomApprovalsCodeunit: Codeunit "Custom Approvals Codeunit";
                    Variant: Variant;
                begin
                    Rec.ValidatePreApproval;
                    Variant := Rec;
                    if CustomApprovalsCodeunit.CheckApprovalsWorkflowEnabled(Variant) then
                        CustomApprovalsCodeunit.OnSendDocForApproval(Variant);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cancel Approval Re&quest';
                Image = CancelApprovalRequest;
                ToolTip = 'Cancel the approval request.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    Variant: Variant;
                begin
                    Variant := Rec;
                    ApprovalsMgmt.OnCancelDocApprovalRequest(Variant);
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
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'RequestApproval', Comment = 'Generated from the PromotedActionCategories property index 0.';

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
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Functions', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Actions', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Submit_Promoted; Submit)
                {
                }
                actionref(Ground_Promoted; Ground)
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Document', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
        }

    }
}