page 50133 "Functional Establishment Card"
{
    Caption = 'Functional Establishment Card';
    PageType = Card;
    SourceTable = "Staff Establishment Plan";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Duty Station"; Rec."Duty Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duty Station field.';
                }
                field("Station Name"; "Station Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("Establishment Type"; Rec."Establishment Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Establishment Type field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("No. of Recruitment Plans"; Rec."No. of Recruitment Plans")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. of Recruitment Plans field.';
                }
                field("Total Staff Establishment"; Rec."Total Staff Establishment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Staff Establishment field.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Global Consolidation"; Rec."Global Consolidation")
                {
                    ApplicationArea = all;
                }
            }
            part(Control12; "Functional Establishment List")
            {
                Caption = 'Establishment Positions';
                SubPageLink = "Staff Establishment Code" = field(Code), "Directorate Code" = field("Duty Station");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control9; "Establishment Factbox")
            {
                Editable = false;
                ApplicationArea = Basic;
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "No." = field("Code"), "Table ID" = const(Database::"Staff Establishment Plan");
            }
            systempart(Control5; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control4; Notes)
            {
                ApplicationArea = Notes;
            }

        }
    }
    actions
    {
        area(processing)
        {

            action("Export To Excel")
            {
                ApplicationArea = Basic;
                Image = ExportToExcel;
                //  RunObject = XMLport UnknownXMLport69103;
            }
            separator(Action21)
            {
            }
            action("Import from Excel")
            {
                ApplicationArea = Basic;
                Image = ImportExcel;
                // RunObject = XMLport UnknownXMLport69103;
            }
            separator(Action18)
            {
            }
            action("Establishment Voucher")
            {
                ApplicationArea = Basic;
                Image = Print;
            }
            action(DocAttach)
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
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the approval request.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    ToolTip = 'Delegate the approval to a substitute approver.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = All;
                    Caption = 'Comments';
                    Image = ViewComments;
                    ToolTip = 'View or add comments for the record.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval to change the record.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);
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
                        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
                    begin
                        VarVariant := Rec;
                        ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);
                        ;
                        WorkflowWebhookManagement.FindAndCancel(RECORDID);
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
        area(navigation)
        {
            action("Manpower Plans")
            {
                ApplicationArea = Basic;
                Image = Planning;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category8;
                RunObject = Page "Establishment Planning Lines";
                RunPageMode = View;
            }
            action("Job Grades")
            {
                ApplicationArea = Basic;
                Image = JobLedger;
                RunObject = Page "Job Grades";
            }
            action("Duty Stations")
            {
                ApplicationArea = Basic;
                Image = DeleteAllBreakpoints;
                RunObject = Page "Duty Stations1";
            }
        }
        area(reporting)
        {
            action("Functional Staff Establishment")
            {
                ApplicationArea = Basic;
                Image = "Report";
                //RunObject = Report "Functional Establishment Plan";
                trigger OnAction()
                begin
                    Report.Run(Report::"Functional Establishment Plan", true, false, Rec);

                end;
            }
            action("Detailed Staff Establishment")
            {
                ApplicationArea = Basic;
                Image = "Report";
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Report "Detailed Staff Establishment";
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Functional Staff Establishment_Promoted"; "Functional Staff Establishment")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Report)
            {
                actionref("Establishment Voucher_Promoted"; "Establishment Voucher")
                {
                }
            }
            group(Category_Category5)
            {
                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Category7)
            {
                actionref("Export To Excel_Promoted"; "Export To Excel")
                {
                }
                actionref("Import from Excel_Promoted"; "Import from Excel")
                {
                }
            }
            group(Category_Category8)
            {
                actionref(DocAttach_Promoted; DocAttach)
                {
                }
                actionref("Job Grades_Promoted"; "Job Grades")
                {
                }
                actionref("Duty Stations_Promoted"; "Duty Stations")
                {
                }
            }
        }

    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Establishment Type" := Rec."Establishment Type"::Functional;
    end;

    var
        StaffEstablishmentTaskLines: Record "Establishment Plan Position";
        Positions: Record "Company Positions";
        EntryNo: Integer;
        CadreHeader: Record "Cadre Header";
        HRSetup: Record "Human Resources Setup";
        VarVariant: Variant;
}
