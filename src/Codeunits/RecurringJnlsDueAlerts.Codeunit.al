Codeunit 52193486 "Recurring Jnls Due Alerts"
{

    trigger OnRun()
    begin
        /*
        UserSetup.RESET;
        IF UserSetup.GET(USERID) THEN BEGIN
          UserSetup.TESTFIELD("E-Mail");
          SenderAddress := UserSetup."E-Mail";
        END;
        */

        CompanyInfo.Get();
        SenderAddress := CompanyInfo."Administrator Email";

        SenderName := COMPANYNAME;

        //NewItem.SETRANGE("Date Filter",0D,99993112D);
        GLSetup.Get;

        JnlLine.Reset;
        //JnlLine.SETRANGE(JnlLine."Journal Template Name",'RECURRING');
        JnlLine.SetFilter(JnlLine."Expiration Date", '=%1', Today);//CALCDATE(-GLSetup."Jnl Notification Time Period",
        if JnlLine.Find('-') then begin
            repeat

                Subject := StrSubstNo('Recurring Payments Expiring Notification');
                Body := StrSubstNo('This is to inform you that Recurring Payment %1 is expiring on ', JnlLine."Journal Batch Name", JnlLine."Expiration Date");

                CompanyInfo.Get();

                Recipients := CompanyInfo."Finance Support Email";

                SMTPSetup.Create(Recipients, Subject, Body, true);

                Email.Send(SMTPSetup);

            //END;

            until JnlLine.Next = 0;
        end;

    end;

    var
        AvailToPromise: Codeunit "Available to Promise";
        Demand: Decimal;
        Supply: Decimal;
        JnlLine: Record "Gen. Journal Line";
        QtyAvailable: Decimal;
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
        CompanyInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        SenderAddress: Text[80];
        Recipients: Text[80];
        SenderName: Text[50];
        Body: Text[250];
        Subject: Text[80];
        InvoiceHeader: Record "Purch. Inv. Header";
        GLSetup: Record "General Ledger Setup";
}

