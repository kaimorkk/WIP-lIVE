TableExtension 52193515 tableextension52193515 extends "Reminder Line" 
{
    fields
    {
        modify(Type)
        {
            OptionCaption = ' ,G/L Account,Customer Ledger Entry';

            //Unsupported feature: Property Modification (OptionString) on "Type(Field 4)".

        }
        modify("No.")
        {
            TableRelation = if (Type=const(" ")) "Standard Text"
                            else if (Type=const("G/L Account")) "G/L Account";
        }
        modify("Line Type")
        {
            OptionCaption = 'Reminder Line,Not Due,Beginning Text,Ending Text,Rounding,On Hold,Additional Fee';

            //Unsupported feature: Property Modification (OptionString) on ""Line Type"(Field 25)".

        }

        //Unsupported feature: Code Modification on "Type(Field 4).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF Type <> xRec.Type THEN BEGIN
              ReminderLine := Rec;
              INIT;
              Type := ReminderLine.Type;
              GetReminderHeader;
              IF Type = Type::"Line Fee" THEN BEGIN
                "Line Type" := "Line Type"::"Line Fee";
                CustPostingGr.GET(ReminderHeader."Customer Posting Group");
                IF CustPostingGr."Add. Fee per Line Account" <> '' THEN
                  VALIDATE("No.",CustPostingGr."Add. Fee per Line Account");
              END;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..5
            END;
            */
        //end;


        //Unsupported feature: Code Modification on ""Entry No."(Field 5).OnValidate".

        //trigger "(Field 5)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TESTFIELD(Type,Type::"Customer Ledger Entry");
            GetReminderHeader;
            CustLedgEntry.GET("Entry No.");
            CustLedgEntry.TESTFIELD(Open,TRUE);
            CustLedgEntry.TESTFIELD("Customer No.",ReminderHeader."Customer No.");
            IF CustLedgEntry."Currency Code" <> ReminderHeader."Currency Code" THEN
              ERROR(
                MustBeSameErr,
                ReminderHeader.FIELDCAPTION("Currency Code"),
                ReminderHeader.TABLECAPTION,CustLedgEntry.TABLECAPTION);
            "Posting Date" := CustLedgEntry."Posting Date";
            #12..16
            CustLedgEntry.CALCFIELDS(Amount,"Remaining Amount");
            "Original Amount" := CustLedgEntry.Amount;
            "Remaining Amount" := CustLedgEntry."Remaining Amount";
            "No. of Reminders" := GetNoOfReminderForCustLedgEntry("Entry No.");

            CalcFinChrg;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..7
                Text000,
            #9..19

            ReminderEntry.SETCURRENTKEY("Customer Entry No.");
            ReminderEntry.SETRANGE("Customer Entry No.","Entry No.");
            ReminderEntry.SETRANGE(Type,ReminderEntry.Type::Reminder);
            IF ReminderEntry.FINDLAST THEN
              "No. of Reminders" := ReminderEntry."Reminder Level"
            ELSE
              "No. of Reminders" := 0;
            IF (CustLedgEntry."On Hold" = '') AND ("Due Date" < ReminderHeader."Document Date") THEN
              "No. of Reminders" := "No. of Reminders" + 1;
            CalcFinChrg;
            */
        //end;

        //Unsupported feature: Deletion on ""No. of Reminders"(Field 6).OnValidate".



        //Unsupported feature: Code Modification on ""Document No."(Field 11).OnValidate".

        //trigger "(Field 11)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TESTFIELD(Type,Type::"Customer Ledger Entry");
            "Entry No." := 0;
            IF "Document No." <> '' THEN BEGIN
            #4..7
              IF CustLedgEntry.FINDFIRST THEN
                VALIDATE("Entry No.",CustLedgEntry."Entry No.")
              ELSE
                ERROR(NoOpenEntriesErr,FORMAT(Type),FIELDCAPTION("Document No."),"Document No.");
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..10
                ERROR(Text002,FORMAT(Type),FIELDCAPTION("Document No."),"Document No.");
            END;
            */
        //end;


        //Unsupported feature: Code Modification on ""No."(Field 15).OnValidate".

        //trigger "(Field 15)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "No." <> '' THEN
              CASE Type OF
                Type::" ":
            #4..9
                    ReminderLine.Type := ReminderLine.Type::" ";
                    ReminderLine2.Type := ReminderLine2.Type::"G/L Account";
                    ERROR(
                      MustBeErr,
                      FIELDCAPTION(Type),ReminderLine.Type,ReminderLine2.Type);
                  END;
                Type::"G/L Account":
                  FillLineWithGLAccountData("No.");
                Type::"Line Fee":
                  FillLineWithGLAccountData("No.");
              END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..12
                      Text001,
            #14..16
                  BEGIN
                    GLAcc.GET("No.");
                    GLAcc.CheckGLAcc;
                    IF NOT "System-Created Entry" THEN
                      GLAcc.TESTFIELD("Direct Posting",TRUE);
                    GLAcc.TESTFIELD("Gen. Prod. Posting Group");
                    Description := GLAcc.Name;
                    GetReminderHeader;
                    "Tax Group Code" := GLAcc."Tax Group Code";
                    VALIDATE("Gen. Prod. Posting Group",GLAcc."Gen. Prod. Posting Group");
                    VALIDATE("VAT Prod. Posting Group",GLAcc."VAT Prod. Posting Group");
                  END;
              END;
            */
        //end;


        //Unsupported feature: Code Modification on "Amount(Field 16).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF Type = Type::" " THEN BEGIN
              ReminderLine.Type := ReminderLine.Type::"G/L Account";
              ReminderLine2.Type := ReminderLine.Type::"Customer Ledger Entry";
              ERROR(
                MustBeErr,
                FIELDCAPTION(Type),ReminderLine.Type,ReminderLine2.Type);
            END;
            IF (Type = Type::"Line Fee") AND (Amount < 0) THEN
              ERROR(MustBePositiveErr,FIELDCAPTION(Amount));

            GetReminderHeader;
            Amount := ROUND(Amount,Currency."Amount Rounding Precision");
            CASE "VAT Calculation Type" OF
            #14..32
                END;
            END;
            "VAT Amount" := ROUND("VAT Amount",Currency."Amount Rounding Precision");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..4
                Text001,
                FIELDCAPTION(Type),ReminderLine.Type,ReminderLine2.Type);
            END;
            #11..35
            */
        //end;

        //Unsupported feature: Deletion (FieldCollection) on ""Applies-to Document Type"(Field 27)".


        //Unsupported feature: Deletion (FieldCollection) on ""Applies-to Document No."(Field 28)".

    }


    //Unsupported feature: Code Modification on "CalcFinChrg(PROCEDURE 6)".

    //procedure CalcFinChrg();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetReminderHeader;
        "Interest Rate" := 0;
        Amount := 0;
        "VAT Amount" := 0;
        "VAT Calculation Type" := "VAT Calculation Type"::"Normal VAT";
        "Gen. Prod. Posting Group" := '';
        "VAT Prod. Posting Group" := '';
        CustLedgEntry.GET("Entry No.");
        IF (CustLedgEntry."On Hold" <> '') OR ("Due Date" >= ReminderHeader."Document Date") THEN
          EXIT;

        ReminderLevel.SETRANGE("Reminder Terms Code",ReminderHeader."Reminder Terms Code");
        IF ReminderHeader."Use Header Level" THEN
          ReminderLevel.SETRANGE("No.",1,ReminderHeader."Reminder Level")
        ELSE
          ReminderLevel.SETRANGE("No.",1,"No. of Reminders");
        IF NOT ReminderLevel.FINDLAST THEN
          ReminderLevel.INIT;
        IF (NOT ReminderLevel."Calculate Interest") OR (ReminderHeader."Fin. Charge Terms Code" = '') THEN
          EXIT;
        FinChrgTerms.GET(ReminderHeader."Fin. Charge Terms Code");
        "Interest Rate" := FinChrgTerms."Interest Rate";
        CASE FinChrgTerms."Interest Calculation Method" OF
          FinChrgTerms."Interest Calculation Method"::"Average Daily Balance":
            BEGIN
              CalcInterest := FALSE;
              FinChrgTerms.TESTFIELD("Interest Period (Days)");
              InterestCalcDate := CustLedgEntry."Due Date";
              ReminderEntry.SETCURRENTKEY("Customer Entry No.");
              ReminderEntry.SETRANGE("Customer Entry No.","Entry No.");
              ReminderEntry.SETRANGE(Type,ReminderEntry.Type::Reminder);
              ReminderEntry.SETRANGE("Interest Posted",TRUE);
              IF ReminderEntry.FINDLAST THEN
                InterestCalcDate := ReminderEntry."Document Date";
              ReminderEntry.SETRANGE(Type,ReminderEntry.Type::"Finance Charge Memo");
              ReminderEntry.SETRANGE("Interest Posted");
              IF ReminderEntry.FINDLAST THEN
                IF ReminderEntry."Document Date" > InterestCalcDate THEN
                  InterestCalcDate := ReminderEntry."Document Date";
              IF InterestCalcDate < ReminderHeader."Document Date" THEN BEGIN
                CalcInterest := TRUE;
                DtldCLE.SETCURRENTKEY("Cust. Ledger Entry No.","Entry Type","Posting Date");
                DtldCLE.SETRANGE("Cust. Ledger Entry No.",CustLedgEntry."Entry No.");
                DtldCLE.SETFILTER("Entry Type",'%1|%2|%3|%4|%5',
                  DtldCLE."Entry Type"::"Initial Entry",
                  DtldCLE."Entry Type"::Application,
                  DtldCLE."Entry Type"::"Payment Tolerance",
                  DtldCLE."Entry Type"::"Payment Discount Tolerance (VAT Excl.)",
                  DtldCLE."Entry Type"::"Payment Discount Tolerance (VAT Adjustment)");
                DtldCLE.SETRANGE("Posting Date",0D,ReminderHeader."Document Date");
                IF DtldCLE.FIND('-') THEN
                  REPEAT
                    IF DtldCLE."Entry Type" = DtldCLE."Entry Type"::"Initial Entry" THEN
                      InterestStartDate := CustLedgEntry."Due Date"
                    ELSE
                      InterestStartDate := DtldCLE."Posting Date";
                    IF InterestCalcDate > InterestStartDate THEN
                      InterestStartDate := InterestCalcDate;
                    Amount := Amount + DtldCLE.Amount * (ReminderHeader."Document Date" - InterestStartDate);
                  UNTIL DtldCLE.NEXT = 0;
                IF NOT FinChrgTerms."Add. Line Fee in Interest" THEN
                  IF CustLedgEntry."Document Type" = CustLedgEntry."Document Type"::Reminder THEN
                    IF IssuedReminderHeader.GET(CustLedgEntry."Document No.") THEN BEGIN
                      IssuedReminderHeader.CALCFIELDS("Add. Fee per Line");
                      LineFee := IssuedReminderHeader."Add. Fee per Line" + IssuedReminderHeader.CalculateLineFeeVATAmount;
                      Amount := Amount - LineFee * (ReminderHeader."Document Date" - InterestStartDate);
                      IF Amount < 0 THEN
                        Amount := 0;
                    END;
              END;
              IF CalcInterest THEN
                Amount := Amount / FinChrgTerms."Interest Period (Days)" * "Interest Rate" / 100
              ELSE
                Amount := 0;
            END;
          FinChrgTerms."Interest Calculation Method"::"Balance Due":
            IF "Due Date" < ReminderHeader."Document Date"
            THEN
              Amount := "Remaining Amount" * "Interest Rate" / 100;
        END;
        IF Amount <> 0 THEN BEGIN
          CustPostingGr.GET(ReminderHeader."Customer Posting Group");
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
        #1..60
        #70..88
        */
    //end;


    //Unsupported feature: Code Modification on "LookupCustLedgEntry(PROCEDURE 12)".

    //procedure LookupCustLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF PAGE.RUNMODAL(0,CustLedgEntry) = ACTION::LookupOK THEN
          IF Type = Type::"Line Fee" THEN BEGIN
            VALIDATE("Applies-to Document Type",CustLedgEntry."Document Type");
            VALIDATE("Applies-to Document No.",CustLedgEntry."Document No.");
          END ELSE
            VALIDATE("Entry No.",CustLedgEntry."Entry No.");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF PAGE.RUNMODAL(0,CustLedgEntry) = ACTION::LookupOK THEN
          VALIDATE("Entry No.",CustLedgEntry."Entry No.");
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "CalcFinChrg(PROCEDURE 6).IssuedReminderHeader(Variable 1004)".


    //Unsupported feature: Deletion (VariableCollection) on "CalcFinChrg(PROCEDURE 6).LineFee(Variable 1003)".


    var
        Text000: label 'The %1 on the %2 and the %3 must be the same.';
        Text001: label '%1 must be %2 or %3.';

    var
        Text002: label 'There is no open %1 with %2 %3.';
}

