

page 69613 "Staff Establishment Plan"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Staff Establishment Plan";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = Basic;
                    //enabled = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Staff Establishment"; Rec."Total Staff Establishment")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Recruitment Plans"; Rec."No. of Recruitment Plans")
                {
                    ApplicationArea = Basic;
                }
                field("Approved No."; Rec."Approved No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Approved No field.';
                }
                field("Actual Active"; Rec."Actual Active")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Actual Active field.';
                }
                field(Variance; Rec.Variance)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Variance field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            group("External Approvals")
            {
                Caption = 'Approvals';

                field("Board Approved"; Rec."Board Approved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Board Approved field.', Comment = '%';
                }
                field("Treasury Approved"; Rec."Treasury Approved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Treasury Approved field.', Comment = '%';
                }
                field("HRM Approved"; Rec."HRM Approved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HRM Approved field.', Comment = '%';
                }
            }
            part(Control12; "Establishment Position")
            {
                Caption = 'Establishment Positions';
                SubPageLink = "Staff Establishment Code" = field(Code);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            // part(Control9; "Establishment Factbox")
            // {
            //     Editable = false;
            //     ApplicationArea = Basic;
            // }
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
            action("Suggest Job Positions")
            {
                ApplicationArea = Basic;
                Image = Suggest;

                trigger OnAction()
                begin

                    StaffEstablishmentTaskLines.Reset;
                    StaffEstablishmentTaskLines.SetRange("Staff Establishment Code", Rec.Code);
                    if StaffEstablishmentTaskLines.FindSet then begin
                        StaffEstablishmentTaskLines.DeleteAll;
                    end;

                    Positions.Reset;
                    Positions.SetRange("Position Category", Positions."position category"::Employee);
                    // Positions.SetFilter("Cadre Type", '<>%1', Positions."cadre type"::"Common Cadre");
                    if Positions.FindSet then begin
                        repeat
                            StaffEstablishmentTaskLines.Init;
                            StaffEstablishmentTaskLines."Job ID" := Positions."Position ID";
                            StaffEstablishmentTaskLines."Department Code" := Positions.Department;
                            StaffEstablishmentTaskLines."Directorate Code" := Positions.Directorate;
                            StaffEstablishmentTaskLines."Job Title" := Positions."Job Title";
                            StaffEstablishmentTaskLines."Designation Group" := Positions."Designation Group";
                            StaffEstablishmentTaskLines."Staff Establishment Code" := Rec.Code;
                            StaffEstablishmentTaskLines.Status := Positions.Status;
                            StaffEstablishmentTaskLines."Cadre Type" := StaffEstablishmentTaskLines."cadre type"::"Normal Cadre";
                            StaffEstablishmentTaskLines.Insert;

                        until
                      Positions.Next = 0;
                    end;



                    //CadreHeader
                    CadreHeader.Reset;
                    CadreHeader.SetFilter(Code, '<>%1', '');
                    if CadreHeader.FindSet then begin
                        repeat
                            StaffEstablishmentTaskLines.Init;
                            StaffEstablishmentTaskLines."Job ID" := CadreHeader."Default Position";
                            CadreHeader.CalcFields(Department, Directorate, "Designation Group");
                            StaffEstablishmentTaskLines."Department Code" := CadreHeader.Department;
                            StaffEstablishmentTaskLines."Directorate Code" := CadreHeader.Directorate;
                            StaffEstablishmentTaskLines."Job Title" := CadreHeader.Description;
                            StaffEstablishmentTaskLines."Designation Group" := CadreHeader."Designation Group";
                            StaffEstablishmentTaskLines."Staff Establishment Code" := Rec.Code;
                            StaffEstablishmentTaskLines."Cadre Type" := StaffEstablishmentTaskLines."cadre type"::"Common Cadre";
                            StaffEstablishmentTaskLines."Cadre Code" := CadreHeader.Code;
                            StaffEstablishmentTaskLines.Insert;

                        until
                      CadreHeader.Next = 0;
                    end;
                end;
            }
            separator(Action23)
            {
            }
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////if //ApprovalsMgmt.CheckCustomerApprovalsWorkflowEnabled(Rec) THEN
                        // //ApprovalsMgmt.OnSendCustomerForApproval(Rec);
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
                        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
                    begin
                        ////ApprovalsMgmt.OnCancelCustomerApprovalRequest(Rec);
                        //WorkflowWebhookManagement.FindAndCancel(RECORDID);
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
                // RunObject = Page "Duty Stations1";
            }
        }
        area(reporting)
        {
            action("Global Staff Establishment")
            {
                ApplicationArea = Basic;
                Image = "Report";
                //RunObject = Report "Global Staff Establishment";
                trigger OnAction()
                begin
                    // Report.Run(Report::"Global Staff Establishment", true, false, Rec);

                end;
            }
            action("Staff Establishment")
            {
                ApplicationArea = Basic;
                Image = "Report";
                // RunObject = Report "Staff Establishment";
            }
            action("Detailed Staff Establishment")
            {
                ApplicationArea = Basic;
                Image = "Report";
                // RunObject = Report "Detailed Staff Establishment";
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Global Staff Establishment_Promoted"; "Global Staff Establishment")
                {
                }
                actionref("Staff Establishment_Promoted"; "Staff Establishment")
                {
                }
                actionref("Detailed Staff Establishment_Promoted"; "Detailed Staff Establishment")
                {
                }
                actionref("Suggest Job Positions_Promoted"; "Suggest Job Positions")
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

    trigger OnOpenPage()
    begin
        if Rec.Code <> '' then begin
            EntryNo := 0;
            StaffEstablishmentTaskLines.Reset;
            StaffEstablishmentTaskLines.SetRange("Staff Establishment Code", Rec.Code);
            if StaffEstablishmentTaskLines.FindSet then begin
                repeat
                    StaffEstablishmentTaskLines.CalcFields("Approved No.");
                    EntryNo := StaffEstablishmentTaskLines."Approved No." + EntryNo;
                until StaffEstablishmentTaskLines.Next = 0;
            end;
            Rec."Total Staff Establishment" := EntryNo;
            Rec.CalcFields("Approved No.");
            Rec.CalcFields("Actual Active");
            Rec.Variance := Rec."Approved No." - Rec."Actual Active";
            Rec.MODIFY(false);
        end;
    end;

    var
        StaffEstablishmentTaskLines: Record "Establishment Plan Position";
        Positions: Record "Company Positions";
        EntryNo: Integer;
        CadreHeader: Record "Cadre Header";
        HRSetup: Record "Human Resources Setup";
}

#pragma implicitwith restore

