Codeunit 52193482 "Resume Delegations"
{

    trigger OnRun()
    begin
        DocApprovalDelegations.Reset;
        DocApprovalDelegations.SetRange(DocApprovalDelegations.Status, DocApprovalDelegations.Status::Processed);
        DocApprovalDelegations.SetFilter(DocApprovalDelegations."End Date", '=%1', Today);
        if DocApprovalDelegations.Find('-') then begin
            repeat

                //ApprovalDelegations.Resume(DocApprovalDelegations);

                if UserSetup.Get(DocApprovalDelegations."Current Approver ID") then begin
                    UserSetup.TestField("E-Mail");
                    SenderAddress := UserSetup."E-Mail";
                    if Employee.Get(UserSetup."Unlimited Member Approval") then
                        SenderName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                end;

                if UserSetup.Get(DocApprovalDelegations."New Approver ID") then begin
                    UserSetup.TestField("E-Mail");
                    Recipient := UserSetup."E-Mail";
                end;

                Subject := StrSubstNo('Resumption of Delegated Document Approval');
                Body := 'This is to inform you that I,' + SenderName + 'have resumed the document approval functions I had delegated to you';

                SMTPSetup.Create(Recipient, Subject, Body, true);
                Email.Send(SMTPSetup);

            until DocApprovalDelegations.Next = 0;
        end;
    end;

    var
        DocApprovalDelegations: Record "Document Approval Delegation";
        ApprovalDelegations: Record "Document Approval Delegation";
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
        UserSetup: Record "User Setup";
        SenderName: Text[50];
        SenderAddress: Text[50];
        Recipient: Text[50];
        Employee: Record Employee;
        Subject: Text[80];
        Body: Text[250];
}

