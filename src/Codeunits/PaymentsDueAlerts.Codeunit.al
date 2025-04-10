Codeunit 52193484 "Payments Due Alerts"
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
        PurchSetup.Get();
        SenderAddress := CompanyInfo."Administrator Email";

        SenderName := COMPANYNAME;

        //NewItem.SETRANGE("Date Filter",0D,99993112D);
        VendLedgerEntry.Reset;
        VendLedgerEntry.SetRange(VendLedgerEntry."Document Type", VendLedgerEntry."document type"::Invoice);
        VendLedgerEntry.SetRange(VendLedgerEntry.Open, true);
        VendLedgerEntry.SetFilter(VendLedgerEntry."Due Date", '=%1', CalcDate('5D', Today));
        if VendLedgerEntry.Find('-') then begin
            repeat


                Subject := StrSubstNo('Payment Due Notification');
                Body := StrSubstNo('This is to inform you that Purchase Invoice %1 is due in 5 days', VendLedgerEntry."Document No.");

                CompanyInfo.Get();

                Recipients := CompanyInfo."Finance Support Email";//PurchSetup."ACE Email";

                SMTPSetup.Create(Recipients, Subject, Body, true);

                Email.Send(SMTPSetup);

            //END;

            until VendLedgerEntry.Next = 0;
        end;

    end;

    var
        AvailToPromise: Codeunit "Available to Promise";
        Demand: Decimal;
        Supply: Decimal;
        VendLedgerEntry: Record "Vendor Ledger Entry";
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
        PurchSetup: Record "Purchases & Payables Setup";
}

