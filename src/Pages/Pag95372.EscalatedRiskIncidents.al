

page 95372 "Escalated Risk Incidents"
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
                    ToolTip = 'Specifies the value of the No. field.';
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
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk ID field.';
                }
                field("Risk Description"; Rec."Risk Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Description field.';
                }
                field("Risk Incident Category"; Rec."Risk Incident Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Incident Category field.';
                }
                field("Incident Description"; Rec."Incident Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Description field.';
                }
                field("Severity Level"; Rec."Severity Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Severity Level field.';
                }
                field("Occurrence Type"; Rec."Occurrence Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Occurrence Type field.';
                }
                field("Incident Date"; Rec."Incident Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Date field.';
                }
                field("Incident Start Time"; Rec."Incident Start Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Incident Start Time field.';
                }
                field("Incident End Time"; Rec."Incident End Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Incident End Time field.';
                }
                field("Incident Time"; Rec."Incident Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Time field.';
                }
                field("Incident Location Details"; Rec."Incident Location Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Location Details field.';
                }
                field("Primary Trigger ID"; Rec."Primary Trigger ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Trigger ID field.';
                }
                field("Root Cause Summary"; Rec."Root Cause Summary")
                {
                    ApplicationArea = Basic;
                    Visible = EscalateDetails;
                    ToolTip = 'Specifies the value of the Root Cause Summary field.';
                }
                field("Category of Person Reporting"; Rec."Category of Person Reporting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source of Information field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Reported By (Name)"; Rec."Reported By (Name)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reported By (Name) field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'CEO''s Office ID';
                    Visible = false;
                    ToolTip = 'Specifies the value of the CEO''s Office ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Division ID';
                    ToolTip = 'Specifies the value of the Division ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Region ID field.';
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
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
            }
            part(Control28; "Incident Impact Summary")
            {
                SubPageLink = "Incident No" = field("Incident ID");
                Visible = EscalateDetails;
                ApplicationArea = Basic;
            }
            group("Additional Incident Information")
            {
                Caption = 'Additional Incident Information';
                Visible = false;
                field("Incident Class"; Rec."Incident Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Class field.';
                }
                field("HSE Management Plan ID"; Rec."HSE Management Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HSE Management Plan ID field.';
                }
                field("Hazard ID"; Rec."Hazard ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hazard ID field.';
                }
                field("Police Report Reference No."; Rec."Police Report Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Police Report Reference No. field.';
                }
                field("Police Report Date"; Rec."Police Report Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Police Report Date field.';
                }
                field("Police Station"; Rec."Police Station")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Police Station field.';
                }
                field("Reporting Officer"; Rec."Reporting Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporting Officer field.';
                }
            }
            group("Escalation Details")
            {
                Caption = 'Escalation Details';
                Visible = true;
                field("Escalate to Officer No"; Rec."Escalate to Officer No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Escalate to Officer No field.';
                }
                field("Ecalate to Officer Name"; Rec."Ecalate to Officer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Ecalate to Officer Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Response; Rec.Response)
                {
                    ApplicationArea = Basic;
                    DrillDown = true;
                    ToolTip = 'Specifies the value of the Response field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Parties Involved")
            {
                ApplicationArea = Basic;
                Caption = 'Parties Involved';
                Image = PickLines;
                RunObject = Page "Risk Incident Log Parties";
                RunPageLink = "Incident ID" = field("Incident ID");
                ToolTip = 'Executes the Parties Involved action.';
                trigger OnAction()
                begin
                    // MESSAGE('Done');
                end;
            }
            action("Correct_Preventive Action Plan")
            {
                ApplicationArea = Basic;
                Image = Continue;
                RunObject = Page "Risk Incident Log Actions";
                RunPageLink = "Incident ID" = field("Incident ID");
                ToolTip = 'Executes the Correct_Preventive Action Plan action.';
                trigger OnAction()
                begin
                    // MESSAGE('Done');
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    // MESSAGE('Done');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    // MESSAGE('Done');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDocument;
                ToolTip = 'Executes the Release action.';
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
                ToolTip = 'Executes the Reopen action.';
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
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    Rec.TestField(Posted, false);
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField("Risk Management Plan ID");
                    RiskManagement.FnPostRiskIncidentLogs(Rec, RiskIncidentLedgerEntry, RiskIncidentLogImpactR);
                    Rec.Posted := true;
                    Rec."Document Status" := Rec."document status"::Closed;
                    Rec.Modify(true);

                    Message('Risk Incident Logs %1 Posted successfully', Rec."Incident ID");
                    CurrPage.Close();
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    // MESSAGE('Done');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    // MESSAGE('Done');
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                ToolTip = 'Executes the Dimensions action.';
                trigger OnAction()
                begin
                    // MESSAGE('Done');
                end;
            }
            action(Escalate)
            {
                ApplicationArea = Basic;
                Image = Close;
                ToolTip = 'Executes the Escalate action.';
                trigger OnAction()
                begin
                    //cc
                    Rec.TestField("Escalated?", false);
                    Rec.TestField("Escalate to Officer No");
                    Rec.TestField(Email);
                    if Confirm('Are you sure you want to escalate ?', true) then begin
                        Rec."Escalated?" := true;
                        Rec."Document Status" := Rec."document status"::Escalated;
                        RiskManagement.FNnotifyEscalator(Rec);
                        Rec.Modify(true);
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Parties Involved_Promoted"; "Parties Involved")
                {
                }
                actionref("Correct_Preventive Action Plan_Promoted"; "Correct_Preventive Action Plan")
                {
                }
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
                actionref(Print_Promoted; Print)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref(Escalate_Promoted; Escalate)
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
        Rec."Document Type" := Rec."document type"::"Risk Incident Report";
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

