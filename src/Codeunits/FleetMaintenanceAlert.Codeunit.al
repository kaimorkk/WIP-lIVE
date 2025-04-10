Codeunit 52193473 "Fleet Maintenance Alert"
{

    trigger OnRun()
    begin
        /*
        UserSetup.RESET;
        IF UserSetup.GET(USERID) THEN BEGIN
          UserSetup.TESTFIELD("E-Mail");
          SenderAddress := UserSetup."E-Mail";
         // Recipient := UserSetup."E-Mail";
         // FromUser := UserSetup."E-Mail";
        END;
        */

        CompInfo.Get();
        SenderAddress := CompInfo."Administrator Email";

        SenderName := COMPANYNAME;
        //CompInfo.GET();
        //Recipient:=CompInfo."HR Support Email";

        Employee.Reset;
        Employee.SetRange(Employee.Position, '214');
        if Employee.Find('-') then
            Recipient := Employee."E-Mail";

        FARec.Reset;
        //FARec.SETRANGE(FARec."FA Class Code",'MV');
        if FARec.Find('-') then begin
            repeat

                MaintenanceRec.Reset;
                MaintenanceRec.SetRange(MaintenanceRec."Item No.", FARec."No.");
                if MaintenanceRec.Find('+') then begin

                    Subject := 'Asset Maintenance Service Alert';

                    if MaintenanceRec."Service Interval Type" = MaintenanceRec."service interval type"::Periodical then begin
                        ServiceIntervals.Reset;
                        ServiceIntervals.SetRange(ServiceIntervals."Service Interval Code", MaintenanceRec."Service Intervals");
                        if ServiceIntervals.Find('-') then
                            ServiceDate := CalcDate(ServiceIntervals."Service Period", MaintenanceRec."Date of Service");

                        if (ServiceDate > Today) and (Format(ServiceDate - Today) <= '2W') then begin
                            // Subject := 'Asset Maintenance Service Alert';
                            Body := 'This is to notify you that maintenance service for Asset No ' + MaintenanceRec."Item No." + ', ' + MaintenanceRec."Item Description" + ' is due in ' + Format(ServiceDate - Today) + ' days time';
                        end;
                        /*
                             END ELSE
                            IF MaintenanceRec."Service Interval Type"=MaintenanceRec."Service Interval Type"::Mileage THEN
                             BEGIN
                              ServiceIntervals.RESET;
                              ServiceIntervals.SETRANGE(ServiceIntervals."Service Interval Code",MaintenanceRec."Service Intervals");
                              IF ServiceIntervals.FIND('-') THEN
                                ServiceMileage := MaintenanceRec."Current Odometer Reading" + ServiceIntervals."Service Mileage";

                              IF ServiceMileage >
                                Body:='This is to notify you that Maintenance Service for Asset No '+MaintenanceRec."Item No."+', '+MaintenanceRec."Item Description"+' is due';

                            END;
                         */
                    end;

                    CompInfo.Get();
                    SMTPMail.Create(Recipient, Subject, Body, true);
                    // SMTPMail.Create(SenderName,SenderAddress,Recipients,Subject,Body,HtmlFormatted)
                    //SMTPMail.AddCC(CompInfo."HR Support Email");
                    Email.Send(SMTPMail);

                end;

            until FARec.Next = 0;

        end;

        //Mail.NewIncidentMail(CompInfo."HR Support Email",'1 Minute Interval Email','Job Queue and NAS Test Mail');
        //Mail.NewMessage(CompInfo."HR Support Email",'','5 Minute Interval Email','Job Queue and NAS Test Mail','',FALSE);
        //Mail.RUN();
        //SenderAddress := 'cmutua@cma.or.ke';

        //    Subject := 'Job Queue Test Email';
        //     Body:='This is a job queue notification email';
        //   CompInfo.GET();
        //   SMTPMail.Create(SenderName,SenderAddress,Recipient,Subject,Body,TRUE);
        // SMTPMail.Create(SenderName,SenderAddress,Recipients,Subject,Body,HtmlFormatted)
        // SMTPMail.AddCC(CompInfo."HR Support Email");
        Email.Send(SMTPMail);

    end;

    var
        FARec: Record "Fixed Asset";
        MaintenanceRec: Record "Maintanance and Repair";
        Employee: Record Employee;
        Mail: Codeunit Mail;
        CompInfo: Record "Company Information";
        SMTPMail: Codeunit "Email Message";
        Email: Codeunit Email;
        UserSetup: Record "User Setup";
        SenderAddress: Text[50];
        SenderName: Text[50];
        Subject: Text[100];
        Body: Text[250];
        ServiceDate: Date;
        Recipient: Text[50];
        ServiceIntervals: Record "Service Intervals";
        ServiceMileage: Decimal;
}

