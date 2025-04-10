Codeunit 52193429 Notifications
{

    trigger OnRun()
    begin
    end;

    var
        Text000: label 'Notification code %1 doesn''t exist';
        Text001: label 'Company Information doesn''t exist';


    procedure sendNotifications(NotificationCode: Code[30])
    var
        NotificationRec: Record Notifications;
        NotificationLines: Record "Notification Lines";
        Body: Text;
        ENotifications: Record "Email Notifications";
        SMTP: Codeunit "Email Message";
        Email: Codeunit Email;
        ClientRec: Record Customer;
        ClientName: Text;
        CompInfo: Record "Company Information";
    begin
        if NotificationRec.Get(NotificationRec.Code) then begin
            NotificationLines.Reset;
            NotificationLines.SetRange(NotificationLines.No, NotificationRec.Code);
            if NotificationLines.Find('-') then
                repeat
                    Body := Body + NotificationLines.Text + '<br>';
                until
                 NotificationLines.Next = 0;
            if not CompInfo.Get() then
                Error(Text001);
            CompInfo.TestField(CompInfo."Administrator Email");
            //Send Email
            ENotifications.Reset;
            ENotifications.SetRange("Email Sent", false);
            if ENotifications.Find('-') then
                repeat
                    if ClientRec.Get(ENotifications."Client No.") then begin
                        ClientName := ClientRec.Name;
                    end;
                    Body := StrSubstNo(Body, ClientName);//,FundName);
                    SMTP.Create(ENotifications."Email Address", NotificationRec.Subject, Body, true);
                    Email.Send(SMTP);
                    ENotifications."Email Sent" := true;
                    ENotifications."Sent by" := UserId;
                    ENotifications."DateTime Sent" := CreateDatetime(Today, Time);
                    ENotifications.Modify;
                until
                 ENotifications.Next = 0;
        end else
            Error(Text000, NotificationCode);
    end;


    procedure EmailStatement(InvestorRec: Record Customer; StartDate: Date; EndDate: Date): Boolean
    var
        Setup: Record "Bosa Setup";
        CompanyRec: Record "Company Information";
        SMTP: Codeunit "Email Message";
        Email: Codeunit Email;
    begin

        if not Setup.Get then
            Error(Text000);
        /*
        IF NOT CompanyRec.GET THEN
         ERROR(Text002);
         */
        /*ClientFund.RESET;
        ClientFund.SETRANGE("Client No.",InvestorRec."No.");
        ClientFund.SETRANGE("Fund No.",InvestorRec."Fund ID");
        SOA.FetchFilters(StartDate,EndDate);
        SOA.SETTABLEVIEW(ClientFund);

        IF SOA.SAVEASPDF(Setup."XML PIN Submission Path"+'Statement'+InvestorRec."No."+'.pdf') THEN BEGIN
         Setup.TESTFIELD("Fund Admin E-mail");
         InvestorRec.TESTFIELD("E-Mail");
         IF FundRec.GET(InvestorRec."Fund ID") THEN;
         SMTP.Create(Setup."E-Mail Sender Name",Setup."Fund Admin E-mail",InvestorRec."E-Mail",'Statement','Dear '+InvestorRec.Name+',<br/><br/>'+
               'Please find attached your '+FundRec.Name+' statement of account. <br/><br/> We thank you for giving us the opportunity to be of service to you',TRUE);
         SMTP.AddBCC('mutualfunds@stanbicibtc.com');
         SMTP.AddAttachment(Setup."XML PIN Submission Path"+'statement'+InvestorRec."No."+'.pdf');
         SMTP.Send();
         EXIT(TRUE);
        END;
      */

    end;


    procedure EmailPStatement(Subscriptions: Record "Detailed Vendor Ledg. Entry"; InvestorRec: Record Vendor): Boolean
    var
        Setup: Record "Bosa Setup";
        CompanyRec: Record "Company Information";
        SMTP: Codeunit "Email Message";
        Email: Codeunit Email;
    begin

        if not Setup.Get then
            Error(Text000);
        Subscriptions.MarkedOnly(true);
        //MESSAGE('%1',Subscriptions.COUNT);
        /* PurchStatement.SETTABLEVIEW(Subscriptions);
         //PurchStatement.RUN();

         IF PurchStatement.SAVEASPDF(Setup."XML PIN Submission Path"+'PurchStatement'+InvestorRec."No."+'.pdf') THEN BEGIN
          Setup.TESTFIELD("Fund Admin E-mail");
          IF FundRec.GET(InvestorRec."Fund ID") THEN;
          SMTP.Create(Setup."E-Mail Sender Name",Setup."Fund Admin E-mail",InvestorRec."E-Mail",'Purchase Statement','Dear '+InvestorRec.Name+',<br/><br/>'+
                'Please find attached your '+FundRec.Name+' Purchase statement. <br/><br/> We thank you for giving us the opportunity to be of service to you',TRUE);
          SMTP.AddBCC('mutualfunds@stanbicibtc.com');
          SMTP.AddAttachment(Setup."XML PIN Submission Path"+'Purchstatement'+InvestorRec."No."+'.pdf');
          SMTP.Send();
          EXIT(TRUE);
         END;  */

    end;
}

