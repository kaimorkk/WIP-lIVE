XmlPort 50008 "Monthly Contributions"
{
    Format = VariableText;

    schema
    {
        textelement(Contrributions)
        {
            tableelement("Receipts Lines"; "Receipts Lines")
            {
                XmlName = 'receiptslines';
                fieldelement(AccountType; "Receipts Lines"."Account Type")
                {
                }
                fieldelement(AccountNo; "Receipts Lines"."Account No.")
                {
                }
                fieldelement(AccountName; "Receipts Lines"."Account Name")
                {
                }
                fieldelement(TransactionType; "Receipts Lines".Type)
                {
                }
                fieldelement(TransactionCode; "Receipts Lines"."Transaction Code")
                {
                }
                fieldelement(Amount; "Receipts Lines".Amount)
                {
                }
                fieldelement(Description; "Receipts Lines".Description)
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    "Receipts Lines".No := BatchNo;
                    LineNo := LineNo + 10000;
                    "Receipts Lines"."Line No." := LineNo;
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
        ContributionHeader: Record Receipts;
        LineNo: Integer;


    procedure GetRecHeader(var ContribHeader: Record Receipts)
    begin
        BatchNo := ContribHeader.No;
        ContributionHeader.Copy(ContribHeader);
    end;
}

