TableExtension 52193514 tableextension52193514 extends "Reminder Header" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Customer No."(Field 2).OnValidate".

        //trigger "(Field 2)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF CurrFieldNo = FIELDNO("Customer No.") THEN
              IF Undo THEN BEGIN
                "Customer No." := xRec."Customer No.";
            #4..8
              EXIT;
            END;
            Cust.GET("Customer No.");
            IF Cust."Privacy Blocked" THEN
              Cust.CustPrivacyBlockedErrorMessage(Cust,FALSE);
            IF Cust.Blocked = Cust.Blocked::All THEN
              Cust.CustBlockedErrorMessage(Cust,FALSE);
            Name := Cust.Name;
            #17..37
            VALIDATE("Reminder Terms Code");

            CreateDim(DATABASE::Customer,"Customer No.");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..11
            #14..40
            */
        //end;


        //Unsupported feature: Code Modification on ""Reminder Terms Code"(Field 24).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF CurrFieldNo = FIELDNO("Reminder Terms Code") THEN
              IF Undo THEN BEGIN
                "Reminder Terms Code" := xRec."Reminder Terms Code";
            #4..6
              ReminderTerms.GET("Reminder Terms Code");
              "Post Interest" := ReminderTerms."Post Interest";
              "Post Additional Fee" := ReminderTerms."Post Additional Fee";
              "Post Add. Fee per Line" := ReminderTerms."Post Add. Fee per Line";
              VALIDATE("Reminder Level");
              VALIDATE("Post Interest");
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..9
            #11..13
            */
        //end;

        //Unsupported feature: Deletion (FieldCollection) on ""Add. Fee per Line"(Field 45)".


        //Unsupported feature: Deletion (FieldCollection) on ""Post Add. Fee per Line"(Field 46)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Assigned User ID"(Field 9000)".

    }


    //Unsupported feature: Code Modification on "InsertLines(PROCEDURE 3)".

    //procedure InsertLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CurrencyForReminderLevel.INIT;
        ReminderLevel.SETRANGE("Reminder Terms Code","Reminder Terms Code");
        ReminderLevel.SETRANGE("No.",1,"Reminder Level");
        IF ReminderLevel.FINDLAST THEN BEGIN
          CALCFIELDS("Remaining Amount");
          AdditionalFee := ReminderLevel.GetAdditionalFee("Remaining Amount","Currency Code",FALSE,"Posting Date");

          IF AdditionalFee > 0 THEN BEGIN
            ReminderLine.RESET;
            ReminderLine.SETRANGE("Reminder No.","No.");
            ReminderLine.SETRANGE("Line Type",ReminderLine."Line Type"::"Reminder Line");
        #12..16
            ReminderLine.SETRANGE("Line Type");
            ReminderLine2 := ReminderLine;
            ReminderLine2.COPYFILTERS(ReminderLine);
            ReminderLine2.SETFILTER("Line Type",'<>%1',ReminderLine2."Line Type"::"Line Fee");
            IF ReminderLine2.NEXT <> 0 THEN BEGIN
              LineSpacing := (ReminderLine2."Line No." - ReminderLine."Line No.") DIV 3;
            END ELSE
              LineSpacing := 10000;
            InsertBlankLine(ReminderLine."Line Type"::"Additional Fee");

            NextLineNo := NextLineNo + LineSpacing;
            ReminderLine.INIT;
            ReminderLine."Line No." := NextLineNo;
            ReminderLine.Type := ReminderLine.Type::"G/L Account";
            TESTFIELD("Customer Posting Group");
            CustPostingGr.GET("Customer Posting Group");
            CustPostingGr.TESTFIELD("Additional Fee Account");
            ReminderLine.VALIDATE("No.",CustPostingGr."Additional Fee Account");
            ReminderLine.Description :=
              COPYSTR(
                CaptionManagement.GetTranslatedFieldCaption(
                  "Language Code",DATABASE::"Currency for Reminder Level",
                  CurrencyForReminderLevel.FIELDNO("Additional Fee")),1,100);
            ReminderLine.VALIDATE(Amount,AdditionalFee);
            ReminderLine."Line Type" := ReminderLine."Line Type"::"Additional Fee";
            ReminderLine.INSERT;
            IF TransferExtendedText.ReminderCheckIfAnyExtText(ReminderLine,FALSE) THEN
        #44..48
        InsertBeginTexts(Rec);
        InsertEndTexts(Rec);
        MODIFY;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #2..4
          IF "Currency Code" <> '' THEN
            CurrencyForReminderLevelFound :=
              CurrencyForReminderLevel.GET(
                ReminderLevel."Reminder Terms Code",ReminderLevel."No.","Currency Code")
          ELSE
            CurrencyForReminderLevelFound := FALSE;
          IF (NOT CurrencyForReminderLevelFound) OR
             (CurrencyForReminderLevelFound AND (CurrencyForReminderLevel."Additional Fee" <> 0))
          THEN BEGIN
        #9..19
        #21..25
          END;
          IF (NOT CurrencyForReminderLevelFound AND (ReminderLevel."Additional Fee (LCY)" <> 0)) OR
             (CurrencyForReminderLevelFound AND (CurrencyForReminderLevel."Additional Fee" <> 0))
          THEN BEGIN
        #27..34
            ReminderLine.Description := CurrencyForReminderLevel.FIELDCAPTION("Additional Fee");
            IF "Currency Code" = '' THEN
              ReminderLine.VALIDATE(Amount,ReminderLevel."Additional Fee (LCY)")
            ELSE BEGIN
              IF NOT CurrencyForReminderLevelFound THEN
                CurrencyForReminderLevel."Additional Fee" :=
                  CurrExchRate.ExchangeAmtLCYToFCY(
                    "Posting Date","Currency Code",
                    ReminderLevel."Additional Fee (LCY)",
                    CurrExchRate.ExchangeRate("Posting Date","Currency Code"));
              ReminderLine.VALIDATE(Amount,CurrencyForReminderLevel."Additional Fee");
            END;
        #41..51
        */
    //end;


    //Unsupported feature: Code Modification on "InsertEndTexts(PROCEDURE 12)".

    //procedure InsertEndTexts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ReminderLevel.SETRANGE("Reminder Terms Code",ReminderHeader."Reminder Terms Code");
        ReminderLevel.SETRANGE("No.",1,ReminderHeader."Reminder Level");
        IF ReminderLevel.FINDLAST THEN BEGIN
        #4..18
          ReminderLine.SETRANGE("Line Type");
          ReminderLine2 := ReminderLine;
          ReminderLine2.COPYFILTERS(ReminderLine);
          ReminderLine2.SETFILTER("Line Type",'<>%1',ReminderLine2."Line Type"::"Line Fee");
          IF ReminderLine2.NEXT <> 0 THEN BEGIN
            LineSpacing :=
              (ReminderLine2."Line No." - ReminderLine."Line No.") DIV
        #26..29
            LineSpacing := 10000;
          InsertTextLines(ReminderHeader);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..21
        #23..32
        */
    //end;


    //Unsupported feature: Code Modification on "InsertTextLines(PROCEDURE 4)".

    //procedure InsertTextLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ReminderText.FIND('-') THEN BEGIN
          IF ReminderText.Position = ReminderText.Position::Ending THEN
            InsertBlankLine(ReminderLine."Line Type"::"Ending Text");
          IF ReminderHeader."Fin. Charge Terms Code" <> '' THEN
            FinChrgTerms.GET(ReminderHeader."Fin. Charge Terms Code");
          IF NOT ReminderLevel."Calculate Interest" THEN
            FinChrgTerms."Interest Rate" := 0;
          ReminderHeader.CALCFIELDS(
            "Remaining Amount","Interest Amount","Additional Fee","VAT Amount","Add. Fee per Line");
          ReminderTotal :=
            ReminderHeader."Remaining Amount" + ReminderHeader."Interest Amount" +
            ReminderHeader."Additional Fee" + ReminderHeader."VAT Amount" +
            ReminderHeader."Add. Fee per Line";
          CompanyInfo.GET;

          REPEAT
        #17..31
                  ReminderHeader."Reminder Level",
                  ReminderHeader."Currency Code",
                  ReminderHeader."Posting Date",
                  CompanyInfo.Name,
                  ReminderHeader."Add. Fee per Line"),
                1,
                MAXSTRLEN(ReminderLine.Description));
            IF ReminderText.Position = ReminderText.Position::Beginning THEN
        #40..44
          IF ReminderText.Position = ReminderText.Position::Beginning THEN
            InsertBlankLine(ReminderLine."Line Type"::"Beginning Text");
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..8
            "Remaining Amount","Interest Amount","Additional Fee","VAT Amount");
          ReminderTotal :=
            ReminderHeader."Remaining Amount" + ReminderHeader."Interest Amount" +
            ReminderHeader."Additional Fee" + ReminderHeader."VAT Amount";
        #14..34
                  CompanyInfo.Name),
        #37..47
        */
    //end;


    //Unsupported feature: Code Modification on "ReminderRounding(PROCEDURE 7)".

    //procedure ReminderRounding();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetCurrency(ReminderHeader);
        IF Currency."Invoice Rounding Precision" = 0 THEN
          EXIT;

        ReminderHeader.CALCFIELDS(
          "Remaining Amount","Interest Amount","Additional Fee","VAT Amount","Add. Fee per Line");

        TotalAmountInclVAT := ReminderHeader."Remaining Amount" +
          ReminderHeader."Interest Amount" +
          ReminderHeader."Additional Fee" +
          ReminderHeader."Add. Fee per Line" +
          ReminderHeader."VAT Amount";
        ReminderRoundingAmount :=
          -ROUND(
        #15..22
          CustPostingGr.TESTFIELD("Invoice Rounding Account");
          WITH ReminderLine DO BEGIN
            INIT;
            VALIDATE("Line No.",GetNextLineNo(ReminderHeader."No."));
            VALIDATE("Reminder No.",ReminderHeader."No.");
            VALIDATE(Type,Type::"G/L Account");
            "System-Created Entry" := TRUE;
            VALIDATE("No.",CustPostingGr."Invoice Rounding Account");
        #31..37
            INSERT;
          END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
          "Remaining Amount","Interest Amount","Additional Fee","VAT Amount");
        #7..10
        #12..25
        #28..40
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "InsertLines(PROCEDURE 3).CurrencyForReminderLevel(Variable 1002)".


    //Unsupported feature: Deletion (VariableCollection) on "InsertLines(PROCEDURE 3).CaptionManagement(Variable 1003)".


    //Unsupported feature: Deletion (VariableCollection) on "InsertLines(PROCEDURE 3).AdditionalFee(Variable 1001)".


    var
        CurrencyForReminderLevel: Record "Currency for Reminder Level";

    var
        CurrExchRate: Record "Currency Exchange Rate";

    var
        CurrencyForReminderLevelFound: Boolean;
}

