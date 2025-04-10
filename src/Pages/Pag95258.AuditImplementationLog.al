

page 95258 "Audit Implementation Log"
{
    PageType = Card;
    SourceTable = "Audit Followup Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Primary RC ID"; Rec."Primary RC ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary RC ID field.';
                }
                field("Reporting As At"; Rec."Reporting As At")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporting As At field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
            }
            part("Open Audit Management Actions"; "Implementation Log Lines")
            {
                Caption = 'Open  Management Actions';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Suggest Open Audit Tasks")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                ToolTip = 'Executes the Suggest Open Audit Tasks action.';
                trigger OnAction()
                begin
                    /*This Action is a processing-only report used by the lead auditee to suggest the audit
                   actions/tasks that are still pending implementation by the auditee (The pending audit
                   actions/tasks are those that the auditee status is either Planned or Ongoing, and they
                   are also yet to be verified by the auditor as closed).
                   2. The Action transfers field values from the Audit Management Action Ledger table to
                   the Audit Implementation Log Line table*/

                    RiskManagement.FnSuggestILSReportLines(AuditManagementActionLedger, AuditImplementationLogLine, Rec);
                    Message('Audit Implementation Log Line(s) Inserted successfully');

                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    /*This Action is used to post the audit implementation status report (AISR) in order to
                    update the implementation details of the posted audit findings.
                    2. This Action can only be executed for fully approved documents (Status::Released and
                    Posted::False).
                    3. This Action transfers field values from the Audit Implementation Log Line to the Audit
                    Management Action Ledger table*/


                    Rec.TestField(Status, Rec.Status::Released);
                    //TESTFIELD(Posted,FALSE);

                    RiskManagement.FnPostILSReport(AuditManagementActionLedger, AuditImplementationLogLine, Rec);


                    Rec.Posted := true;
                    Rec.Modify;

                    Message('Audit Implementation Status Report %1 posted succesfully', Rec."Document No.");

                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    Message('Send');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = "CancelApproval Request";
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Message('cancelled');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Rec.SetRange("Document Type", Rec."Document Type");
                    if Rec.FindSet then
                        Report.Run(95022, true, true, Rec);
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDOc;
                ToolTip = 'Executes the Release action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify(true);
                    Message('Document released successfully');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = Reopen;
                ToolTip = 'Executes the Reopen action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);
                    Message('Document reopened successfully');
                end;
            }
            action("Notify Implementation Lead")
            {
                ApplicationArea = Basic;
                Image = SendEmailPDF;
                ToolTip = 'Executes the Notify Implementation Lead action.';
                trigger OnAction()
                begin
                    RiskManagement.FNnotifyImplementationLead(Rec);
                    Message('Notified Successfully');
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Suggest Open Audit Tasks_Promoted"; "Suggest Open Audit Tasks")
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
                actionref("Send Approval Request_Promoted"; "Send Approval Request")
                {
                }
                actionref("Cancel Approval Request_Promoted"; "Cancel Approval Request")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
                actionref("Notify Implementation Lead_Promoted"; "Notify Implementation Lead")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Implementation Status Report";
    end;

    var
        RiskManagement: Codeunit "Risk Management";
        AuditManagementActionLedger: Record "Audit Management Action Ledger";
        AuditManagementAction: Record "Audit Management Action";
        AuditImplementationLogLine: Record "Audit Implementation Log Line";
}

#pragma implicitwith restore

