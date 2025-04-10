TableExtension 52193433 tableextension52193433 extends "Cust. Ledger Entry" 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Message to Recipient"(Field 289)".


        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 27)".

        field(68000;"Transaction Type";Option)
        {
            OptionCaption = ' ,Registration Fee,Deposit Contribution,Share Contribution,Loan,Loan Repayment,Withdrawal,Interest Due,Interest Paid,Investment,Dividend Paid,Processing Fee,Withholding Tax,BBF Contribution';
            OptionMembers = " ","Registration Fee","Deposit Contribution","Share Contribution",Loan,"Loan Repayment",Withdrawal,"Interest Due","Interest Paid",Investment,"Dividend Paid","Processing Fee","Withholding Tax","BBF Contribution";
        }
        field(68001;"Loan No";Code[20])
        {
        }
        field(68002;Remarks;Text[30])
        {
        }
        field(68003;"Pay Mode";Option)
        {
            OptionMembers = Cash,"Money Order","Banker's Cheque";
        }
        field(68004;"Cheque No";Code[30])
        {
        }
        field(68005;"Bank Name";Text[100])
        {
        }
        field(68006;"Branch Name";Text[100])
        {
        }
        field(68007;"Group Code";Code[20])
        {
        }
        field(68008;"Loan Product Type";Code[20])
        {
        }
        field(69014;"Sacco Transaction Type";Option)
        {
            OptionCaption = ',Contribution,Loan,Repayment,Other';
            OptionMembers = ,Contribution,Loan,Repayment,Other;
        }
    }
}

