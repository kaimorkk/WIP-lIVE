

page 95371 "Implementation Status"
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
                field("Risk Incident No."; Rec."Risk Incident No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Incident No. field.';
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
                field("Risk Incident Category"; Rec."Risk Incident Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                field("Escalate to Officer No"; Rec."Escalate to Officer No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Escalate to Officer No field.';
                }
                field("Ecalate to Officer Name"; Rec."Ecalate to Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ecalate to Officer Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
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
            action("Suggest Action Plan")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                ToolTip = 'Executes the Suggest Action Plan action.';
                trigger OnAction()
                begin
                    Rec.TestField("Risk Incident No.");
                    RiskManagement.FnSuggestFollowUp(Rec, RiskIncidentLedgerEntry, RiskIncidentLogImpactR);
                end;
            }
            action("Notify Officer")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Notify Officer action.';
                trigger OnAction()
                begin
                    FNnotifyEscalator(Rec);
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
        Rec."Document Type" := Rec."document type"::"Implementation Status";
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
        RiskIncidentLog: Record "Risk Incident Log";

    local procedure FNnotifyEscalator(RiskIncidentLog: Record "Risk Incident Log")
    var
        MyResources: Record Resource;
        Engaments: Record "Audit Project";
        Resources: Record "Audit Project Team";
        Window: Dialog;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        SenderAddress: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Human Resources Setup";
        CompInfo: Record "Company Information";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        CustEmail: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        FileDirectory: Text[100];
        FileName: Text[100];
        Plannedstartdate: Text[250];
        ResponsibilityCenter: Record "Responsibility Center";
        Employee: Record Employee;
    begin
        //cc Send Escalation Notification
        CompInfo.Get;
        HRSetup.Get;
        Window.Open('Sending...');
        WindowisOpen := true;

        //cc
        RequesterEmail := RiskIncidentLog.Email;
        RequesterName := RiskIncidentLog."Escalate to Officer No";
        //Create message
        if RequesterEmail = '' then
            Error('Kindly Ensure the Escalator Has a valid E-Mail Address');
        SenderAddress := HRSetup."HR E-mail Address";
        CustEmail := RequesterEmail;
        CompanyDetails := 'Dear ' + Employee.FullName;
        SenderMessage := '<BR>This is to Notify of an Escalation of Incident ID :' + RiskIncidentLog."Incident ID" + ' :'
        + RiskIncidentLog."Incident Description" + ' ,Kindly log in and update. </BR>';

        //MESSAGE('%1',CustEmail);
        if CustEmail = '' then
            exit;
        // cu400.Create(CompInfo.Name, SenderAddress,
        // CustEmail, RiskIncidentLog."Incident ID" + '-' + RiskIncidentLog."Incident Description",
        // 'Dear ' + 'Sir/Madam' + ',<BR><BR>' +
        // 'This is to notify you that the action has been completed', true);

        // cu400.AppendToBody(
        // '<BR><BR>Kind Regards,');
        // cu400.AppendToBody('<BR>' + CompInfo.Name);
        // cu400.AddAttachment(FileDirectory + FileName, FileName);
        // cu400.Send;
        Sleep(1000);
        Window.Close;
        Message('Escalation Notification Has Been Forwarded.');
        // UNTIL InsuranceReg.NEXT=0;
    end;
}

#pragma implicitwith restore

