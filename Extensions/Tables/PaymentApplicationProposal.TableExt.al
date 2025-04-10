TableExtension 52193643 tableextension52193643 extends "Payment Application Proposal" 
{
    fields
    {

        //Unsupported feature: Code Modification on "Applied(Field 25).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF xRec.Applied = Applied THEN
              EXIT;

            IF NOT Applied THEN
              Unapply;

            IF Applied THEN BEGIN
              IF "Document Type" = "Document Type"::"Credit Memo" THEN
                CrMemoSelectedToApply
              ELSE BEGIN
                BankAccReconLine.GET("Statement Type","Bank Account No.","Statement No.","Statement Line No.");
                IF BankAccReconLine.Difference = 0 THEN
                  ERROR(PaymentAppliedErr);
              END;

              Apply(GetRemainingAmountAfterPosting,"Applies-to Entry No." <> 0);
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..6
            IF Applied THEN
              Apply(GetRemainingAmountAfterPosting,"Applies-to Entry No." <> 0);
            */
        //end;
    }


    //Unsupported feature: Code Modification on "Apply(PROCEDURE 5)".

    //procedure Apply();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        AppliedPaymentEntry.TRANSFERFIELDS(Rec);

        BankAccReconciliationLine.GET(
          AppliedPaymentEntry."Statement Type",AppliedPaymentEntry."Bank Account No.",
          AppliedPaymentEntry."Statement No.",AppliedPaymentEntry."Statement Line No.");

        IF AmtToApply = 0 THEN
          ERROR(StmtAmtIsFullyAppliedErr);

        #10..21

        IF BankAccReconciliationLine."Transaction Date" < "Posting Date" THEN
          MESSAGE(STRSUBSTNO(TransactionDateIsBeforePostingDateMsg,BankAccReconciliationLine."Transaction Date","Posting Date"));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6
        IF BankAccReconciliationLine."Statement Amount" * "Remaining Amount" < 0 THEN
          ERROR(CannotApplyDifferentSignErr);

        #7..24
        */
    //end;


    //Unsupported feature: Code Modification on "RemoveApplications(PROCEDURE 9)".

    //procedure RemoveApplications();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CurrentTempPaymentApplicationProposal := Rec;

        AddFilterOnAppliedPmtEntry(AppliedPaymentEntry);

        IF AppliedPaymentEntry.FINDSET THEN
          REPEAT
        #7..12
          UNTIL AppliedPaymentEntry.NEXT = 0;

        Rec := CurrentTempPaymentApplicationProposal;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CurrentTempPaymentApplicationProposal := Rec;

        AppliedPaymentEntry.SETRANGE("Statement Type","Statement Type");
        AppliedPaymentEntry.SETRANGE("Bank Account No.","Bank Account No.");
        AppliedPaymentEntry.SETRANGE("Statement No.","Statement No.");
        AppliedPaymentEntry.SETRANGE("Statement Line No.","Statement Line No.");
        #4..15
        */
    //end;

    var
        CannotApplyDifferentSignErr: label 'You cannot apply a payment to a ledger entry that has a sign, positive or negative, different from that of the payment. To apply a payment to open ledger entries that are both negative and positive, open the Customer or Vendor Ledger Entries window, and apply the credit memo to the invoice first. Then, apply the payment to the invoice.';
}

