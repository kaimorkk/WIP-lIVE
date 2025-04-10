Codeunit 52193471 "Performance Evaluation Alerts"
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


        AppraisalPeriods.Reset;
        AppraisalPeriods.SetRange(AppraisalPeriods."Start Date", 0D, Today);
        AppraisalPeriods.SetFilter(AppraisalPeriods."End Date", '%1..%2', Today, CalcDate('2W', Today));
        if AppraisalPeriods.Find('-') then begin

            //IF AppraisalPeriods."End Date"<=CALCDATE('2W',TODAY) THEN BEGIN
            AppraisalObjectives.Reset;
            AppraisalObjectives.SetRange(AppraisalObjectives."Appraisal Period", AppraisalPeriods.Period);
            if AppraisalObjectives.Find('-') then begin

                Body := StrSubstNo('This is to notify you that the performance evaluation for Employee %1 for the Appraisal Period %2 is due', AppraisalObjectives."Employee No", AppraisalObjectives."Appraisal Period");
                Subject := StrSubstNo('Performance Evaluation for Appraisal Period %1', AppraisalObjectives."Appraisal Period");
                repeat
                    Employee.Reset;
                    if Employee.Get(AppraisalObjectives."Employee No") then begin
                        // Mail.NewMessage(Employee."E-Mail",'',Subject,Body,'',FALSE);

                        SMTPMail.Create(Employee."E-Mail", Subject, Body, true);
                        Email.Send(SMTPMail);

                        // Mail.NewIncidentMail(Employee."E-Mail",Subject,Body)

                    end;

                    Employee.Reset;
                    if Employee.Get(AppraisalObjectives."Appraiser No") then begin
                        // Mail.NewMessage(Employee."E-Mail",'',Subject,Body,'',FALSE);

                        SMTPMail.Create(Employee."E-Mail", Subject, Body, true);
                        Email.Send(SMTPMail);
                        // Mail.NewIncidentMail(Employee."E-Mail",Subject,Body);

                    end;


                until AppraisalObjectives.Next = 0;
            end;
            // END;
        end;

        SixMonthsAgo := CalcDate('-6M', Today);

        Employee.Reset;
        Employee.SetRange(Employee."Posting Group", 'PERMANENT');
        Employee.SetFilter(Employee."Date Of Join", '=%1', CalcDate('2W', SixMonthsAgo));
        if Employee.Find('-') then begin
            repeat

                Body := StrSubstNo('This is to notify you that the appraisal for Employee %1, %2 %3 %4 is due'
             , Employee."No.", Employee."First Name", Employee."Middle Name", Employee."Last Name");
                Subject := StrSubstNo('Appraisal of Employees on Probation');

                CompInfo.Get();
                SMTPMail.Create(CompInfo."HR Support Email", Subject, Body, true);
                Email.Send(SMTPMail);

            until Employee.Next = 0;
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
        SenderAddress: Text;
        SenderName: Text;
        UserSetup: Record "User Setup";
        SMTPMail: Codeunit "Email Message";
        Email: Codeunit Email;
        CompInfo: Record "Company Information";
        SixMonthsAgo: Date;
}

