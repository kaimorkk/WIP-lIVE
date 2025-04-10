TableExtension 52193554 tableextension52193554 extends "Detailed Cust. Ledg. Entry" 
{
    Caption = 'Detailed Cust. Ledg. Entry';
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Cust. Ledger Entry No.")
        {
            Caption = 'Cust. Ledger Entry No.';
        }
        modify("Entry Type")
        {
            Caption = 'Entry Type';
            OptionCaption = ',Initial Entry,Application,Unrealized Loss,Unrealized Gain,Realized Loss,Realized Gain,Payment Discount,Payment Discount (VAT Excl.),Payment Discount (VAT Adjustment),Appln. Rounding,Correction of Remaining Amount,Payment Tolerance,Payment Discount Tolerance,Payment Tolerance (VAT Excl.),Payment Tolerance (VAT Adjustment),Payment Discount Tolerance (VAT Excl.),Payment Discount Tolerance (VAT Adjustment)';
        }
        modify("Posting Date")
        {
            Caption = 'Posting Date';
        }
        modify("Document Type")
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Amount)
        {
            Caption = 'Amount';
        }
        modify("Amount (LCY)")
        {
            Caption = 'Amount ($)';
        }
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
        modify("Currency Code")
        {
            Caption = 'Currency Code';
        }
        modify("User ID")
        {
            Caption = 'User ID';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Transaction No.")
        {
            Caption = 'Transaction No.';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Debit Amount")
        {
            Caption = 'Debit Amount';
        }
        modify("Credit Amount")
        {
            Caption = 'Credit Amount';
        }
        modify("Debit Amount (LCY)")
        {
            Caption = 'Debit Amount ($)';
        }
        modify("Credit Amount (LCY)")
        {
            Caption = 'Credit Amount ($)';
        }
        modify("Initial Entry Due Date")
        {
            Caption = 'Initial Entry Due Date';
        }
        modify("Initial Entry Global Dim. 1")
        {
            Caption = 'Initial Entry Global Dim. 1';
        }
        modify("Initial Entry Global Dim. 2")
        {
            Caption = 'Initial Entry Global Dim. 2';
        }
        modify("Gen. Bus. Posting Group")
        {
            Caption = 'Gen. Bus. Posting Group';
        }
        modify("Gen. Prod. Posting Group")
        {
            Caption = 'Gen. Prod. Posting Group';
        }
        modify("Use Tax")
        {
            Caption = 'Use Tax';
        }
        modify("VAT Bus. Posting Group")
        {
            Caption = 'Tax Bus. Posting Group';
        }
        modify("VAT Prod. Posting Group")
        {
            Caption = 'Tax Prod. Posting Group';
        }
        modify("Initial Document Type")
        {
            Caption = 'Initial Document Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
        }
        modify("Applied Cust. Ledger Entry No.")
        {
            Caption = 'Applied Cust. Ledger Entry No.';
        }
        modify(Unapplied)
        {
            Caption = 'Unapplied';
        }
        modify("Unapplied by Entry No.")
        {
            Caption = 'Unapplied by Entry No.';
        }
        modify("Remaining Pmt. Disc. Possible")
        {
            Caption = 'Remaining Pmt. Disc. Possible';
        }
        modify("Max. Payment Tolerance")
        {
            Caption = 'Max. Payment Tolerance';
        }
        modify("Tax Jurisdiction Code")
        {
            Caption = 'Tax Jurisdiction Code';
        }
        modify("Application No.")
        {
            Caption = 'Application No.';
        }
        modify("Ledger Entry Amount")
        {
            Caption = 'Ledger Entry Amount';
        }

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 11)".

        field(68000;"Transaction Type";Option)
        {
            OptionCaption = ' ,Registration Fee,Deposit Contribution,Share Contribution,Loan,Loan Repayment,Withdrawal,Interest Due,Interest Paid,Investment,Dividend Paid,Processing Fee,Withholding Tax,BBF Contribution';
            OptionMembers = " ","Registration Fee","Deposit Contribution","Share Contribution",Loan,"Loan Repayment",Withdrawal,"Interest Due","Interest Paid",Investment,"Dividend Paid","Processing Fee","Withholding Tax","BBF Contribution";
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
}

