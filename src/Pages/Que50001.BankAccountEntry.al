query 50000 "Bank Acc Ledger Per Dimension"
{
    QueryType = Normal;
    elements
    {
        dataitem(BankAccLedger; "Bank Account Ledger Entry")
        {
            column(Dimension_Set_ID; "Dimension Set ID")
            {
            }
            column(Amount__LCY_; "Amount (LCY)")
            {
                Method = Sum;
            }
            column(Bank_Account_No_; "Bank Account No.")
            {
            }
            filter(Reversed; Reversed)
            {
            }
            filter(Posting_Date; "Posting Date")
            {
            }
        }
    }
}