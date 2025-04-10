

page 95098 "Project Risk Management Plan"
{
    PageType = Card;
    SourceTable = "Risk Management Plan";

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
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan ID"; Rec."Work Execution Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Consolidated Risk Mgt Plan No"; Rec."Consolidated Risk Mgt Plan No")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Mission"; Rec."Primary Mission")
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                    Visible = false;
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Manager';
                }
                field("CO -  Principal Investigator"; Rec."CO -  Principal Investigator")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assistant Project Manager';
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Risk Likelihood Rate Scale ID"; Rec."Risk Likelihood Rate Scale ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Risk Impact Rating Scale ID"; Rec."Risk Impact Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Overall Risk Rating Scale ID"; Rec."Overall Risk Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Risk Appetite Rating Scale ID"; Rec."Risk Appetite Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control41; "Project Register Lines")
            {
                Caption = 'Project Register';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control44; "RMP Statistics")
            {
                Caption = 'Risk Statistics';
                SubPageLink = "Document No" = field("Document No"),
                              "Document Type" = field("Document Type");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Purpose(Goals & Objectives)")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                RunObject = Page "RMP Objectives";
            }
            action("Risk & Compliance Roles")
            {
                ApplicationArea = Basic;
                Image = Restore;
                RunObject = Page "RMP Roles";
            }
            action("Risk Register Summary")
            {
                ApplicationArea = Basic;
                Image = Print;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document Type", Rec."Document Type");
                    Rec.SetRange("Document No", Rec."Document No");
                    if Rec.FindSet then
                        Report.Run(95008, true, false, Rec);
                end;
            }
            action("Copy Document")
            {
                ApplicationArea = Basic;
                Image = CopyDocument;

                trigger OnAction()
                begin
                    ObjRiskMgt.FnCopyRiskManagementPlanDocument(Rec, RMPLine, Rec."Document Type", '');
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify;
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;
                end;
            }
            action("New Risk Vouchers")
            {
                ApplicationArea = Basic;
                Image = New;
                RunObject = Page "New Risk Vouchers";
                RunPageView = where("Document Type" = filter("New Risk Voucher"));
            }
            action("Risk Status Reports")
            {
                ApplicationArea = Basic;
                Image = Status;
                RunObject = Page "Periodic Risk Status Reports";
            }
            action("Risk Incident Logs")
            {
                ApplicationArea = Basic;
                Image = Log;
                RunObject = Page "Periodic Risk Status Reports";
            }
            action("Risk Incident Ledger Entries")
            {
                ApplicationArea = Basic;
                Image = LedgerEntries;
                RunObject = Page "New Risk Voucher Lines";
            }
            action("Risk Ownership")
            {
                ApplicationArea = Basic;
                Image = "Order";
                RunObject = Page "RMP Line Risk Ownerships";
                RunPageLink = "Document No" = field("Document No"),
                              "Document Type" = field("Document Type");
            }
            action("Risk Response Actions")
            {
                ApplicationArea = Basic;
                Image = Restore;
                RunObject = Page "RMP Line Response Actions";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No");
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                RunObject = Page "Default Dimensions";
                RunPageLink = "No." = field("Document No");
                Visible = false;
            }
            action("Directorate RMPs")
            {
                ApplicationArea = Basic;
                Image = DataEntry;
                RunObject = Page "Directorate Risk Mgt. Plans";
                RunPageLink = "Document Type" = filter("Functional (Directorate)");
                Visible = false;
            }
            action("Departmental RMps")
            {
                ApplicationArea = Basic;
                Caption = 'Divisional';
                Image = DataEntry;
                RunObject = Page "Departmental Risk Mgt. Plans";
                RunPageLink = "Document Type" = filter("Functional (Department)");
            }
            action("Regional RMPs")
            {
                ApplicationArea = Basic;
                Image = DataEntry;
                RunObject = Page "Regional Risk Mgt. Plans";
                RunPageLink = "Document Type" = filter("Functional (Region)");
                Visible = false;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;

                trigger OnAction()
                begin
                    RMPLine.Reset;
                    //RMPLine.SETRANGE(RMPLine."Document Type","Document Type");
                    RMPLine.SetRange(RMPLine."Document No", Rec."Document No");
                    if RMPLine.FindSet then begin
                        repeat
                            RiskManagementPlanLine.Init;
                            RiskManagementPlanLine.TransferFields(RMPLine);
                            RiskManagementPlanLine."Document Type" := RiskManagementPlanLine."document type"::Corporate;
                            RiskManagementPlanLine."Document No" := Rec."Consolidated Risk Mgt Plan No";
                            if not RiskManagementPlanLine.Insert(true) then
                                RiskManagementPlanLine.Modify(true);
                        until RMPLine.Next = 0;
                    end;
                    //Notify The Responsible Employee
                    //RiskManagement.FNnotifyImplementationLead(RMPLineResponseAction,Rec);
                    Message('Posted and responsible person notified successfully');
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Purpose(Goals & Objectives)_Promoted"; "Purpose(Goals & Objectives)")
                {
                }
                actionref("Risk & Compliance Roles_Promoted"; "Risk & Compliance Roles")
                {
                }
            }
            group(Category_Process)
            {
                actionref("Risk Register Summary_Promoted"; "Risk Register Summary")
                {
                }
                actionref("Copy Document_Promoted"; "Copy Document")
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
                actionref("New Risk Vouchers_Promoted"; "New Risk Vouchers")
                {
                }
                actionref("Risk Status Reports_Promoted"; "Risk Status Reports")
                {
                }
                actionref("Risk Incident Logs_Promoted"; "Risk Incident Logs")
                {
                }
                actionref("Risk Incident Ledger Entries_Promoted"; "Risk Incident Ledger Entries")
                {
                }
                actionref("Risk Ownership_Promoted"; "Risk Ownership")
                {
                }
                actionref("Risk Response Actions_Promoted"; "Risk Response Actions")
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref("Directorate RMPs_Promoted"; "Directorate RMPs")
                {
                }
                actionref("Departmental RMps_Promoted"; "Departmental RMps")
                {
                }
                actionref("Regional RMPs_Promoted"; "Regional RMPs")
                {
                }
            }
            group(Category_Category4)
            {
                actionref(Post_Promoted; Post)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Project;
    end;

    var
        ObjRiskMgt: Codeunit "Risk Management";
        RMPLine: Record "Risk Management Plan Line";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
}

#pragma implicitwith restore

