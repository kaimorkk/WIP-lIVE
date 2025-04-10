

page 95303 "Final Audit Report Card"
{
    Caption = 'Final Audit Report';
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
            part("Audit Findings"; "Audit Execution Finding Lines")
            {
                Caption = 'Audit Findings';
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
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Released);
                    //TESTFIELD(Posted,FALSE);
                    //TESTFIELD(Published,TRUE);
                    /*Destination Table Source Table
                    a) Audit Finding Ledger >>Audit Execution Finding
                    b) Audit Recommendation Ledger >>Audit Finding Recommendation
                    c) Audit Management Action Ledger >>Audit Management Action*/
                    //Close the audit project to comleted
                    //Required Documents set t

                    //RiskManagement.FnCheckIfAnyOpenLinesExist(Rec,AuditExecutionFinding);
                    RiskManagement.FnPostFinalAuditReport(AuditExecutionFinding, AuditFindingRecommendation, AuditManagementAction, Rec);
                    RiskManagement.FnUpdateAuditProjectFromFinalAuditReport(AuditProject, Rec);
                    Rec.Posted := true;
                    Rec.Modify;
                    Message('Final Audit Report %1 posted successfuly', Rec."Document No.");

                end;
            }
            action("Publish Final Report")
            {
                ApplicationArea = Basic;
                Image = Pause;
                ToolTip = 'Executes the Publish Final Report action.';
                trigger OnAction()
                begin
                    //Set Published =True
                    /*This Action is used to publish the FAR so that the auditee lead can receive email notification (With a pdf copy of
                    the FAR)
                    */
                    /*If Audit & Assurance Setup.e_Notify Audit Mobilization Notice::TRUE then the system shall send an email
                    notification to the Auditee Lead, notifying them of the attached FAR */
                    RiskManagement.FnPublishFinalReport(Rec);

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
                    /*This Action is used to convert the DAR to the Final Audit Report, for findings
                    that are Open (These are findings that the auditee agrees with or that they
                    could not provide substantiating evidence to have the auditor close them at
                    the draft audit report) stage. The Action performs field value transfer for the
                    Audit Execution Finding, Audit Finding Location, Audit Finding
                    Recommendation and Audit Management Action tables from the Draft Audit
                    Report Card to the Final Audit Report Card*/
                    Message('Final Audit Report %1 created successfully');

                end;
            }
            action("Audit Procedures")
            {
                ApplicationArea = Basic;
                Image = AdjustExchangeRates;
                RunObject = Page "Audit Project Procedures";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                RunPageMode = View;
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
                ToolTip = 'Executes the Audit Recommendations action.';
            }
            action("Filed Audit Working Papers")
            {
                ApplicationArea = Basic;
                Image = Files;
                RunObject = Page "Filed Audit Working Papers";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Filed Audit Working Papers action.';
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
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
            action(Overview)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Overview action.';
                trigger OnAction()
                begin
                    Message('Good');
                end;
            }
            action(Scope)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Scope action.';
                trigger OnAction()
                begin
                    Message('Good');
                end;
            }
            action("Scope Exclusions")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Scope Exclusions action.';
                trigger OnAction()
                begin
                    Message('Good');
                end;
            }
            action("Audit Objectives")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Audit Objectives action.';
                trigger OnAction()
                begin
                    Message('Good');
                end;
            }
            action("Audit Checklist")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Audit Checklist action.';
                trigger OnAction()
                begin
                    Message('Good');
                end;
            }
            action("Audit Locations/Sites")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Audit Locations/Sites action.';
                trigger OnAction()
                begin
                    Message('Good');
                end;
            }
            action("Audit Engagement Team")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Audit Engagement Team action.';
                trigger OnAction()
                begin
                    Message('Good');
                end;
            }
            action("Required Documents")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Required Documents action.';
                trigger OnAction()
                begin
                    Message('Good');
                end;
            }
            action("Risk Analysis")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Risk Analysis action.';
                trigger OnAction()
                begin
                    Message('Good');
                end;
            }
            action("Management Comments")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Management Comments action.';
                trigger OnAction()
                begin
                    Message('Good');
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Post_Promoted; Post)
                {
                }
                actionref("Publish Final Report_Promoted"; "Publish Final Report")
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
        AuditFindingRecommendation: Record "Audit Finding Recommendation";
        AuditManagementAction: Record "Audit Management Action";
        AuditExecutionHeader: Record "Audit Execution Header";
        AuditProject: Record "Audit Project";
}

#pragma implicitwith restore

