PageExtension 52193500 pageextension52193500 extends "Issued Reminder Statistics" 
{
    layout
    {
        modify("Add. Fee per Line")
        {
            Visible = false;
        }
    }

    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CALCFIELDS("Interest Amount","VAT Amount","Add. Fee per Line");
        ReminderTotal := "Remaining Amount" + "Additional Fee" + "Interest Amount" + "VAT Amount" + "Add. Fee per Line";
        VatAmount := "VAT Amount";
        CustPostingGr.GET("Customer Posting Group");
        IF ReminderLevel.GET("Reminder Terms Code","Reminder Level") THEN
          IF ReminderLevel."Calculate Interest" AND ("VAT Amount" <> 0) THEN BEGIN
        #7..10
              VATPostingSetup.GET("VAT Bus. Posting Group",GLAcc."VAT Prod. Posting Group");
            Interest :=
              (ReminderTotal -
               "Remaining Amount" - ("Additional Fee" + "Add. Fee per Line") * (VATPostingSetup."VAT %" / 100 + 1)) /
              (VATInterest / 100 + 1);
            VatAmount := Interest * VATInterest / 100 + "Additional Fee" * VATPostingSetup."VAT %" / 100 + CalculateLineFeeVATAmount;
          END ELSE
            Interest := "Interest Amount";

        #20..24
          CreditLimitLCYExpendedPct := 0
        ELSE
          CreditLimitLCYExpendedPct := ROUND(Cust."Balance (LCY)" / Cust."Credit Limit (LCY)" * 10000,1);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CALCFIELDS("Interest Amount","VAT Amount");
        ReminderTotal := "Remaining Amount" + "Additional Fee" + "Interest Amount" + "VAT Amount";
        #4..13
               "Remaining Amount" - "Additional Fee" * (VATPostingSetup."VAT %" / 100 + 1)) / (VATInterest / 100 + 1);
            VatAmount := Interest * VATInterest / 100 + "Additional Fee" * VATPostingSetup."VAT %" / 100;
        #17..27
        */
    //end;
}

