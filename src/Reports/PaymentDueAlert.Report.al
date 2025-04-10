Report 52193674 "Payment Due Alert"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CompInfo.Get;
                PPSetup.Get;
                if CalcDate(PPSetup."Due Period", "Due Date") = Today then begin
                    SenderName := CompInfo.Name;
                    SenderEmail := CompInfo."E-Mail";
                    Recipients := PPSetup."Payment Due Notification Email";
                    Body := StrSubstNo(Text001, "Document No.", "Vendor No.", "Due Date");
                    Subject := Text002;
                    SMTP.Create(Recipients, Subject, Body, true);
                    Email.Send(SMTP);
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        SMTP: Codeunit "Email Message";
        Email: Codeunit Email;
        Body: Text[250];
        Subject: Text[50];
        SenderName: Text[60];
        SenderEmail: Text[50];
        Recipients: Text[50];
        PPSetup: Record "Purchases & Payables Setup";
        CompInfo: Record "Company Information";
        Text001: label 'Payements for Invoice No %1 for Vendor No %2  is Due on %3';
        Text002: label 'Payment Due Alert';
}

