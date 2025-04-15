 
codeunit 50009 "Payments"
{
    TableNo = Payments;

    trigger OnRun()
    var
        SalesLine: Record "Sales Line";
        TempVATAmountLine0: Record "VAT Amount Line" temporary;
        TempVATAmountLine1: Record "VAT Amount Line" temporary;
        PrepaymentMgt: Codeunit "Prepayment Mgt.";
        NotOnlyDropShipment: Boolean;
        PostingDate: Date;
        PrintPostedDocuments: Boolean;
    begin
        if Rec.Status = Rec.Status::Released then
            exit;

        OnBeforeReleasePayments(Rec);
        //OnCheckImpMemoReleaseRestrictions;

        Rec.Status := Rec.Status::Released;
        Rec.Modify(true);
        //SendApprovalNotification(Rec."No.");


        //MODIFY(TRUE);

        //VALIDATE(Status);//Added by Morris to Push Committments
        OnAfterReleasePayments(Rec);
    end;

    var
        Text001: label 'There is nothing to release for Payment %1.';
        SalesSetup: Record "Sales & Receivables Setup";
        InvtSetup: Record "Inventory Setup";
        WhseSalesRelease: Codeunit "Whse.-Sales Release";
        Text002: label 'This document can only be released when the approval process is complete.';
        Text003: label 'The approval process must be canceled or completed to reopen this document.';
        Text004: label 'There are unposted prepayment amounts on the document of type %1 with the number %2.';
        Text005: label 'There are unpaid prepayment invoices that are related to the document of type %1 with the number %2.';


    procedure Reopen(var Payments: Record Payments)
    begin
        OnBeforeReopenPayments(Payments);

        with Payments do begin
            if Status = Status::Open then
                exit;
            Status := Status::Open;

            Modify(true);

        end;

        OnAfterReopenPayments(Payments);
    end;


    procedure PerformManualRelease(var Payments: Record Payments)
    var
        PrepaymentMgt: Codeunit "Prepayment Mgt.";
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        with Payments do begin


            //if //ApprovalsMgmt.IsPaymentsApprovalsWorkflowEnabled(Payments) and (Payments.Status = Payments.Status::Open) then
            Error(Text002);

            Codeunit.Run(Codeunit::Payments, Payments);
        end;
    end;


    procedure PerformManualReopen(var Payments: Record Payments)
    begin
        if Payments.Status = Payments.Status::"Pending Approval" then
            Error(Text003);

        Reopen(Payments);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeReleasePayments(var Payments: Record Payments)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterReleasePayments(var Payments: Record Payments)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeReopenPayments(var Payments: Record Payments)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterReopenPayments(var Payments: Record Payments)
    begin
    end;


    procedure PerformSalaryRelease(var Salary: Record "Payroll Header")
    var
        PrepaymentMgt: Codeunit "Prepayment Mgt.";
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        with Salary do begin


            if Status = Status::Released then
                exit;

            //OnBeforeReleasePayments(Rec);
            //OnCheckImpMemoReleaseRestrictions;

            Status := Status::Released;



            Modify(true);
        end;
    end;


    procedure PerformSalaryReopen(var Salary: Record "Payroll Header")
    begin
        with Salary do begin
            if Status = Status::Open then
                exit;
            Status := Status::Open;

            Modify(true);

        end;
    end;


    // procedure PerformTSalaryRelease(var Salary: Record "Payroll HeaderT")
    // var
    //     PrepaymentMgt: Codeunit "Prepayment Mgt.";
    // //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    // begin
    //     with Salary do begin


    //         if Status = Status::Released then
    //             exit;

    //         //OnBeforeReleasePayments(Rec);
    //         //OnCheckImpMemoReleaseRestrictions;

    //         Status := Status::Released;



    //         Modify(true);
    //     end;
    // end;


    // procedure PerformTSalaryReopen(var Salary: Record "Payroll HeaderT")
    // begin
    //     with Salary do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;

    //         Modify(true);

    //     end;
    // end;

    local procedure "*************Notification************"()
    begin
    end;

    local procedure SendApprovalNotification(ApprovalCode: Code[30])
    var
        SMTPMail: Codeunit "Email Message";
        SenderEmail: Text;
        ReceipientEmail: Text;
        UserSetup: Record "User Setup";
        SMTPMailSetup: Record "Email Account";
        SenderName: Text;
        ApprovalEntry: Record "Approval Entry";
    begin
        ApprovalEntry.Reset;
        ApprovalEntry.SetRange("Document No.", ApprovalCode);
        if ApprovalEntry.FindLast then begin
            SMTPMailSetup.Get;
            SenderEmail := SMTPMailSetup."Email Address";
            // SenderName := SMTPMailSetup."Email Sender Name";
            UserSetup.Reset;
            UserSetup.SetRange("User ID", ApprovalEntry."Sender ID");
            if UserSetup.Find('-') then begin
                if UserSetup."E-Mail" <> '' then begin

                    //SMTPMail.Create(SenderEmail, SenderEmail, UserSetup."E-Mail", 'APPROVAL REQUEST', '', true);
                    // SMTPMail.AppendToBody('<br><br>');
                    // SMTPMail.AppendToBody('Dear ' + UserSetup."Employee Name" + ',<br><br>');
                    // // SMTPMail.AppendToBody('<br><br>');
                    // SMTPMail.AppendToBody('The approval request for the document' + ' ' + Format(ApprovalEntry."Document Type") + ':' + ApprovalEntry."Document No." + ' ' + ' has been approved<br><br>');
                    // // SMTPMail.AppendToBody('<br><br>');
                    // SMTPMail.AppendToBody('Thanks & Regards<br><br>');
                    // // SMTPMail.AppendToBody('<br><br>');
                    // SMTPMail.AppendToBody(SenderEmail);
                    // // SMTPMail.AppendToBody('<br><br>');//SMTPMail.AppendToBody('<HR>');
                    // SMTPMail.AppendToBody('This is a system generated mail.');
                    // SMTPMail.AppendToBody('<br><br>');
                    // SMTPMail.Send;
                end;
            end
        end
    end;
}

#pragma implicitwith restore

