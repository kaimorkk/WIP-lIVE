

page 95056 "New Risk Voucher"
{
    PageType = Card;
    SourceTable = "Risk M&E Header";
    SourceTableView = where("Document Type" = filter("New Risk Voucher"));

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
                    Editable = true;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Risk Register Type"; Rec."Risk Register Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Register Type field.';
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Management Plan ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Officer No. field.';
                }
                field("Risk Likelihood Rate Scale ID"; Rec."Risk Likelihood Rate Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Likelihood Rate Scale ID field.';
                }
                field("Risk Impact Rating Scale ID"; Rec."Risk Impact Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Impact Rating Scale ID field.';
                }
                field("Overall Risk Rating Scale ID"; Rec."Overall Risk Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Risk Rating Scale ID field.';
                }
                field("Risk Appetite Rating Scale ID"; Rec."Risk Appetite Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Appetite Rating Scale ID field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
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
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
            }
            part(Control20; "New Risk Voucher Lines")
            {
                Caption = 'New/Emerging Risks';
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
                    Message('Success');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = Reopen;
                ToolTip = 'Executes the Reopen action.';
                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    // TESTFIELD(Posted,FALSE);
                    // TESTFIELD("Risk Management Plan ID");
                    // TESTFIELD(Status,Status::Released);
                    RiskManagement.FnUpdateRMPFromNRV(RiskManagementPlanLine, Rec, NewRiskVoucherLine, RiskStatusReportLine);
                    //RiskManagement.FnUpdateRiskOwnership(Rec,NewRiskVoucherLine,RiskStatusReportLine,NewRiskLineOwnership);
                    RiskManagement.FnUpdateRiskOwnership(Rec);
                    RiskManagement.FnUpdateRiskResponseActions(Rec, NewRiskVoucherLine, RiskStatusReportLine, NewRiskLineResponseAction);
                    RiskManagement.FnUpdateJobTasks(Rec, NewRiskVoucherLine, RiskStatusReportLine, NewRiskLineJobTask);
                    Message('Document %1 posted successfully', Rec."Document No");
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
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No", Rec."Document No");
                    Report.Run(95003, true, true, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                ToolTip = 'Executes the Dimensions action.';
                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
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
            }
        }
    }

    var
        RiskManagement: Codeunit "Risk Management";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskMEHeader: Record "Risk M&E Header";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
        RiskStatusReportLine: Record "Risk Status Report Line";
        NewRiskLineOwnership: Record "New Risk Line Ownership";
        NewRiskLineResponseAction: Record "New Risk Line Resp. Action";
        NewRiskLineJobTask: Record "New Risk Line Job Task";
}

#pragma implicitwith restore

