TableExtension 52193505 tableextension52193505 extends "Bank Acc. Reconciliation Line" 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Related-Party Name"(Field 15)".


        //Unsupported feature: Property Modification (Data type) on ""Related-Party Bank Acc. No."(Field 24)".

    }

    //Unsupported feature: Code Modification on "RemoveAppliedPaymentEntries(PROCEDURE 9)".

    //procedure RemoveAppliedPaymentEntries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        AppliedPmtEntry.SETRANGE("Statement Type","Statement Type");
        AppliedPmtEntry.SETRANGE("Bank Account No.","Bank Account No.");
        AppliedPmtEntry.SETRANGE("Statement No.","Statement No.");
        #4..7

        VALIDATE("Applied Amount",0);
        VALIDATE("Applied Entries",0);
        "Account No." := '';
        MODIFY(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..10
        MODIFY(TRUE);
        */
    //end;
}

