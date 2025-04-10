TableExtension 52193487 tableextension52193487 extends "Reversal Entry" 
{
    keys
    {

        //Unsupported feature: Deletion (KeyCollection) on ""Entry Type","Entry No."(Key)".


        //Unsupported feature: Deletion (KeyCollection) on ""Transaction No."(Key)".

    }

    //Unsupported feature: Variable Insertion (Variable: GLAcc) (VariableCollection) on "InsertReversalEntry(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: Cust) (VariableCollection) on "InsertReversalEntry(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: Vend) (VariableCollection) on "InsertReversalEntry(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: DtldCustLedgEntry) (VariableCollection) on "InsertReversalEntry(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: DtldVendLedgEntry) (VariableCollection) on "InsertReversalEntry(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: BankAcc) (VariableCollection) on "InsertReversalEntry(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: FA) (VariableCollection) on "InsertReversalEntry(PROCEDURE 7)".


    //Unsupported feature: Code Modification on "InsertReversalEntry(PROCEDURE 7)".

    //procedure InsertReversalEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GLSetup.GET;
        ReversalEntry.DELETEALL;
        PostApplied := FALSE;
        NextLineNo := 1;
        TempRevertTransactionNo.Number := Number;
        TempRevertTransactionNo.INSERT;
        SetReverseFilter(Number,RevType);

        InsertFromCustLedgEntry(TempRevertTransactionNo,Number,RevType,NextLineNo);
        InsertFromVendLedgEntry(TempRevertTransactionNo,Number,RevType,NextLineNo);
        InsertFromBankAccLedgEntry(Number,RevType,NextLineNo);
        InsertFromFALedgEntry(Number,RevType,NextLineNo);
        InsertFromMaintenanceLedgEntry(Number,RevType,NextLineNo);
        InsertFromVATEntry(TempRevertTransactionNo,Number,RevType,NextLineNo);
        InsertFromGLEntry(TempRevertTransactionNo,Number,RevType,NextLineNo);
        IF ReversalEntry.FIND('-') THEN;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..8
        IF CustLedgEntry.FIND('-') THEN
          REPEAT
            CLEAR(ReversalEntry);
            IF RevType = RevType::Register THEN
              ReversalEntry."G/L Register No." := Number;
            ReversalEntry."Reversal Type" := RevType;
            ReversalEntry."Entry Type" := ReversalEntry."Entry Type"::Customer;
            ReversalEntry."Entry No." := CustLedgEntry."Entry No.";
            Cust.GET(CustLedgEntry."Customer No.");
            ReversalEntry."Account No." := Cust."No.";
            ReversalEntry."Account Name" := Cust.Name;
            ReversalEntry."Posting Date" := CustLedgEntry."Posting Date";
            ReversalEntry."Source Code" := CustLedgEntry."Source Code";
            ReversalEntry."Journal Batch Name" := CustLedgEntry."Journal Batch Name";
            ReversalEntry."Transaction No." := CustLedgEntry."Transaction No.";
            ReversalEntry."Currency Code" := CustLedgEntry."Currency Code";
            ReversalEntry.Description := CustLedgEntry.Description;
            CustLedgEntry.CALCFIELDS(Amount,"Debit Amount","Credit Amount",
              "Amount (LCY)","Debit Amount (LCY)","Credit Amount (LCY)");
            ReversalEntry.Amount := CustLedgEntry.Amount;
            ReversalEntry."Debit Amount" := CustLedgEntry."Debit Amount";
            ReversalEntry."Credit Amount" := CustLedgEntry."Credit Amount";
            ReversalEntry."Amount (LCY)" := CustLedgEntry."Amount (LCY)";
            ReversalEntry."Debit Amount (LCY)" := CustLedgEntry."Debit Amount (LCY)";
            ReversalEntry."Credit Amount (LCY)" := CustLedgEntry."Credit Amount (LCY)";
            ReversalEntry."Document Type" := CustLedgEntry."Document Type";
            ReversalEntry."Document No." := CustLedgEntry."Document No.";
            ReversalEntry."Bal. Account Type" := CustLedgEntry."Bal. Account Type";
            ReversalEntry."Bal. Account No." := CustLedgEntry."Bal. Account No.";
            ReversalEntry."Line No." := NextLineNo;
            NextLineNo := NextLineNo + 1;
            ReversalEntry.INSERT;

            CLEAR(DtldCustLedgEntry);
            DtldCustLedgEntry.SETCURRENTKEY("Transaction No.","Customer No.","Entry Type");
            DtldCustLedgEntry.SETRANGE("Transaction No.",CustLedgEntry."Transaction No.");
            DtldCustLedgEntry.SETRANGE("Customer No.",CustLedgEntry."Customer No.");
            DtldCustLedgEntry.SETFILTER(
              "Entry Type",'<>%1',DtldCustLedgEntry."Entry Type"::"Initial Entry");
            IF NOT DtldCustLedgEntry.ISEMPTY THEN
              IF RevType = RevType::Register THEN
                ERROR(Text012,Number);
            CheckDtldCustLedgEntry(CustLedgEntry);
          UNTIL CustLedgEntry.NEXT = 0;

        IF VendLedgEntry.FIND('-') THEN
          REPEAT
            CLEAR(ReversalEntry);
            IF RevType = RevType::Register THEN
              ReversalEntry."G/L Register No." := Number;
            ReversalEntry."Reversal Type" := RevType;
            ReversalEntry."Entry Type" := ReversalEntry."Entry Type"::Vendor;
            ReversalEntry."Entry No." := VendLedgEntry."Entry No.";
            Vend.GET(VendLedgEntry."Vendor No.");
            ReversalEntry."Account No." := Vend."No.";
            ReversalEntry."Account Name" := Vend.Name;
            ReversalEntry."Posting Date" := VendLedgEntry."Posting Date";
            ReversalEntry."Source Code" := VendLedgEntry."Source Code";
            ReversalEntry."Journal Batch Name" := VendLedgEntry."Journal Batch Name";
            ReversalEntry."Transaction No." := VendLedgEntry."Transaction No.";
            ReversalEntry."Currency Code" := VendLedgEntry."Currency Code";
            ReversalEntry.Description := VendLedgEntry.Description;
            VendLedgEntry.CALCFIELDS(Amount,"Debit Amount","Credit Amount",
              "Amount (LCY)","Debit Amount (LCY)","Credit Amount (LCY)");
            ReversalEntry.Amount := VendLedgEntry.Amount;
            ReversalEntry."Debit Amount" := VendLedgEntry."Debit Amount";
            ReversalEntry."Credit Amount" := VendLedgEntry."Credit Amount";
            ReversalEntry."Amount (LCY)" := VendLedgEntry."Amount (LCY)";
            ReversalEntry."Debit Amount (LCY)" := VendLedgEntry."Debit Amount (LCY)";
            ReversalEntry."Credit Amount (LCY)" := VendLedgEntry."Credit Amount (LCY)";
            ReversalEntry."Document Type" := VendLedgEntry."Document Type";
            ReversalEntry."Document No." := VendLedgEntry."Document No.";
            ReversalEntry."Bal. Account Type" := VendLedgEntry."Bal. Account Type";
            ReversalEntry."Bal. Account No." := VendLedgEntry."Bal. Account No.";
            ReversalEntry."Line No." := NextLineNo;
            NextLineNo := NextLineNo + 1;
            ReversalEntry.INSERT;

            CLEAR(DtldVendLedgEntry);
            DtldVendLedgEntry.SETCURRENTKEY("Transaction No.","Vendor No.","Entry Type");
            DtldVendLedgEntry.SETRANGE("Transaction No.",VendLedgEntry."Transaction No.");
            DtldVendLedgEntry.SETRANGE("Vendor No.",VendLedgEntry."Vendor No.");
            DtldVendLedgEntry.SETFILTER(
              "Entry Type",'<>%1',DtldVendLedgEntry."Entry Type"::"Initial Entry");
            IF NOT DtldVendLedgEntry.ISEMPTY THEN
              IF RevType = RevType::Register THEN
                ERROR(Text012,Number);
            CheckDtldVendLedgEntry(VendLedgEntry);
          UNTIL VendLedgEntry.NEXT = 0;

        IF BankAccLedgEntry.FIND('-') THEN
          REPEAT
            CLEAR(ReversalEntry);
            IF RevType = RevType::Register THEN
              ReversalEntry."G/L Register No." := Number;
            ReversalEntry."Reversal Type" := RevType;
            ReversalEntry."Entry Type" := ReversalEntry."Entry Type"::"Bank Account";
            ReversalEntry."Entry No." := BankAccLedgEntry."Entry No.";
            BankAcc.GET(BankAccLedgEntry."Bank Account No.");
            ReversalEntry."Account No." := BankAcc."No.";
            ReversalEntry."Account Name" := BankAcc.Name;
            ReversalEntry."Posting Date" := BankAccLedgEntry."Posting Date";
            ReversalEntry."Source Code" := BankAccLedgEntry."Source Code";
            ReversalEntry."Journal Batch Name" := BankAccLedgEntry."Journal Batch Name";
            ReversalEntry."Transaction No." := BankAccLedgEntry."Transaction No.";
            ReversalEntry."Currency Code" := BankAccLedgEntry."Currency Code";
            ReversalEntry.Description := BankAccLedgEntry.Description;
            ReversalEntry.Amount := BankAccLedgEntry.Amount;
            ReversalEntry."Debit Amount" := BankAccLedgEntry."Debit Amount";
            ReversalEntry."Credit Amount" := BankAccLedgEntry."Credit Amount";
            ReversalEntry."Amount (LCY)" := BankAccLedgEntry."Amount (LCY)";
            ReversalEntry."Debit Amount (LCY)" := BankAccLedgEntry."Debit Amount (LCY)";
            ReversalEntry."Credit Amount (LCY)" := BankAccLedgEntry."Credit Amount (LCY)";
            ReversalEntry."Document Type" := BankAccLedgEntry."Document Type";
            ReversalEntry."Document No." := BankAccLedgEntry."Document No.";
            ReversalEntry."Bal. Account Type" := BankAccLedgEntry."Bal. Account Type";
            ReversalEntry."Bal. Account No." := BankAccLedgEntry."Bal. Account No.";
            ReversalEntry."Line No." := NextLineNo;
            NextLineNo := NextLineNo + 1;
            ReversalEntry.INSERT;
          UNTIL BankAccLedgEntry.NEXT = 0;

        IF FALedgEntry.FIND('-') THEN
          REPEAT
            CLEAR(ReversalEntry);
            IF RevType = RevType::Register THEN
              ReversalEntry."G/L Register No." := Number;
            ReversalEntry."Reversal Type" := RevType;
            ReversalEntry."Entry Type" := ReversalEntry."Entry Type"::"Fixed Asset";
            ReversalEntry."Entry No." := FALedgEntry."Entry No.";
            FA.GET(FALedgEntry."FA No.");
            ReversalEntry."Account No." := FA."No.";
            ReversalEntry."Account Name" := FA.Description;
            ReversalEntry."Posting Date" := FALedgEntry."Posting Date";
            ReversalEntry."FA Posting Category" := FALedgEntry."FA Posting Category";
            ReversalEntry."FA Posting Type" := FALedgEntry."FA Posting Type" + 1;
            ReversalEntry."Source Code" := FALedgEntry."Source Code";
            ReversalEntry."Journal Batch Name" := FALedgEntry."Journal Batch Name";
            ReversalEntry."Transaction No." := FALedgEntry."Transaction No.";
            ReversalEntry.Description := FALedgEntry.Description;
            ReversalEntry."Amount (LCY)" := FALedgEntry.Amount;
            ReversalEntry."Debit Amount (LCY)" := FALedgEntry."Debit Amount";
            ReversalEntry."Credit Amount (LCY)" := FALedgEntry."Credit Amount";
            ReversalEntry."VAT Amount" := FALedgEntry."VAT Amount";
            ReversalEntry."Document Type" := FALedgEntry."Document Type";
            ReversalEntry."Document No." := FALedgEntry."Document No.";
            ReversalEntry."Bal. Account Type" := FALedgEntry."Bal. Account Type";
            ReversalEntry."Bal. Account No." := FALedgEntry."Bal. Account No.";
            IF FALedgEntry."FA Posting Type" <> FALedgEntry."FA Posting Type"::"Salvage Value" THEN BEGIN
              ReversalEntry."Line No." := NextLineNo;
              NextLineNo := NextLineNo + 1;
              ReversalEntry.INSERT;
            END;
          UNTIL FALedgEntry.NEXT = 0;

        IF MaintenanceLedgEntry.FIND('-') THEN
          REPEAT
            CLEAR(ReversalEntry);
            IF RevType = RevType::Register THEN
              ReversalEntry."G/L Register No." := Number;
            ReversalEntry."Reversal Type" := RevType;
            ReversalEntry."Entry Type" := ReversalEntry."Entry Type"::Maintenance;
            ReversalEntry."Entry No." := MaintenanceLedgEntry."Entry No.";
            FA.GET(MaintenanceLedgEntry."FA No.");
            ReversalEntry."Account No." := FA."No.";
            ReversalEntry."Account Name" := FA.Description;
            ReversalEntry."Posting Date" := MaintenanceLedgEntry."Posting Date";
            ReversalEntry."Source Code" := MaintenanceLedgEntry."Source Code";
            ReversalEntry."Journal Batch Name" := MaintenanceLedgEntry."Journal Batch Name";
            ReversalEntry."Transaction No." := MaintenanceLedgEntry."Transaction No.";
            ReversalEntry.Description := MaintenanceLedgEntry.Description;
            ReversalEntry."Amount (LCY)" := MaintenanceLedgEntry.Amount;
            ReversalEntry."Debit Amount (LCY)" := MaintenanceLedgEntry."Debit Amount";
            ReversalEntry."Credit Amount (LCY)" := MaintenanceLedgEntry."Credit Amount";
            ReversalEntry."VAT Amount" := MaintenanceLedgEntry."VAT Amount";
            ReversalEntry."Document Type" := MaintenanceLedgEntry."Document Type";
            ReversalEntry."Document No." := MaintenanceLedgEntry."Document No.";
            ReversalEntry."Bal. Account Type" := MaintenanceLedgEntry."Bal. Account Type";
            ReversalEntry."Bal. Account No." := MaintenanceLedgEntry."Bal. Account No.";
            ReversalEntry."Line No." := NextLineNo;
            NextLineNo := NextLineNo + 1;
            ReversalEntry.INSERT;
          UNTIL MaintenanceLedgEntry.NEXT = 0;

        TempRevertTransactionNo.FINDSET;
        REPEAT
          IF RevType = RevType::Transaction THEN
            VATEntry.SETRANGE("Transaction No.",TempRevertTransactionNo.Number);
          IF VATEntry.FINDSET THEN
            REPEAT
              CLEAR(ReversalEntry);
              IF RevType = RevType::Register THEN
                ReversalEntry."G/L Register No." := Number;
              ReversalEntry."Reversal Type" := RevType;
              ReversalEntry."Entry Type" := ReversalEntry."Entry Type"::VAT;
              ReversalEntry."Entry No." := VATEntry."Entry No.";
              ReversalEntry."Posting Date" := VATEntry."Posting Date";
              ReversalEntry."Source Code" := VATEntry."Source Code";
              ReversalEntry."Transaction No." := VATEntry."Transaction No.";
              ReversalEntry.Amount := VATEntry.Amount;
              ReversalEntry."Amount (LCY)" := VATEntry.Amount;
              ReversalEntry."Document Type" := VATEntry."Document Type";
              ReversalEntry."Document No." := VATEntry."Document No.";
              ReversalEntry."Line No." := NextLineNo;
              NextLineNo := NextLineNo + 1;
              ReversalEntry.INSERT;
            UNTIL VATEntry.NEXT = 0;
        UNTIL TempRevertTransactionNo.NEXT = 0;

        TempRevertTransactionNo.FINDSET;
        REPEAT
          IF RevType = RevType::Transaction THEN
            GLEntry.SETRANGE("Transaction No.",TempRevertTransactionNo.Number);
          IF GLEntry.FINDSET THEN
            REPEAT
              CLEAR(ReversalEntry);
              IF RevType = RevType::Register THEN
                ReversalEntry."G/L Register No." := Number;
              ReversalEntry."Reversal Type" := RevType;
              ReversalEntry."Entry Type" := ReversalEntry."Entry Type"::"G/L Account";
              ReversalEntry."Entry No." := GLEntry."Entry No.";
              IF NOT GLAcc.GET(GLEntry."G/L Account No.") THEN
                ERROR(Text009,GLEntry.TABLECAPTION,GLAcc.TABLECAPTION);
              ReversalEntry."Account No." := GLAcc."No.";
              ReversalEntry."Account Name" := GLAcc.Name;
              ReversalEntry."Posting Date" := GLEntry."Posting Date";
              ReversalEntry."Source Code" := GLEntry."Source Code";
              ReversalEntry."Journal Batch Name" := GLEntry."Journal Batch Name";
              ReversalEntry."Transaction No." := GLEntry."Transaction No.";
              ReversalEntry."Source Type" := GLEntry."Source Type";
              ReversalEntry."Source No." := GLEntry."Source No.";
              ReversalEntry.Description := GLEntry.Description;
              ReversalEntry."Amount (LCY)" := GLEntry.Amount;
              ReversalEntry."Debit Amount (LCY)" := GLEntry."Debit Amount";
              ReversalEntry."Credit Amount (LCY)" := GLEntry."Credit Amount";
              ReversalEntry."VAT Amount" := GLEntry."VAT Amount";
              ReversalEntry."Document Type" := GLEntry."Document Type";
              ReversalEntry."Document No." := GLEntry."Document No.";
              ReversalEntry."Bal. Account Type" := GLEntry."Bal. Account Type";
              ReversalEntry."Bal. Account No." := GLEntry."Bal. Account No.";
              ReversalEntry."Line No." := NextLineNo;
              NextLineNo := NextLineNo + 1;
              ReversalEntry.INSERT;
            UNTIL GLEntry.NEXT = 0;
        UNTIL TempRevertTransactionNo.NEXT = 0;

        IF ReversalEntry.FIND('-') THEN;
        */
    //end;


    //Unsupported feature: Code Modification on "CheckDtldCustLedgEntry(PROCEDURE 2)".

    //procedure CheckDtldCustLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        DtldCustLedgEntry.SETCURRENTKEY("Cust. Ledger Entry No.","Entry Type");
        DtldCustLedgEntry.SETRANGE("Cust. Ledger Entry No.",CustLedgEntry."Entry No.");
        DtldCustLedgEntry.SETFILTER("Entry Type",'<>%1',DtldCustLedgEntry."Entry Type"::"Initial Entry");
        DtldCustLedgEntry.SETRANGE(Unapplied,FALSE);
        IF NOT DtldCustLedgEntry.ISEMPTY THEN
          ERROR(ReversalErrorForChangedEntry(CustLedgEntry.TABLECAPTION,CustLedgEntry."Entry No."));

        DtldCustLedgEntry.RESET;
        DtldCustLedgEntry.SETCURRENTKEY("Transaction No.","Customer No.","Entry Type");
        DtldCustLedgEntry.SETRANGE("Transaction No.",CustLedgEntry."Transaction No.");
        DtldCustLedgEntry.SETRANGE("Customer No.",CustLedgEntry."Customer No.");
        DtldCustLedgEntry.SETFILTER("Entry Type",'%1|%2',
          DtldCustLedgEntry."Entry Type"::"Realized Gain",DtldCustLedgEntry."Entry Type"::"Realized Loss");
        IF NOT DtldCustLedgEntry.ISEMPTY THEN
          ERROR(Text013,CustLedgEntry.TABLECAPTION,CustLedgEntry."Entry No.");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
        DtldCustLedgEntry.SETRANGE(Unapplied);
        #12..15
        */
    //end;


    //Unsupported feature: Code Modification on "CheckDtldVendLedgEntry(PROCEDURE 28)".

    //procedure CheckDtldVendLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        DtldVendLedgEntry.SETCURRENTKEY("Vendor Ledger Entry No.","Entry Type");
        DtldVendLedgEntry.SETRANGE("Vendor Ledger Entry No.",VendLedgEntry."Entry No.");
        DtldVendLedgEntry.SETFILTER("Entry Type",'<>%1',DtldVendLedgEntry."Entry Type"::"Initial Entry");
        DtldVendLedgEntry.SETRANGE(Unapplied,FALSE);
        IF NOT DtldVendLedgEntry.ISEMPTY THEN
          ERROR(ReversalErrorForChangedEntry(VendLedgEntry.TABLECAPTION,VendLedgEntry."Entry No."));

        DtldVendLedgEntry.RESET;
        DtldVendLedgEntry.SETCURRENTKEY("Transaction No.","Vendor No.","Entry Type");
        DtldVendLedgEntry.SETRANGE("Transaction No.",VendLedgEntry."Transaction No.");
        DtldVendLedgEntry.SETRANGE("Vendor No.",VendLedgEntry."Vendor No.");
        DtldVendLedgEntry.SETFILTER("Entry Type",'%1|%2',
          DtldVendLedgEntry."Entry Type"::"Realized Gain",DtldVendLedgEntry."Entry Type"::"Realized Loss");
        IF NOT DtldVendLedgEntry.ISEMPTY THEN
          ERROR(Text013,VendLedgEntry.TABLECAPTION,VendLedgEntry."Entry No.");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
        DtldVendLedgEntry.SETRANGE(Unapplied);
        #12..15
        */
    //end;
}

