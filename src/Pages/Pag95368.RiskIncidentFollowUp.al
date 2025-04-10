

page 95368 "Risk Incident Follow-Up"
{
    PageType = Card;
    SourceTable = "Risk Incident Log";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Incident ID"; Rec."Incident ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Incident No."; Rec."Risk Incident No.")
                {
                    ApplicationArea = Basic;
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Description"; Rec."Risk Description")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Register Type"; Rec."Risk Register Type")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Incident Category"; Rec."Risk Incident Category")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Description"; Rec."Incident Description")
                {
                    ApplicationArea = Basic;
                }
                field("Severity Level"; Rec."Severity Level")
                {
                    ApplicationArea = Basic;
                }
                field("Occurrence Type"; Rec."Occurrence Type")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Date"; Rec."Incident Date")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Start Time"; Rec."Incident Start Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Incident End Time"; Rec."Incident End Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Incident Time"; Rec."Incident Time")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Location Details"; Rec."Incident Location Details")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Trigger ID"; Rec."Primary Trigger ID")
                {
                    ApplicationArea = Basic;
                }
                field("Root Cause Summary"; Rec."Root Cause Summary")
                {
                    ApplicationArea = Basic;
                    Visible = EscalateDetails;
                }
                field("Category of Person Reporting"; Rec."Category of Person Reporting")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Reported By (Name)"; Rec."Reported By (Name)")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'CEO''s Office ID';
                    Visible = false;
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Division ID';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
            part(Control28; "Risk Incident Log Acti")
            {
                Caption = 'Risk Incident Log Actions';
                SubPageLink = "Incident ID" = field("Incident ID");
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

                trigger OnAction()
                begin
                    // MESSAGE('Done');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;

                trigger OnAction()
                begin
                    // MESSAGE('Done');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDocument;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    Rec.Status := Rec.Status::Released;
                    Message('Released Successfully');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReopenDocument;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.Status := Rec.Status::Open;
                    Message('Reopened Successfully');
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;

                trigger OnAction()
                begin
                    Rec.TestField(Posted, false);
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField("Risk Incident No.");
                    RiskManagement.FnPostRiskIncidentFollowup(Rec, RiskIncidentLedgerEntry, RiskIncidentLogImpactR);
                    Rec.Posted := true;
                    Rec."Document Status" := Rec."document status"::Closed;
                    Rec.Modify(true);
                    Message('Posted successfully');
                    CurrPage.Close();
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;

                trigger OnAction()
                begin
                    // MESSAGE('Done');
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;

                trigger OnAction()
                begin
                    // MESSAGE('Done');
                end;
            }
            action("Suggest Action Plan")
            {
                ApplicationArea = Basic;
                Image = Suggest;

                trigger OnAction()
                begin
                    Rec.TestField("Risk Incident No.");
                    RiskManagement.FnSuggestFollowUp(Rec, RiskIncidentLedgerEntry, RiskIncidentLogImpactR);
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
                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref("Suggest Action Plan_Promoted"; "Suggest Action Plan")
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        EscalateDetails := false;
        if Rec."Escalated?" = true then begin
            EscalateDetails := true;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Risk Incident Follow-up";
    end;

    trigger OnOpenPage()
    begin
        EscalateDetails := false;
        if Rec."Escalated?" = true then begin
            EscalateDetails := true;
        end;
    end;

    var
        RiskManagement: Codeunit "Risk Management";
        RiskIncidentLedgerEntry: Record "Risk Incident Ledger Entry";
        RiskIncidentLogImpactR: Record "Risk Incident Log Impact R";
        EscalateDetails: Boolean;
}

#pragma implicitwith restore

