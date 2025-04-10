PageExtension 52193497 pageextension52193497 extends "Reminder Statistics" 
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
        VATInterest := 0;
        IF ReminderLevel.GET("Reminder Terms Code","Reminder Level") THEN
        #7..11
              VATPostingSetup.GET("VAT Bus. Posting Group",GLAcc."VAT Prod. Posting Group");
            Interest :=
              (ReminderTotal -
               "Remaining Amount" - ("Additional Fee" + "Add. Fee per Line") * (VATPostingSetup."VAT %" / 100 + 1)) /
              (VATInterest / 100 + 1);
            VatAmount := Interest * VATInterest / 100 + "Additional Fee" * VATPostingSetup."VAT %" / 100 + CalculateLineFeeVATAmount;
          END ELSE
            Interest := "Interest Amount";

        #21..25
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
        #4..14
               "Remaining Amount" - "Additional Fee" * (VATPostingSetup."VAT %" / 100 + 1)) / (VATInterest / 100 + 1);
            VatAmount := Interest * VATInterest / 100 + "Additional Fee" * VATPostingSetup."VAT %" / 100;
        #18..28
        */
    //end;
}

