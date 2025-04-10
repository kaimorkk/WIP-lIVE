Codeunit 52193487 "Invoices Due Alerts"
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

        CustLedgerEntry.Reset;
        CustLedgerEntry.SetRange(CustLedgerEntry."Document Type", CustLedgerEntry."document type"::Invoice);
        CustLedgerEntry.SetRange(CustLedgerEntry.Open, true);
        CustLedgerEntry.SetFilter(CustLedgerEntry."Due Date", '=%1', CalcDate('5D', Today));
        if CustLedgerEntry.Find('-') then begin
            repeat

                Subject := StrSubstNo('Invoice Due Notification');
                Body := StrSubstNo('This is to inform you that Sales Invoice %1 is due in 5 days', CustLedgerEntry."Document No.");

                CompanyInfo.Get();

                SalesSetup.Get;

                Recipients := CompanyInfo."Finance Support Email";  //SalesSetup."AAR Email";

                SMTPSetup.Create(Recipients, Subject, Body, true);

                Email.Send(SMTPSetup);

            //END;

            until CustLedgerEntry.Next = 0;
        end;

    end;

    var
        AvailToPromise: Codeunit "Available to Promise";
        Demand: Decimal;
        Supply: Decimal;
        CustLedgerEntry: Record "Cust. Ledger Entry";
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
        SalesSetup: Record "Sales & Receivables Setup";
}

