TableExtension 52193520 tableextension52193520 extends "Finance Charge Memo Line" 
{

    //Unsupported feature: Code Modification on "CalcFinChrg(PROCEDURE 6)".

    //procedure CalcFinChrg();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetFinChrgMemoHeader;
        Amount := 0;
        "VAT Amount" := 0;
        "VAT Calculation Type" := "VAT Calculation Type"::"Normal VAT";
        "Gen. Prod. Posting Group" := '';
        "VAT Prod. Posting Group" := '';
        "Interest Rate" := 0;
        CustLedgEntry.GET("Entry No.");
        IF CustLedgEntry."On Hold" <> '' THEN
          EXIT;

        "Interest Rate" := FinChrgTerms."Interest Rate";
        CASE FinChrgTerms."Interest Calculation Method" OF
          FinChrgTerms."Interest Calculation Method"::"Average Daily Balance":
            BEGIN
              FinChrgTerms.TESTFIELD("Interest Period (Days)");
              ReminderEntry.SETCURRENTKEY("Customer Entry No.");
              ReminderEntry.SETRANGE("Customer Entry No.","Entry No.");
              ReminderEntry.SETRANGE(Type,ReminderEntry.Type::"Finance Charge Memo");
              InterestCalcDate := CustLedgEntry."Due Date";
              IF ReminderEntry.FINDLAST THEN
                InterestCalcDate := ReminderEntry."Document Date";
              ReminderEntry.SETRANGE(Type,ReminderEntry.Type::Reminder);
              ReminderEntry.SETRANGE("Interest Posted",TRUE);
              IF ReminderEntry.FINDLAST THEN
                IF ReminderEntry."Document Date" > InterestCalcDate THEN
                  InterestCalcDate := ReminderEntry."Document Date";
              CalcInterest := FALSE;
              FinChrgMemoLine3.DELETEALL;
              IF CALCDATE(FinChrgTerms."Grace Period","Due Date") < FinChrgMemoHeader."Document Date" THEN BEGIN
                CalcInterest := TRUE;
                IF CustLedgEntry."Calculate Interest" THEN BEGIN
                  ClosedatDate := CalcClosedatDate;
                  IF ClosedatDate <= CALCDATE(FinChrgTerms."Grace Period","Due Date") THEN
                    CalcInterest := FALSE;
                END;
                DtldCLE.SETCURRENTKEY("Cust. Ledger Entry No.","Entry Type","Posting Date");
                DtldCLE.SETRANGE("Cust. Ledger Entry No.",CustLedgEntry."Entry No.");
                DtldCLE.SETFILTER("Entry Type",'%1|%2',
                  DtldCLE."Entry Type"::"Initial Entry",
                  DtldCLE."Entry Type"::Application);
                DtldCLE.SETRANGE("Posting Date",0D,FinChrgMemoHeader."Document Date");
                IF DtldCLE.FIND('-') THEN
                  REPEAT
                    IF DtldCLE."Entry Type" = DtldCLE."Entry Type"::"Initial Entry" THEN
                      InterestStartDate := CustLedgEntry."Due Date"
                    ELSE
                      InterestStartDate := DtldCLE."Posting Date";
                    IF InterestCalcDate > InterestStartDate THEN
                      InterestStartDate := InterestCalcDate;
                    Amount := Amount + DtldCLE.Amount * (FinChrgMemoHeader."Document Date" - InterestStartDate);
                  UNTIL DtldCLE.NEXT = 0;
                IF (NOT FinChrgTerms."Add. Line Fee in Interest") AND
                   (CustLedgEntry."Document Type" = CustLedgEntry."Document Type"::Reminder) AND
                   IssuedReminderHeader.GET(CustLedgEntry."Document No.")
                THEN BEGIN
                  IssuedReminderHeader.CALCFIELDS("Add. Fee per Line");
                  LineFee := IssuedReminderHeader."Add. Fee per Line" + IssuedReminderHeader.CalculateLineFeeVATAmount;
                  Amount := Amount - LineFee * (FinChrgMemoHeader."Document Date" - InterestStartDate);
                  IF Amount < 0 THEN
                    Amount := 0;
                END;
              END;
              BaseAmount := Amount / FinChrgTerms."Interest Period (Days)";
              IF CalcInterest THEN
                Amount := Amount / FinChrgTerms."Interest Period (Days)" * "Interest Rate" / 100
              ELSE
                Amount := 0;
            END;
          FinChrgTerms."Interest Calculation Method"::"Balance Due":
            IF CALCDATE(FinChrgTerms."Grace Period","Due Date") < FinChrgMemoHeader."Document Date" THEN BEGIN
              Amount := "Remaining Amount" * "Interest Rate" / 100;
              BaseAmount := "Remaining Amount";
            END;
        END;

        IF FinChrgTerms."Line Description" <> '' THEN BEGIN
          DocTypeText := DELCHR(FORMAT("Document Type"),'<');
          IF DocTypeText = '' THEN
            DocTypeText := Text002;
          Description :=
            COPYSTR(
              STRSUBSTNO(
                FinChrgTerms."Line Description",
                CustLedgEntry.Description,
                DocTypeText,
                "Document No.",
                "Interest Rate",
                FORMAT("Original Amount",0,ApplicationManagement.AutoFormatTranslate(1,FinChrgMemoHeader."Currency Code")),
                FORMAT(BaseAmount,0,ApplicationManagement.AutoFormatTranslate(1,FinChrgMemoHeader."Currency Code")),
                "Due Date",
                FinChrgMemoHeader."Currency Code"),
              1,
              MAXSTRLEN(Description));
        END;

        IF Amount <> 0 THEN BEGIN
          CustPostingGr.GET(FinChrgMemoHeader."Customer Posting Group");
          CustPostingGr.TESTFIELD("Interest Account");
          GLAcc.GET(CustPostingGr."Interest Account");
          GLAcc.TESTFIELD("Gen. Prod. Posting Group");
          VALIDATE("Gen. Prod. Posting Group",GLAcc."Gen. Prod. Posting Group");
          VALIDATE("VAT Prod. Posting Group",GLAcc."VAT Prod. Posting Group");
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..52
        #63..104
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "CalcFinChrg(PROCEDURE 6).IssuedReminderHeader(Variable 1003)".


    //Unsupported feature: Deletion (VariableCollection) on "CalcFinChrg(PROCEDURE 6).LineFee(Variable 1004)".

}

