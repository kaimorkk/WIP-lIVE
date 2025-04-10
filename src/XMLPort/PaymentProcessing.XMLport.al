XmlPort 50010 "Payment Processing"
{

    schema
    {
        textelement(Transactions)
        {
            tableelement("Transaction Schedule Income"; "Transaction Schedule Income")
            {
                XmlName = 'transactionschedulename';
                fieldelement(accounttype; "Transaction Schedule Income"."Account Type")
                {
                }
                fieldelement(accountno; "Transaction Schedule Income"."Account No")
                {
                }
                fieldelement(accountname; "Transaction Schedule Income"."Account Name")
                {
                }
                fieldelement(amount; "Transaction Schedule Income".Amount)
                {
                }
                fieldelement(loanno; "Transaction Schedule Income"."Loan No.")
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    "Transaction Schedule Income".No := BatchNo;
                    LineNo := LineNo + 10000;
                    "Transaction Schedule Income"."Line No." := LineNo;
                end;
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

    var
        ContributionHeader: Record Transactions;
        BatchNo: Code[20];
        LineNo: Integer;


    procedure GetRecHeader(var ContribHeader: Record Transactions)
    begin
        BatchNo := ContribHeader.No;
        ContributionHeader.Copy(ContribHeader);
    end;
}

