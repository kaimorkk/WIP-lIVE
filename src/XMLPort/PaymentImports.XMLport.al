XmlPort 50009 "Payment Imports"
{
    Format = VariableText;

    schema
    {
        textelement(Transactions)
        {
            tableelement("Payment Lines"; "Payment Lines")
            {
                XmlName = 'paymentlines';
                fieldelement(paymenttype; "Payment Lines"."Payment Type")
                {
                }
                fieldelement(accounttype; "Payment Lines"."Account Type")
                {
                }
                fieldelement(accountno; "Payment Lines"."Account No")
                {
                }
                fieldelement(name; "Payment Lines".Name)
                {
                }
                fieldelement(transactiontype; "Payment Lines"."Transaction Type")
                {
                }
                fieldelement(amount; "Payment Lines".Amount)
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    "Payment Lines".No := BatchNo;
                    LineNo := LineNo + 10000;
                    "Payment Lines"."Line No" := LineNo;
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
        BatchNo: Code[20];
        PaymentHeader: Record Payments1;
        LineNo: Integer;


    procedure GetRecHeader(var PayHeader: Record Payments1)
    begin
        BatchNo := PayHeader.No;
        PaymentHeader.Copy(PayHeader);
    end;
}

