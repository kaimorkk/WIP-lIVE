page 50180 "Discipline Details"
{
    Caption = 'Discipline Details';
    PageType = Card;
    SourceTable = "Discipline Details";
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = not Rec."Stage Completed" and (Status = Status::Open);

                field("Discipline Detail No."; Rec."Discipline Detail No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discipline Detail No. field.';
                }
                field("Discipline Case No."; Rec."Discipline Case No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discipline Case No. field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Document Stage"; Rec."Document Stage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Stage field.';
                    trigger OnValidate()
                    begin
                        UpdatePageControls;
                    end;
                }
                field("Document Stage Description"; Rec."Document Stage Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Stage Description field.';
                }
                field(Remarks; Rec.Recommendations)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                    MultiLine = true;
                }
                field("Effective Date"; "Effective Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }

                field("Completed By"; Rec."Completed By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Completed By field.';
                }
                field("Completed On"; Rec."Completed On")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Completed On field.';
                }
                field("Stage Completed"; Rec."Stage Completed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Stage Completed field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Email Notification Sent"; Rec."Email Notification Sent")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email Notification Sent field.';
                }
                field("Email Notification Sent On"; Rec."Email Notification Sent On")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email Notification Sent On field.';
                }
                field("Email Notification Sent By"; Rec."Email Notification Sent By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email Notification Sent By field.';
                }
            }
            group("Chief Justice")
            {
                Visible = RequiresCJRemarks;
                Editable = RequiresCJRemarks and (Status <> Status::Open);
                field("Chief Justice Remarks"; Rec."Chief Justice Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Chief Justice Remarks field.';
                    MultiLine = true;
                }
            }

        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50062),
                              "No." = field("Discipline Detail No.");
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
        area(Processing)
        {
            action("Send Email Notification")
            {
                ApplicationArea = All;
                Caption = 'Send Email Notification';
                Image = Email;
                ToolTip = 'Send an email notification.';
                trigger OnAction()
                begin
                    Rec.SendEmailNotification();
                end;

            }

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
            action(MarkAsCompleted)
            {
                ApplicationArea = All;
                Caption = 'Mark As Completed';
                Image = Completed;
                ToolTip = 'Mark as completed';
                trigger OnAction()
                begin
                    Rec.MarkAsCompleted();
                end;
            }

            action("Close Case")
            {
                ApplicationArea = All;
                Caption = 'Close Case';
                Image = Close;
                ToolTip = 'close the case';
                trigger OnAction()
                begin
                    Rec.CloseCase();
                end;
            }

            action("Create PCA")
            {
                ApplicationArea = All;
                Caption = 'Create PCA';
                Image = Create;
                ToolTip = 'Create PCA';
                trigger OnAction()
                var
                    prBasicpayPCA: Record "prBasic pay PCA";
                    DisciplineDocStage: Record "Discipline Document Stage";
                    // Mgmt: Codeunit "Vehicle Management";
                    CnfmPayChange: Label 'Are you sure that you would like to create a PCA?';
                    PCACreated: Label 'A new PCA %1, has been created successfully!';
                    PCASubj: Label 'New PCA %1 Created';
                begin
                    Rec.TestField(Recommendations);

                    if not Confirm(CnfmPayChange, false) then exit;

                    prBasicpayPCA.Init();
                    prBasicpayPCA.Validate("Employee Code", GetAccusedEmployeeRecord()."No.");
                    prBasicpayPCA.Comments := CopyStr(Rec.Recommendations, 1, 200);
                    prBasicpayPCA."Effective Date" := Rec."Effective Date";
                    prBasicpayPCA."Source Document" := prBasicpayPCA."Source Document"::Disciplinary;
                    prBasicpayPCA."Document No" := Rec."Discipline Case No.";
                    prBasicpayPCA.Insert(true);


                    DisciplineDocStage.Reset();
                    DisciplineDocStage.SetRange(Code, Rec."Document Stage");
                    if DisciplineDocStage.FindFirst() then
                        DisciplineDocStage.TestField("Email Recepient");

                    // Mgmt.SendEmail(DisciplineDocStage."Email Recepient", '',
                    // StrSubstNo(PCASubj, prBasicpayPCA."Change Advice Serial No."),
                    // 'Greetings,', Recommendations);

                    Message(PCACreated, prBasicpayPCA."Change Advice Serial No.");
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
                    CustomAppr: Codeunit "Custom Approvals Codeunit";
                    Variant: Variant;
                begin
                    Variant := Rec;
                    CustomAppr.OnCancelDocApprovalRequest(Variant);
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
                Caption = 'Home', Comment = 'Generated from the PromotedActionCategories property index 0.';
            }
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Send Email Notification_Promoted"; "Send Email Notification")
                {
                }
                actionref(Attachments_Promoted; Attachments)
                {
                }
                actionref(MarkAsCompleted_Promoted; MarkAsCompleted)
                {
                }
                actionref("Close Case_Promoted"; "Close Case")
                {
                }
                actionref("Create PCA_Promoted"; "Create PCA")
                {
                }
            }
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
                actionref(Reject_Promoted; Reject)
                {
                }
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
    var
        DisciplineDtls: Record "Discipline Details";
        NoOfDetail: Integer;
    begin
        DisciplineDtls.Reset();
        DisciplineDtls.SetRange("Discipline Case No.", "Discipline Case No.");
        NoOfDetail := DisciplineDtls.Count;

        "Discipline Detail No." := "Discipline Case No." + '-0' + Format(NoOfDetail);

    end;

    trigger OnOpenPage()
    begin
        UpdatePageControls
    end;

    trigger OnAfterGetCurrRecord()
    begin
        UpdatePageControls
    end;

    trigger OnAfterGetRecord()
    begin
        UpdatePageControls
    end;


    procedure UpdatePageControls()
    var
        DisciplineDocStage: Record "Discipline Document Stage";
    begin
        DisciplineDocStage.Reset();
        DisciplineDocStage.SetRange(Code, "Document Stage");
        DisciplineDocStage.SetRange("Requires CJ Remarks", true);
        RequiresCJRemarks := DisciplineDocStage.FindFirst();
    end;

    var
        RequiresCJRemarks: Boolean;
}
