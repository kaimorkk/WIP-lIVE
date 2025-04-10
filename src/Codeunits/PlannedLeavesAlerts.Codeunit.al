Codeunit 52193476 "Planned Leaves Alerts"
{

    trigger OnRun()
    begin
        /*
        IF UserSetup.GET(USERID) THEN BEGIN
          UserSetup.TESTFIELD("E-Mail");
          SenderAddress := UserSetup."E-Mail";
        //  Recipient := UserSetup."E-Mail";
        //  FromUser := UserSetup."E-Mail";
        END;
        */

        CompInfo.Get();
        SenderAddress := CompInfo."Administrator Email";

        SenderName := COMPANYNAME;

        LeavePlanLines.Reset;
        LeavePlanLines.SetFilter(LeavePlanLines."Start Date", '>%1', Today);
        if LeavePlanLines.Find('-') then begin
            repeat
                if LeavePlanLines."Start Date" <= CalcDate('2W', Today) then begin
                    LeavePlanHeader.Reset;
                    LeavePlanHeader.SetRange(LeavePlanHeader."Application No", LeavePlanLines."Application No");
                    LeavePlanHeader.SetRange(LeavePlanHeader."Employee No", LeavePlanLines."Employee No");
                    if LeavePlanHeader.Find('-') then begin

                        Body := StrSubstNo('This is a notification that Staff No %1, %2 that had scheduled to go on leave from %3 and end on %4', LeavePlanLines."Employee No", LeavePlanHeader."Employee Name", LeavePlanLines."Start Date", LeavePlanLines."End Date");
                        Subject := 'Scheduled Leave';//STRSUBSTNO(,);
                                                     // REPEAT
                        Employee.Reset;

                        if Employee.Get(LeavePlanLines."Employee No") then begin

                            CompInfo.Get;    //  Mail.NewMessage(Employee."E-Mail",'',Subject,Body,'',FALSE);
                            SMTPMail.Create(Employee."E-Mail", Subject, Body, true);
                            //SMTPMail.AddCC(CompInfo."HR Support Email");
                            Email.Send(SMTPMail);

                            // Mail.NewIncidentMail(Employee."E-Mail",Subject,Body);

                        end;

                        //
                    end;
                end;
            until LeavePlanLines.Next = 0;
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
        LeavePlanHeader: Record "Employee Leave Plan Header1";
        LeavePlanLines: Record "Employee Leave Plan1";
        UserSetup: Record "User Setup";
        SenderAddress: Text[50];
        SenderName: Text[50];
        SMTPMail: Codeunit "Email Message";
        Email: Codeunit Email;
        CompInfo: Record "Company Information";
}

