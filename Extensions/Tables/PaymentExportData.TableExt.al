TableExtension 52193639 tableextension52193639 extends "Payment Export Data" 
{
    fields
    {

        //Unsupported feature: Deletion (FieldCollection) on ""Recipient County"(Field 91)".


        //Unsupported feature: Deletion (FieldCollection) on ""Recipient Bank County"(Field 92)".


        //Unsupported feature: Deletion (FieldCollection) on ""Sender Bank County"(Field 93)".


        //Unsupported feature: Deletion (FieldCollection) on ""Transit No."(Field 171)".

    }

    //Unsupported feature: Code Modification on "SetCustomerAsRecipient(PROCEDURE 2)".

    //procedure SetCustomerAsRecipient();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Recipient Name" := Customer.Name;
        "Recipient Address" := Customer.Address;
        "Recipient City" := COPYSTR(Customer.City,1,35);
        "Recipient County" := Customer.County;
        "Recipient Post Code" := Customer."Post Code";
        "Recipient Country/Region Code" := Customer."Country/Region Code";
        "Recipient Email Address" := Customer."E-Mail";
        "Recipient Bank Name" := CustomerBankAccount.Name;
        "Recipient Bank Address" := CustomerBankAccount.Address;
        "Recipient Bank City" := COPYSTR(CustomerBankAccount.City,1,35);
        "Recipient Bank County" := CustomerBankAccount.County;
        "Recipient Bank Post Code" := CustomerBankAccount."Post Code";
        "Recipient Bank Country/Region" := CustomerBankAccount."Country/Region Code";
        "Recipient Bank BIC" := CustomerBankAccount."SWIFT Code";
        "Recipient Bank Acc. No." := COPYSTR(CustomerBankAccount.GetBankAccountNo,1,MAXSTRLEN("Recipient Bank Acc. No."));
        "Recipient Bank Clearing Std." := CustomerBankAccount."Bank Clearing Standard";
        "Recipient Bank Clearing Code" := CustomerBankAccount."Bank Clearing Code";
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
        #5..10
        #12..17
        */
    //end;


    //Unsupported feature: Code Modification on "SetVendorAsRecipient(PROCEDURE 10)".

    //procedure SetVendorAsRecipient();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Recipient Name" := Vendor.Name;
        "Recipient Address" := Vendor.Address;
        "Recipient City" := COPYSTR(Vendor.City,1,35);
        "Recipient County" := Vendor.County;
        "Recipient Post Code" := Vendor."Post Code";
        "Recipient Country/Region Code" := Vendor."Country/Region Code";
        "Recipient Email Address" := Vendor."E-Mail";
        "Recipient Bank Name" := VendorBankAccount.Name;
        "Recipient Bank Address" := VendorBankAccount.Address;
        "Recipient Bank City" := COPYSTR(VendorBankAccount.City,1,35);
        "Recipient Bank County" := VendorBankAccount.County;
        "Recipient Bank Post Code" := VendorBankAccount."Post Code";
        "Recipient Bank Country/Region" := VendorBankAccount."Country/Region Code";
        "Recipient Bank BIC" := VendorBankAccount."SWIFT Code";
        "Recipient Bank Acc. No." := COPYSTR(VendorBankAccount.GetBankAccountNo,1,MAXSTRLEN("Recipient Bank Acc. No."));
        "Recipient Bank Clearing Std." := VendorBankAccount."Bank Clearing Standard";
        "Recipient Bank Clearing Code" := VendorBankAccount."Bank Clearing Code";
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
        #5..10
        #12..17
        */
    //end;


    //Unsupported feature: Code Modification on "SetBankAsSenderBank(PROCEDURE 11)".

    //procedure SetBankAsSenderBank();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Sender Bank Name - Data Conv." := BankAccount."Bank Name - Data Conversion";
        "Sender Bank Name" := BankAccount.Name;
        "Sender Bank Address" := BankAccount.Address;
        "Sender Bank City" := BankAccount.City;
        "Sender Bank County" := BankAccount.County;
        "Sender Bank Post Code" := BankAccount."Post Code";
        "Sender Bank Account Code" := BankAccount."No.";
        "Sender Bank Account No." := COPYSTR(BankAccount.GetBankAccountNo,1,MAXSTRLEN("Sender Bank Account No."));
        "Sender Bank BIC" := BankAccount."SWIFT Code";
        "Sender Bank Clearing Std." := BankAccount."Bank Clearing Standard";
        "Sender Bank Clearing Code" := BankAccount."Bank Clearing Code";
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
        #6..11
        */
    //end;


    //Unsupported feature: Code Modification on "SetCreditorIdentifier(PROCEDURE 6)".

    //procedure SetCreditorIdentifier();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        BankAccount.TESTFIELD("Creditor No.");
        "Creditor No." := BankAccount."Creditor No.";
        "Transit No." := BankAccount."Transit No.";
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        BankAccount.TESTFIELD("Creditor No.");
        "Creditor No." := BankAccount."Creditor No.";
        */
    //end;
}

