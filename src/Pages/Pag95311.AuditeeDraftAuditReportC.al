

page 95311 "Auditee Draft Audit Report C"
{
    Caption = 'Draft Audit Report';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Audit Execution Header";

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
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Management Comment Deadline"; Rec."Management Comment Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Management Comment Deadline field.';
                }
                field("No. Of Findings"; Rec."No. Of Findings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Findings field.';
                }
                field("No. of Audit Recommendations"; Rec."No. of Audit Recommendations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Audit Recommendations field.';
                }
                field("No. of Filed Audit Wor  Papers"; Rec."No. of Filed Audit Wor  Papers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Filed Audit Wor  Papers field.';
                }
                field("No. of Management Comments"; Rec."No. of Management Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Management Comments field.';
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
            part("Audit Findings"; "Audit Execution Management Lin")
            {
                Caption = 'Management Comments';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID");
                ApplicationArea = Basic;
            }
            group("Audit Engagement Details")
            {
                Caption = 'Audit Engagement Details';
                field("Audit Plan ID"; Rec."Audit Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan ID field.';
                }
                field("Audit  Work Type"; Rec."Audit  Work Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit  Work Type field.';
                }
                field("Engagement Name"; Rec."Engagement Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Name field.';
                }
                field("Engagement Category"; Rec."Engagement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Category field.';
                }
                field("Auditor Type"; Rec."Auditor Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditor Type field.';
                }
                field("Audit Lead ID"; Rec."Audit Lead ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Lead ID field.';
                }
                field("Auditee Type"; Rec."Auditee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Primary Auditee ID"; Rec."Primary Auditee ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Auditee ID field.';
                }
                field("Auditee Name"; Rec."Auditee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Name field.';
                }
                field("Auditee Lead ID"; Rec."Auditee Lead ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Lead ID field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Suggest Audit  Findings")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Visible = false;
                ToolTip = 'Executes the Suggest Audit  Findings action.';
                trigger OnAction()
                begin
                    //RiskManagement.FnSuggestDAReportLines(AuditExecutionFinding, AuditFindingLocation, AuditFindingRecommendation, AuditManagementComment, AuditManagementAction, Rec, AuditExecutionImplication);
                    Message('Audit Findings Suggested successfuly');
                end;
            }
            action("Publish Draft Report")
            {
                ApplicationArea = Basic;
                Caption = 'Submit';
                Image = Pause;
                ToolTip = 'Executes the Submit action.';
                trigger OnAction()
                begin
                    //Set Published =True
                    //Published:=TRUE;
                    //MODIFY;

                    //e-Notify the Auditee Lead,notifying them of the attached DAR and the management comment
                    //deadline (Deadline by which they should have responded back to the
                    //lead auditor)

                    //Notify lead auditor that the auditee has given the mgt comments have been submitted kindly log in and action

                    RiskManagement.FNnotifyAuditor(AuditExecutionHeader);
                    Message('Management comment submitted successfully');
                end;
            }
            action("Make Final Audit Report")
            {
                ApplicationArea = Basic;
                Image = MakeDiskette;
                Visible = false;
                ToolTip = 'Executes the Make Final Audit Report action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField(Published, true);
                    RiskManagement.FnMakeFinalAuditReportFromDraftAuditReport(Rec, AuditExecutionFinding, AuditFindingLocation, AuditFindingRecommendation, AuditManagementAction, AuditManagementComment);

                    /*This Action is used to convert the DAR to the Final Audit Report, for findings
                    that are Open (These are findings that the auditee agrees with or that they
                    could not provide substantiating evidence to have the auditor close them at
                    the draft audit report) stage. The Action performs field value transfer for the
                    Audit Execution Finding, Audit Finding Location, Audit Finding
                    Recommendation and Audit Management Action tables from the Draft Audit
                    Report Card to the Final Audit Report Card*/
                    //MESSAGE('Final Audit Report %1 created successfully');

                end;
            }
            action("Audit Procedures")
            {
                ApplicationArea = Basic;
                Image = AdjustExchangeRates;
                RunObject = Page "Audit Project Procedures";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                RunPageMode = View;
                Visible = false;
                ToolTip = 'Executes the Audit Procedures action.';
            }
            action("Transaction Testing Approach")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                RunObject = Page "Audit Checklist Test Approache";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID");
                RunPageMode = View;
                Visible = false;
                ToolTip = 'Executes the Transaction Testing Approach action.';
            }
            action("Audit Findings Summary")
            {
                ApplicationArea = Basic;
                Image = BankAccountRec;
                RunObject = Page "Audit Execution Findings";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID");
                Visible = false;
                ToolTip = 'Executes the Audit Findings Summary action.';
            }
            action("Audit Recommendations")
            {
                ApplicationArea = Basic;
                Image = BookingsLogo;
                RunObject = Page "Audit Finding Recommendations";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID");
                Visible = false;
                ToolTip = 'Executes the Audit Recommendations action.';
            }
            action("Filed Audit Working Papers")
            {
                ApplicationArea = Basic;
                Image = Files;
                RunObject = Page "Filed Audit Working Papers";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                Visible = false;
                ToolTip = 'Executes the Filed Audit Working Papers action.';
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Visible = false;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    Message('Sent');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Visible = false;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Message('Cancelled');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Visible = false;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Visible = false;
                ToolTip = 'Executes the Release action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify;
                    Message('Document released successfully');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Visible = false;
                ToolTip = 'Executes the Reopen action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;
                    Message('Document reopened successfully');
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                RunObject = Page "Dimension Set Entries";
                Visible = false;
                ToolTip = 'Executes the Dimensions action.';
                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Visible = false;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(95019, true, true, Rec);
                end;
            }
            action(Attachments)
            {
                ApplicationArea = Basic;
                Image = Attach;
                Visible = false;
                ToolTip = 'Executes the Attachments action.';
                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Suggest Audit  Findings_Promoted"; "Suggest Audit  Findings")
                {
                }
                actionref("Publish Draft Report_Promoted"; "Publish Draft Report")
                {
                }
                actionref("Make Final Audit Report_Promoted"; "Make Final Audit Report")
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
                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Audit Procedures_Promoted"; "Audit Procedures")
                {
                }
                actionref("Transaction Testing Approach_Promoted"; "Transaction Testing Approach")
                {
                }
                actionref("Audit Findings Summary_Promoted"; "Audit Findings Summary")
                {
                }
                actionref("Filed Audit Working Papers_Promoted"; "Filed Audit Working Papers")
                {
                }
                actionref("Audit Recommendations_Promoted"; "Audit Recommendations")
                {
                }
            }
        }
    }

    var
        RiskManagement: Codeunit "Risk Management";
        AuditExecutionFinding: Record "Audit Execution Finding";
        AuditFindingLocation: Record "Audit Finding Location";
        AuditFindingRecommendation: Record "Audit Finding Recommendation";
        AuditManagementComment: Record "Audit Management Comment";
        AuditManagementAction: Record "Audit Management Action";
        AuditExecutionHeader: Record "Audit Execution Header";
        AuditMobilizationHeader: Record "Audit Mobilization Header1";
        AuditExecutionImplication: Record "Audit Execution Implication";
}

#pragma implicitwith restore

