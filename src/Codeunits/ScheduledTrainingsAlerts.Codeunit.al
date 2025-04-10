Codeunit 52193472 "Scheduled Trainings Alerts"
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

        TrainingRec.Reset;
        TrainingRec.SetFilter(TrainingRec."Planned Start Date", '%1..%2', Today, CalcDate('2W', Today));
        if TrainingRec.Find('-') then begin
            // IF TrainingRec."Planned Start Date" <= CALCDATE('2W',TODAY) THEN BEGIN
            Participants.Reset;
            Participants.SetRange(Participants."Training Request", TrainingRec."Request No.");
            if Participants.Find('-') then begin

                Body := StrSubstNo('This is to notify you that the course %1 at %2 is scheduled to start from %3 and end on %4', TrainingRec."Course Title", TrainingRec.Venue, TrainingRec."Planned Start Date", TrainingRec."Planned End Date");
                Subject := 'Scheduled Training Course';//STRSUBSTNO(,);
                repeat
                    Employee.Reset;

                    if Employee.Get(Participants."Employee No") then begin

                        //  Mail.NewMessage(Employee."E-Mail",'',Subject,Body,'',FALSE);
                        SMTPMail.Create(Employee."E-Mail", Subject, Body, true);
                        Email.Send(SMTPMail);

                        // Mail.NewIncidentMail(Employee."E-Mail",Subject,Body);

                    end;

                until Participants.Next = 0;
            end;
            // END;
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
        TrainingRec: Record "Training Request1";
        Participants: Record "Training Participants";
        UserSetup: Record "User Setup";
        SenderAddress: Text[50];
        SenderName: Text[50];
        SMTPMail: Codeunit "Email Message";
        Email: Codeunit Email;
        CompInfo: Record "Company Information";
}

