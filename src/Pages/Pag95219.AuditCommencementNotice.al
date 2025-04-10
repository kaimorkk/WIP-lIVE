

page 95219 "Audit Commencement Notice"
{
    PageType = Card;
    SourceTable = "Audit Mobilization Header1";

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
            part(Control23; "Audit ACN Required Document Li")
            {
                Caption = 'Required Preliminary Documents/Information';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
            group("Audit Engagement Details")
            {
                field("Audit Plan ID"; Rec."Audit Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan ID field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned End Date field.';
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
                field("Auditee Notice Response No."; Rec."Auditee Notice Response No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Notice Response No. field.';
                }
            }
            group("Audit Entrance Meeting Details")
            {
                field("Entrance Meeting Venue"; Rec."Entrance Meeting Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entrance Meeting Venue field.';
                }
                field("Entrance Meeting Start Date"; Rec."Entrance Meeting Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entrance Meeting Start Date field.';
                }
                field("Entrance Meeting Start Time"; Rec."Entrance Meeting Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entrance Meeting Start Time field.';
                }
                field("Entrance Meeting End Date"; Rec."Entrance Meeting End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entrance Meeting End Date field.';
                }
                field("Entrance Meeting End Time"; Rec."Entrance Meeting End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entrance Meeting End Time field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Meeting Medium"; Rec."Meeting Medium")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Medium field.';
                }
                field("Entrace Meeting No."; Rec."Entrace Meeting No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entrace Meeting No. field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Overview)
            {
                ApplicationArea = Basic;
                Image = "Action";
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Document No.");
                RunPageView = where("Section Type" = filter(Overview));
                ToolTip = 'Executes the Overview action.';
            }
            action(Scope)
            {
                ApplicationArea = Basic;
                Image = Account;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Document No.");
                RunPageView = where("Section Type" = filter(Scope));
                ToolTip = 'Executes the Scope action.';
            }
            action("Scope Exclusions")
            {
                ApplicationArea = Basic;
                Image = Accounts;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Document No.");
                RunPageView = where("Section Type" = filter("Scope Exclusion"));
                ToolTip = 'Executes the Scope Exclusions action.';
            }
            action("Audit Objectives")
            {
                ApplicationArea = Basic;
                Image = Opportunity;
                RunObject = Page "Audit Project Objectives";
                RunPageLink = "Engagement ID" = field("Document No.");
                ToolTip = 'Executes the Audit Objectives action.';
            }
            action("Audit Procedures")
            {
                ApplicationArea = Basic;
                Image = Allocations;
                RunObject = Page "Audit Project Procedures";
                RunPageLink = "Engagement ID" = field("Document No.");
                ToolTip = 'Executes the Audit Procedures action.';
            }
            action("Auditt Checklists")
            {
                ApplicationArea = Basic;
                Image = Check;
                RunObject = Page "Audit Project Checklists";
                RunPageLink = "Engagement ID" = field("Document No.");
                ToolTip = 'Executes the Auditt Checklists action.';
            }
            action("Audit Locations/Sites")
            {
                ApplicationArea = Basic;
                Image = Bin;
                RunObject = Page "Audit Project Locations";
                RunPageLink = "Engagement ID" = field("Document No.");
                ToolTip = 'Executes the Audit Locations/Sites action.';
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField(Posted, false);
                    RiskManagement.FnPostACN(Rec, AuditACNRequiredDocument);
                    Rec.Posted := true;
                    Rec.Modify;
                end;
            }
            action("Audit Engagement Letter")
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Audit Engagement Letter action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(95015, true, true, Rec);
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
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Message('Done');
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
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                ToolTip = 'Executes the Release action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify;
                    Message('Document Released successfully');
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
                    Message('Document Reopened successfully');
                end;
            }
            action("Notify Auditee")
            {
                ApplicationArea = Basic;
                Image = SendEmailPDF;
                ToolTip = 'Executes the Notify Auditee action.';
                trigger OnAction()
                begin
                    RiskManagement.FNnotifyAuditee(Rec);
                    Message('Notified Successfully');
                end;
            }
            action("Notify Auditor")
            {
                ApplicationArea = Basic;
                Image = SendEmailPDF;
                ToolTip = 'Executes the Notify Auditor action.';
                trigger OnAction()
                begin
                    RiskManagement.FNnotifyAudiTOR2(Rec);
                    Message('Notified Successfully');
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Overview_Promoted; Overview)
                {
                }
                actionref(Scope_Promoted; Scope)
                {
                }
                actionref("Scope Exclusions_Promoted"; "Scope Exclusions")
                {
                }
                actionref("Audit Objectives_Promoted"; "Audit Objectives")
                {
                }
                actionref("Audit Procedures_Promoted"; "Audit Procedures")
                {
                }
                actionref("Auditt Checklists_Promoted"; "Auditt Checklists")
                {
                }
                actionref("Audit Locations/Sites_Promoted"; "Audit Locations/Sites")
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
                actionref("Audit Engagement Letter_Promoted"; "Audit Engagement Letter")
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
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
                actionref("Notify Auditee_Promoted"; "Notify Auditee")
                {
                }
                actionref("Notify Auditor_Promoted"; "Notify Auditor")
                {
                }
            }
        }
    }

    var
        RiskManagement: Codeunit "Risk Management";
        AuditACNRequiredDocument: Record "Audit ACN Required Document";
}

#pragma implicitwith restore

