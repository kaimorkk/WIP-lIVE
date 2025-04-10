

page 95096 "Departmen Risk Management Plan"
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
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Divison ID';
                    ToolTip = 'Specifies the value of the Divison ID field.';
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corporate Strategic Plan ID field.';
                }
                field("Consolidated Risk Mgt Plan No"; Rec."Consolidated Risk Mgt Plan No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Consolidated Risk Register No';
                    ToolTip = 'Specifies the value of the Consolidated Risk Register No field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Detailed Introduction"; Rec."Detailed Introduction")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Detailed Introduction field.';
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Officer No. field.';
                }
                field("Responsible Officer Name"; Rec."Responsible Officer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsible Officer Name field.';
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Planning Start Date field.';
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Planning End Date field.';
                }
                field("Risk Likelihood Rate Scale ID"; Rec."Risk Likelihood Rate Scale ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Risk Likelihood Rate Scale ID field.';
                }
                field("Risk Impact Rating Scale ID"; Rec."Risk Impact Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Risk Impact Rating Scale ID field.';
                }
                field("Overall Risk Rating Scale ID"; Rec."Overall Risk Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Overall Risk Rating Scale ID field.';
                }
                field("Risk Appetite Rating Scale ID"; Rec."Risk Appetite Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Risk Appetite Rating Scale ID field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date Time field.';
                }
            }
            part(Control41; "Risk Management Plan Lines")
            {
                Caption = 'Operational Risk Register(Departmental)';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No");
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
                ToolTip = 'Executes the Purpose(Goals & Objectives) action.';
            }
            action("Risk & Compliance Roles")
            {
                ApplicationArea = Basic;
                Image = Restore;
                RunObject = Page "RMP Roles";
                ToolTip = 'Executes the Risk & Compliance Roles action.';
            }
            action("Risk Register Summary")
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Risk Register Summary action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document Type", Rec."Document Type");
                    Rec.SetRange("Document No", Rec."Document No");
                    if Rec.FindSet then
                        Report.Run(95002, true, false, Rec);
                end;
            }
            action("Copy Document")
            {
                ApplicationArea = Basic;
                Image = CopyDocument;
                ToolTip = 'Executes the Copy Document action.';
                trigger OnAction()
                begin
                    ObjRiskMgt.FnCopyRiskManagementPlanDocument(Rec, RMPLine, Rec."Document Type", '');
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    Message('Success');
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
                end;
            }
            action("New Risk Vouchers")
            {
                ApplicationArea = Basic;
                Image = New;
                RunObject = Page "New Risk Vouchers";
                RunPageView = where("Document Type" = filter("New Risk Voucher"));
                ToolTip = 'Executes the New Risk Vouchers action.';
            }
            action("Risk Status Reports")
            {
                ApplicationArea = Basic;
                Image = Status;
                RunObject = Page "Periodic Risk Status Reports";
                ToolTip = 'Executes the Risk Status Reports action.';
            }
            action("Risk Incident Logs")
            {
                ApplicationArea = Basic;
                Image = Log;
                RunObject = Page "Periodic Risk Status Reports";
                ToolTip = 'Executes the Risk Incident Logs action.';
            }
            action("Risk Incident Ledger Entries")
            {
                ApplicationArea = Basic;
                Image = LedgerEntries;
                RunObject = Page "New Risk Voucher Lines";
                ToolTip = 'Executes the Risk Incident Ledger Entries action.';
            }
            action("Risk Ownership")
            {
                ApplicationArea = Basic;
                Image = "Order";
                RunObject = Page "RMP Line Risk Ownerships";
                RunPageLink = "Document No" = field("Document No"),
                              "Document Type" = field("Document Type");
                ToolTip = 'Executes the Risk Ownership action.';
            }
            action("Risk Response Actions")
            {
                ApplicationArea = Basic;
                Image = Restore;
                RunObject = Page "RMP Line Response Actions";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No");
                ToolTip = 'Executes the Risk Response Actions action.';
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                RunObject = Page "Default Dimensions";
                RunPageLink = "No." = field("Document No");
                ToolTip = 'Executes the Dimensions action.';
            }
            action("Directorate RMPs")
            {
                ApplicationArea = Basic;
                Image = DataEntry;
                RunObject = Page "Directorate Risk Mgt. Plans";
                RunPageLink = "Document Type" = filter("Functional (Directorate)");
                Visible = false;
                ToolTip = 'Executes the Directorate RMPs action.';
            }
            action("Departmental RMps")
            {
                ApplicationArea = Basic;
                Caption = 'Divisional';
                Image = DataEntry;
                RunObject = Page "Departmental Risk Mgt. Plans";
                RunPageLink = "Document Type" = filter("Functional (Department)");
                ToolTip = 'Executes the Divisional action.';
            }
            action("Regional RMPs")
            {
                ApplicationArea = Basic;
                Image = DataEntry;
                RunObject = Page "Regional Risk Mgt. Plans";
                RunPageLink = "Document Type" = filter("Functional (Region)");
                Visible = false;
                ToolTip = 'Executes the Regional RMPs action.';
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Consolidate';
                Ellipsis = true;
                Image = Post;
                ToolTip = 'Executes the Consolidate action.';
                trigger OnAction()
                begin
                    RMPLine.Reset;
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

                    RMPLineResponse.Reset;
                    RMPLineResponse.SetRange(RMPLineResponse."Document No", Rec."Document No");
                    if RMPLineResponse.FindSet then begin
                        repeat
                            RMPLineResponseAct.Init;
                            RMPLineResponseAct.TransferFields(RMPLineResponse);
                            RMPLineResponseAct."Document Type" := RMPLineResponseAct."document type"::Corporate;
                            RMPLineResponseAct."Document No" := Rec."Consolidated Risk Mgt Plan No";
                            if not RMPLineResponseAct.Insert(true) then
                                RMPLineResponseAct.Modify(true);
                        until RMPLineResponse.Next = 0;
                    end;

                    RMPLineRisk.Reset;
                    RMPLineRisk.SetRange(RMPLineRisk."Document No", Rec."Document No");
                    if RMPLineRisk.FindSet then begin
                        repeat
                            RMPLineRiskOwnership.Init;
                            RMPLineRiskOwnership.TransferFields(RMPLineRisk);
                            RMPLineRiskOwnership."Document Type" := RMPLineRiskOwnership."document type"::Corporate;
                            RMPLineRiskOwnership."Document No" := Rec."Consolidated Risk Mgt Plan No";
                            if not RMPLineRiskOwnership.Insert(true) then
                                RMPLineRiskOwnership.Modify(true);
                        until RMPLineRisk.Next = 0;
                    end;
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
        Rec."Document Type" := Rec."document type"::"Functional (Department)";
    end;

    var
        ObjRiskMgt: Codeunit "Risk Management";
        RMPLine: Record "Risk Management Plan Line";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskManagement: Codeunit "Risk Management";
        RMPLineResponseAction: Record "RMP Line Response Action";
        RMPLineResponse: Record "RMP Line Response Action";
        RMPLineResponseAct: Record "RMP Line Response Action";
        RMPLineRisk: Record "RMP Line Risk Ownership";
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
}

#pragma implicitwith restore

