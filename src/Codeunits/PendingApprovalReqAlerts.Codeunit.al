Codeunit 52193483 "Pending Approval Req Alerts"
{

    trigger OnRun()
    begin
        /*
        END;*/

        CompInfo.Get();
        SenderAddress := CompInfo."Administrator Email";

        SenderName := COMPANYNAME;

        ApprovalEntry.Reset;
        ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Open);
        if ApprovalEntry.Find('-') then begin
            if (Dt2Date(ApprovalEntry."Date-Time Sent for Approval") = Today) then begin
                if (Dt2Time(ApprovalEntry."Date-Time Sent for Approval") <= (Dt2Time(CurrentDatetime) - 7200000)) then begin


                    if UserSetup.Get(ApprovalEntry."Approver ID") then begin
                        UserSetup.TestField("E-Mail");
                        Recipient := UserSetup."E-Mail";
                    end;

                    Body := StrSubstNo('This is to notify you that you have an approval request for Document No %1 that has been pending for over 2 hours', ApprovalEntry."Document No.");
                    Subject := 'Pending Approval Request Alert';

                    SMTPMail.Create(Recipient, Subject, Body, true);
                    Email.Send(SMTPMail);
                end;
            end;
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
        ApprovalEntry: Record "Approval Entry";
        UserSetup: Record "User Setup";
        SenderAddress: Text[80];
        SenderName: Text[80];
        SMTPMail: Codeunit "Email Message";
        Email: Codeunit Email;
        CompInfo: Record "Company Information";
        Recipient: Text[80];
}

