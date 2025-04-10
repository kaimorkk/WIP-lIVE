Codeunit 52193485 "Tender Closing Dates"
{

    trigger OnRun()
    begin
        /*
        IF UserSetup.GET(USERID) THEN BEGIN
          UserSetup.TESTFIELD("E-Mail");
          SenderAddress := UserSetup."E-Mail";
        //  Recipient := UserSetup."E-Mail";
        //  FromUser := UserSetup."E-Mail";
        END;*/

        CompInfo.Get();
        SenderAddress := CompInfo."Administrator Email";

        SenderName := COMPANYNAME;

        //DayAfter:=CALCDATE('1D',CREATEDATETIME);
        TestDate := CalcDate('1D', Today);
        TestTime := Time;
        TestDateTime := CreateDatetime(TestDate, TestTime);


        ProcurementReq.Reset;
        ProcurementReq.SetFilter(ProcurementReq."Tender Closing Date", '=%1', TestDateTime);
        if ProcurementReq.Find('-') then begin
            repeat
                Body := StrSubstNo('This is to notify you that %1 %2 is scheduled to close tomorrow, %3', ProcurementReq."Process Type", ProcurementReq.No, ProcurementReq."Tender Closing Date");
                Subject := StrSubstNo('%1 Closing Date', ProcurementReq."Process Type");
                //  Mail.NewMessage(Employee."E-Mail",'',Subject,Body,'',FALSE);
                SMTPMail.Create(CompInfo."Procurement Support E-mail", Subject, Body, true);
                Email.Send(SMTPMail);
            // Mail.NewIncidentMail(Employee."E-Mail",Subject,Body);
            until ProcurementReq.Next = 0;
        end;

    end;

    var
        AppraisalObjectives: Record "Employee Appraisal Objectives1";
        Mail: Codeunit Mail;
        Employee: Record Employee;
        Appraisals: Record "Employee Appraisals1";
        AppraisalPeriods: Record "Appraisal Periods1";
        Body: Text[250];
        Subject: Text[250];
        ProcurementReq: Record "Procurement Request1";
        Participants: Record "Training Participants";
        UserSetup: Record "User Setup";
        SenderAddress: Text[50];
        SenderName: Text[50];
        SMTPMail: Codeunit "Email Message";
        Email: Codeunit Email;
        CompInfo: Record "Company Information";
        TestDate: Date;
        TestTime: Time;
        TestDateTime: DateTime;
}

