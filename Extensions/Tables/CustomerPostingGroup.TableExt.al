TableExtension 52193457 tableextension52193457 extends "Customer Posting Group" 
{
    fields
    {

        //Unsupported feature: Deletion (FieldCollection) on ""Add. Fee per Line Account"(Field 19)".

        field(68000;"Shares Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(68001;"Insurance Cont Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(68002;"Registration Fees Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(68003;"Dividend Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(68004;"Withdrawal Fee";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(68005;"Investment Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(68006;"Un-allocated Funds Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(68007;"Member Deposits";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(68008;"Loans to Members";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(68009;"Interest Receivable Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(68010;"Interest Payable Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
    }
}

