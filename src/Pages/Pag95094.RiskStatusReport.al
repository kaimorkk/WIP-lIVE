

page 95094 "Risk Status Report"
{
    PageType = Card;
    SourceTable = "Risk M&E Header";

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
                field("Risk Register Type"; Rec."Risk Register Type")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Report Start Date"; Rec."Report Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Report End Date"; Rec."Report End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control20; "Risk Status Report Lines")
            {
                Caption = 'Open Risk Status';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No");
                ApplicationArea = Basic;
            }
            part(Control14; "RMP Line Response Actions")
            {
                Caption = 'Risk Response Action Status';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No");
                Visible = false;
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Suggest Open Risks")
            {
                ApplicationArea = Basic;
                Image = Suggest;

                trigger OnAction()
                begin
                    RiskManagement.FnSuggestOpenRisks(RiskStatusReportLine, Rec);
                    RiskManagement.FnSuggestOpenRSRRiskResponseActionStatus(RiskStatusReportLine, Rec, RiskStatusRptRespAction);
                    Message('Suggested successfully');
                end;
            }
            action("Log New Risk Incidents")
            {
                ApplicationArea = Basic;
                Image = Log;
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
                    Message('Success');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;

                trigger OnAction()
                begin
                    Rec.TestField(Posted, false);
                    Rec.TestField("Risk Management Plan ID");
                    //TESTFIELD(Status,Status::Released);
                    RiskManagement.FnUpdateRMPFromRSR(Rec);
                    RiskManagement.FnUpdateRiskOwnership(Rec);
                    RiskManagement.FnUpdateRiskResponseActionsRSR(Rec);
                    //RiskManagement.FnUpdateRiskRILedgerEntry(Rec,NewRiskVoucherLine,RiskStatusReportLine,NewRiskLineResponseAction,RiskStatusRptRespAction,RiskStatusRptIncident);
                    //MESSAGE('Document %1 posted successfully',"Document No");
                    Message('RMP %1 updated successfully', Rec."Risk Management Plan ID");

                    Rec.Posted := true;
                    Rec."Posting Date" := Today;
                    Rec.Modify;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No", Rec."Document No");
                    Report.Run(95007, true, true, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Risk Incident Ledger Entries")
            {
                ApplicationArea = Basic;
                Image = LedgerEntries;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Suggest Open Risks_Promoted"; "Suggest Open Risks")
                {
                }
                actionref("Log New Risk Incidents_Promoted"; "Log New Risk Incidents")
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
                actionref(Post_Promoted; Post)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref("Risk Incident Ledger Entries_Promoted"; "Risk Incident Ledger Entries")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Risk Status Report";
    end;

    var
        RiskManagement: Codeunit "Risk Management";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskMEHeader: Record "Risk M&E Header";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
        RiskStatusReportLine: Record "Risk Status Report Line";
        NewRiskLineOwnership: Record "New Risk Line Ownership";
        NewRiskLineResponseAction: Record "New Risk Line Resp. Action";
        NewRiskLineJobTask: Record "New Risk Line Job Task";
        RiskStatusRptRespAction: Record "Risk Status Rpt Resp. Action";
        RiskStatusRptIncident: Record "Risk Status Rpt Incident";
}

#pragma implicitwith restore

