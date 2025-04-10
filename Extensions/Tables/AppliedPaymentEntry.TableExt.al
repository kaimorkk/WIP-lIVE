TableExtension 52193644 tableextension52193644 extends "Applied Payment Entry" 
{

    //Unsupported feature: Code Modification on "CheckEntryAmt(PROCEDURE 1)".

    //procedure CheckEntryAmt();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Applied Amount" = 0 THEN
          EXIT;

        BankAccReconLine.GET("Statement Type","Bank Account No.","Statement No.","Statement Line No.");

        // Amount should not exceed Remaining Amount
        AmtAvailableToApply := GetRemAmt - GetAmtAppliedToOtherStmtLines;
        #8..11
          END ELSE
            IF NOT ("Applied Amount" IN [AmtAvailableToApply..0]) THEN
              ERROR(AmtCannotExceedErr,AmtAvailableToApply,GetRemAmt,GetAmtAppliedToOtherStmtLines);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
        IF BankAccReconLine."Statement Amount" > 0 THEN BEGIN
          IF "Applied Amount" <= 0 THEN
            ERROR(AmountMustBetweenErr,0,BankAccReconLine."Statement Amount");
        END ELSE
          IF "Applied Amount" > 0 THEN
            ERROR(AmountMustBetweenErr,BankAccReconLine."Statement Amount",0);
        #5..14
        */
    //end;


    //Unsupported feature: Code Modification on "SuggestAmtToApply(PROCEDURE 11)".

    //procedure SuggestAmtToApply();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        RemAmtToApply := GetRemAmt - GetAmtAppliedToOtherStmtLines;
        LineRemAmtToApply := GetStmtLineRemAmtToApply + "Applied Pmt. Discount";

        IF "Account Type" = "Account Type"::Customer THEN
          IF (LineRemAmtToApply >= 0) AND ("Document Type" = "Document Type"::"Credit Memo") THEN
            EXIT(RemAmtToApply);
        IF "Account Type" = "Account Type"::Vendor THEN
          IF (LineRemAmtToApply <= 0) AND ("Document Type" = "Document Type"::"Credit Memo") THEN
            EXIT(RemAmtToApply);

        EXIT(
          AbsMin(
            RemAmtToApply,
            LineRemAmtToApply));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        EXIT(
          AbsMin(
            GetRemAmt - GetAmtAppliedToOtherStmtLines,
            GetStmtLineRemAmtToApply + "Applied Pmt. Discount"));
        */
    //end;


    //Unsupported feature: Code Modification on "GetStmtLineRemAmtToApply(PROCEDURE 12)".

    //procedure GetStmtLineRemAmtToApply();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        BankAccReconLine.GET("Statement Type","Bank Account No.","Statement No.","Statement Line No.");
        IF BankAccReconLine.Difference = 0 THEN
          EXIT(0);
        EXIT(BankAccReconLine.Difference + GetOldAppliedAmtInclDisc);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        BankAccReconLine.GET("Statement Type","Bank Account No.","Statement No.","Statement Line No.");
        IF BankAccReconLine."Statement Amount" * BankAccReconLine."Applied Amount" < 0 THEN
          EXIT(0);
        IF ABS(BankAccReconLine."Statement Amount") <= ABS(BankAccReconLine."Applied Amount") THEN
          EXIT(0);
        EXIT(BankAccReconLine.Difference + GetOldAppliedAmtInclDisc);
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "SuggestAmtToApply(PROCEDURE 11).RemAmtToApply(Variable 1000)".


    //Unsupported feature: Deletion (VariableCollection) on "SuggestAmtToApply(PROCEDURE 11).LineRemAmtToApply(Variable 1001)".


    var
        AmountMustBetweenErr: label 'Amount to Apply must be between %1 and %2.';
}

