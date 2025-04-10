TableExtension 52193558 tableextension52193558 extends "Detailed CV Ledg. Entry Buffer" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""Entry No."(Field 1)".


        //Unsupported feature: Property Deletion (DataClassification) on ""CV Ledger Entry No."(Field 2)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Entry Type"(Field 3)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Posting Date"(Field 4)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Document Type"(Field 5)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Document No."(Field 6)".


        //Unsupported feature: Property Deletion (DataClassification) on "Amount(Field 7)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Amount (LCY)"(Field 8)".


        //Unsupported feature: Property Deletion (DataClassification) on ""CV No."(Field 9)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Currency Code"(Field 10)".


        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 11)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Source Code"(Field 12)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Transaction No."(Field 13)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Journal Batch Name"(Field 14)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Reason Code"(Field 15)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Debit Amount"(Field 16)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Credit Amount"(Field 17)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Debit Amount (LCY)"(Field 18)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Credit Amount (LCY)"(Field 19)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Initial Entry Due Date"(Field 20)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Initial Entry Global Dim. 1"(Field 21)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Initial Entry Global Dim. 2"(Field 22)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Gen. Posting Type"(Field 23)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Gen. Bus. Posting Group"(Field 24)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Gen. Prod. Posting Group"(Field 25)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Tax Area Code"(Field 26)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Tax Liable"(Field 27)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Tax Group Code"(Field 28)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Use Tax"(Field 29)".


        //Unsupported feature: Property Deletion (DataClassification) on ""VAT Bus. Posting Group"(Field 30)".


        //Unsupported feature: Property Deletion (DataClassification) on ""VAT Prod. Posting Group"(Field 31)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Additional-Currency Amount"(Field 32)".


        //Unsupported feature: Property Deletion (DataClassification) on ""VAT Amount (LCY)"(Field 33)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Use Additional-Currency Amount"(Field 34)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Initial Document Type"(Field 35)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Applied CV Ledger Entry No."(Field 36)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Remaining Pmt. Disc. Possible"(Field 39)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Max. Payment Tolerance"(Field 40)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Tax Jurisdiction Code"(Field 41)".

        field(68000;"Transaction Type";Option)
        {
            OptionCaption = ' ,Registration Fee,Loan Repayment,Withdrawal,Interest Due,Interest Paid,BBF Contribution,Share Contribution,Investment,Deposit Contribution';
            OptionMembers = " ","Registration Fee","Loan Repayment",Withdrawal,"Interest Due","Interest Paid","BBF Contribution","Share Contribution",Investment,"Deposit Contribution";
        }
        field(68001;"Loan No";Code[20])
        {
        }
        field(68002;"Group Code";Code[20])
        {
        }
        field(68003;Type;Option)
        {
            OptionCaption = ' ,Registration,PassBook,Loan Insurance,Loan Application Fee,Down Payment';
            OptionMembers = " ",Registration,PassBook,"Loan Insurance","Loan Application Fee","Down Payment";
        }
        field(68004;"Member Name";Text[30])
        {
        }
        field(68005;"Loan Product Type";Code[20])
        {
        }
        field(69014;"Sacco Transaction Type";Option)
        {
            OptionCaption = ',Contribution,Loan,Repayment,Other';
            OptionMembers = ,Contribution,Loan,Repayment,Other;
        }
    }
    keys
    {

        //Unsupported feature: Property Insertion (KeyGroups) on ""CV No.","Initial Entry Due Date","Posting Date","Initial Entry Global Dim. 1","Initial Entry Global Dim. 2","Currency Code"(Key)".


        //Unsupported feature: Property Insertion (KeyGroups) on ""CV No.","Posting Date","Entry Type","Initial Entry Global Dim. 1","Initial Entry Global Dim. 2","Currency Code"(Key)".


        //Unsupported feature: Property Insertion (KeyGroups) on ""CV No.","Initial Document Type","Document Type","Initial Entry Global Dim. 1","Initial Entry Global Dim. 2"(Key)".


        //Unsupported feature: Property Insertion (KeyGroups) on ""Initial Document Type","CV No.","Posting Date","Currency Code","Entry Type","Initial Entry Global Dim. 1","Initial Entry Global Dim. 2"(Key)".

    }


    //Unsupported feature: Code Modification on "InsertDtldCVLedgEntry(PROCEDURE 53)".

    //procedure InsertDtldCVLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF (DtldCVLedgEntryBuf.Amount = 0) AND
           (DtldCVLedgEntryBuf."Amount (LCY)" = 0) AND
           (DtldCVLedgEntryBuf."VAT Amount (LCY)" = 0) AND
           (DtldCVLedgEntryBuf."Additional-Currency Amount" = 0) AND
           (NOT InsertZeroAmout)
        THEN
        #7..68
          CVLedgEntryBuf."Original Amt. (LCY)" := NewDtldCVLedgEntryBuf."Amount (LCY)";
        END;
        DtldCVLedgEntryBuf.RESET;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF (DtldCVLedgEntryBuf.Amount = 0) AND
           (DtldCVLedgEntryBuf."Amount (LCY)" = 0) AND
        #4..71
        */
    //end;
}

