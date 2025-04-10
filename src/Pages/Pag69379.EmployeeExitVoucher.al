page 69379 "Employee Exit Voucher"
{
    PageType = Card;
    SourceTable = "Employee Exit header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(DocumentNo; "Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNames; "Employee Names")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ExitMethod; "Exit Method")
                {
                    ApplicationArea = Basic;
                }
                field(JobId; "Job Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ReasonsCode; "Reasons Code")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedOn; "Created On")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDate; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Important Dates")
            {
                field(DateofJoin; "Date of Join")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(LastworkingDate; "Last working Date")
                {
                    ApplicationArea = Basic;
                }
                field(NoticeDate; "Notice Date")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeExitDate; "Employee Exit Date")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Days Due Payable"; Rec."Leave Days Due Payable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Days Due Payable field.';
                }
                field("Pay in Line of Notice"; Rec."Pay in Lieu of Notice")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay in Line of Notice field.';
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Period field.';
                }
            }
            group(Statistics)
            {
                field(NoofHandOverNotes; "No of Hand Over Notes")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoofOpenHandOverNotes; "No of Open Hand Over Notes")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoofOpenHandClearedNotes; "No of Open Hand Cleared Notes")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control23; "Exit Plan Lines")
            {
                SubPageLink = "Exit Header No" = field("Document No."),
                              "Document Type" = field("Document Type");
                ApplicationArea = All;
            }
        }

        area(FactBoxes)
        {
            part(Attachment; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Employee Exit header"),
                              "No." = field("Document No.");
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
        area(navigation)
        {
            group(Functions)
            {
                Caption = 'F&unctions';
            }
            action("Create Hand Over Vouchers")
            {
                ApplicationArea = Basic;
                Image = BusinessRelation;

                trigger OnAction()
                var
                    ExitMethods: Record "Exit Methods";
                begin
                    Rec.TestField("Exit Method");

                    ExitMethods.Reset();
                    ExitMethods.SetRange("Code", Rec."Exit Method");
                    ExitMethods.SetRange("Is Death", true);
                    if ExitMethods.FindFirst() then
                        Error('You cannot create a hand over voucher for an employee who is deceased.')
                    else
                        Recruitment.FnCreateHandOverVoucher(Rec);
                end;
            }

            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = '&Send Approval Request';
                Image = SendApprovalRequest;
                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    Variant: Variant;
                begin
                    Variant := Rec;
                    if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(Variant) then
                        ApprovalsMgmt.OnSendDocForApproval(Variant);
                end;

            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = '&Cancel Approval Request';
                Image = Cancel;
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
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = PrintForm;
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

                actionref("Create Hand Over Vouchers_Promoted"; "Create Hand Over Vouchers")
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

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Document', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        "Document Type" := "document type"::"Exit Voucher";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Exit Voucher";
    end;

    trigger OnOpenPage()
    begin
        "Document Type" := "document type"::"Exit Voucher";
    end;

    var
        Recruitment: Codeunit "Recruitment";
    // testcodeunit: Codeunit HRPortal;

    /// ApprovalMgmt: Codeunit approvals
}

