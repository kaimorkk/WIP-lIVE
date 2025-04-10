XmlPort 50015 "Import Payments"
{
    Format = Xml;

    schema
    {
        textelement(Root)
        {
            tableelement("Transaction Schedule Income"; "Transaction Schedule Income")
            {
                XmlName = 'Transactionscheduleincome';
                fieldelement(accounttype; "Transaction Schedule Income"."Account Type")
                {
                }
                fieldelement(accountno; "Transaction Schedule Income"."Account No")
                {
                }
                fieldelement(amount; "Transaction Schedule Income".Amount)
                {
                }
                fieldelement(loanno; "Transaction Schedule Income"."Loan No.")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }
}

