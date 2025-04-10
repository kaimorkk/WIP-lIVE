TableExtension 52193614 tableextension52193614 extends "Payment Registration Buffer" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""Ledger Entry No."(Field 1)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Source No."(Field 2)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Document Type"(Field 3)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Document No."(Field 4)".


        //Unsupported feature: Property Deletion (DataClassification) on "Description(Field 5)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Due Date"(Field 6)".


        //Unsupported feature: Property Deletion (DataClassification) on "Name(Field 7)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Remaining Amount"(Field 8)".


        //Unsupported feature: Code Modification on ""Payment Made"(Field 9).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF NOT "Payment Made" THEN BEGIN
              "Amount Received" := 0;
              "Date Received" := 0D;
              "Remaining Amount" := "Original Remaining Amount";
              EXIT;
            END;

            AutoFillDate;
            IF "Amount Received" = 0 THEN
              SuggestAmountReceivedBasedOnDate;
            UpdateRemainingAmount;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..8

            SuggestAmountReceivedBasedOnDate;
            UpdateRemainingAmount;
            */
        //end;

        //Unsupported feature: Property Deletion (DataClassification) on ""Payment Made"(Field 9)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Date Received"(Field 10)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Amount Received"(Field 11)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Original Remaining Amount"(Field 12)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Rem. Amt. after Discount"(Field 13)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Pmt. Discount Date"(Field 14)".

    }


    //Unsupported feature: Code Modification on "RestoreUserValues(PROCEDURE 13)".

    //procedure RestoreUserValues();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF TempSavePmtRegnBuf.FINDSET THEN
          REPEAT
            IF GET(TempSavePmtRegnBuf."Ledger Entry No.") THEN BEGIN
              "Payment Made" := TempSavePmtRegnBuf."Payment Made";
              "Date Received" := TempSavePmtRegnBuf."Date Received";
              "Pmt. Discount Date" := TempSavePmtRegnBuf."Pmt. Discount Date";
              SuggestAmountReceivedBasedOnDate;
              "Remaining Amount" := TempSavePmtRegnBuf."Remaining Amount";
              MODIFY;
            END;
          UNTIL TempSavePmtRegnBuf.NEXT = 0;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6
              "Amount Received" := TempSavePmtRegnBuf."Amount Received";
        #8..11
        */
    //end;


    //Unsupported feature: Code Modification on "SuggestAmountReceivedBasedOnDate(PROCEDURE 4)".

    //procedure SuggestAmountReceivedBasedOnDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Date Received" = 0D THEN
          "Amount Received" := 0
        ELSE BEGIN
        #4..6
            "Amount Received" := "Original Remaining Amount";
          "Remaining Amount" := 0;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF "Amount Received" <> 0 THEN
          EXIT;

        #1..9
        */
    //end;
}

