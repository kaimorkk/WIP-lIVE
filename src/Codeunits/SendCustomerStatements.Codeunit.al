Codeunit 52193481 "Send Customer Statements"
{

    trigger OnRun()
    var
        BlobInStream: InStream;
        BlobOutStream: OutStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        FileContentsB64: Text;
        RecRef: RecordRef;
    begin
        /*
        UserSetup.RESET;
        IF UserSetup.GET(USERID) THEN BEGIN
          UserSetup.TESTFIELD("E-Mail");
          SenderAddress := UserSetup."E-Mail";
        END;
        */

        AccPeriod.Reset;
        AccPeriod.SetRange(AccPeriod."Starting Date", 0D, Today);
        AccPeriod.SetRange(AccPeriod."New Fiscal Year", true);
        if AccPeriod.Find('+') then begin
            NextMonth := AccPeriod."Starting Date";
            repeat
                NextMonth := CalcDate('1M', NextMonth);
            until NextMonth > Today; //By Jacob
            StartDate := CalcDate('-2M', NextMonth);
        end;

        //MESSAGE('StartDate=%1',StartDate);

        CompanyInfo.Get();
        SenderAddress := CompanyInfo."Administrator Email";

        SenderName := COMPANYNAME;

        Subject := StrSubstNo('Imprest Statement');
        Body := StrSubstNo('Please find attached your Imprest statement for the period between %1 and %2', Format(StartDate), Format(Today));

        //IF (Next5thDay=TODAY) OR (Next20thDay=TODAY) THEN BEGIN
        //CompanyInfo.GET();
        // CurrReport.SKIP;

        Customer.Reset;
        Customer.SetFilter(Customer."Customer Posting Group", '=%1', 'IMPREST');
        //Customer.SETFILTER(Customer."No.",'%1|%2|%3','CMA0160','CMA0161','CMA0169');
        if Customer.Find('-') then begin
            repeat
                Recipients := Customer."E-Mail";

                SMTPSetup.Create(Recipients, Subject, Body, true);

                CustLedgerEntry.Reset;
                CustLedgerEntry.SetCurrentkey("Customer No.", "Posting Date", "Currency Code");
                CustLedgerEntry.SetRange(CustLedgerEntry."Customer No.", Customer."No.");
                CustLedgerEntry.SetRange("Posting Date", StartDate, Today);
                CustLedgerEntry.SetFilter(CustLedgerEntry."Remaining Amount", '<>%1', 0);
                //CustLedgerEntry.SETRANGE("Currency Code",Currency2.Code);
                if CustLedgerEntry.Find('-') then begin
                    // MESSAGE('Customer-%1',CustLedgerEntry."Customer No.");
                    Customer2.Reset;
                    Customer2.SetRange(Customer2."No.", CustLedgerEntry."Customer No.");
                    Customer2.SetRange(Customer2."Date Filter", StartDate, Today);
                    if Customer2.Find('-') then begin
                        //
                        // FileName := FileMangement.ServerTempFileName('.pdf');
                        Report.SaveAs(REPORT::Statement, '', ReportFormat::Pdf, BlobOutStream, RecRef);

                        // Report.SaveAsPdf(Report::Statement, FileName, Customer2);
                        /*
                        SMTPSetup.AddAttachment(FileName);
                        //SMTPSetup.AddCC('plusweti@cma.or.ke');
                        Email.Send(SMTPSetup);
                        */
                        Message('Statement sent to %1', Customer2.Name);

                    end;
                end;
            until Customer.Next = 0;
        end;
        //END;
        //UNTIL i=12;
        //END;

    end;

    var
        AvailToPromise: Codeunit "Available to Promise";
        Demand: Decimal;
        Supply: Decimal;
        NewItem: Record Item;
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
        Customer: Record Customer;
        CustStatement: Report Statement;
        FileName: Text[250];
        AccPeriod: Record "Accounting Period";
        NextMonth: Date;
        First5thDay: Date;
        First20thDay: Date;
        Next5thDay: Date;
        Next20thDay: Date;
        i: Integer;
        ToFile: Text[50];
        FileMangement: Codeunit "File Management";
        Customer2: Record Customer;
        StartDate: Date;
        CustLedgerEntry: Record "Cust. Ledger Entry";
}

