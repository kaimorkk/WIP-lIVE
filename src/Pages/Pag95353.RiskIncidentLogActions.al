

page 95353 "Risk Incident Log Actions"
{
    CardPageID = "Risk Incident Log Action";
    PageType = List;
    SourceTable = "Risk Incident Log Action";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = Basic;
                }
                field("Task Priority"; Rec."Task Priority")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer Name"; Rec."Responsible Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer Email"; Rec."Responsible Officer Email")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Due Date"; Rec."Planned Due Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Notify Officer")
            {
                ApplicationArea = Basic;

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
                actionref("Notify Officer_Promoted"; "Notify Officer")
                {
                }
            }
        }
    }

    var
        RiskIncidentLogAction: Record "Risk Incident Log Action";

    procedure FNnotifyEscalator(RiskIncidentLogAction: Record "Risk Incident Log Action")
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
        RequesterEmail := RiskIncidentLogAction."Responsible Officer Email";
        RequesterName := RiskIncidentLogAction."Responsible Officer Email";
        //Create message
        if RequesterEmail = '' then
            Error('Kindly Ensure the Escalator Has a valid E-Mail Address');
        SenderAddress := HRSetup."HR E-mail Address";
        CustEmail := RequesterEmail;
        CompanyDetails := 'Dear ' + Employee.FullName;
        SenderMessage := '<BR>This is to Notify of an Escalation of Incident ID :' + RiskIncidentLogAction."Incident ID" + ' :'
        + RiskIncidentLogAction.Description + ' ,Kindly log in and update. </BR>';

        //MESSAGE('%1',CustEmail);
        if CustEmail = '' then
            exit;
        // cu400.Create(CompInfo.Name, SenderAddress,
        // CustEmail, RiskIncidentLogAction."Incident ID" + '-' + RiskIncidentLogAction.Description,
        // 'Dear ' + 'Sir/Madam' + ',<BR><BR>' +
        // 'Please Login to the ERP to update implementation status of the action taken', true);

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

