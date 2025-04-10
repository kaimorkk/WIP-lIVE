PageExtension 52193490 pageextension52193490 extends "Apply Bank Acc. Ledger Entries" 
{

    //Unsupported feature: Code Modification on "CalcBalance(PROCEDURE 4)".

    //procedure CalcBalance();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF BankAccount.GET("Bank Account No.") THEN BEGIN
          BankAccount.CALCFIELDS(Balance,"Total on Checks");
          Balance := BankAccount.Balance;
          CheckBalance := BankAccount."Total on Checks";
          BalanceToReconcile := CalcBalanceToReconcile;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
          BalanceToReconcile := Balance - CheckBalance;
        END;
        */
    //end;
}

