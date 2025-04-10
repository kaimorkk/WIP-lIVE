XmlPort 50007 "Invoice Lines"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Invoice Line"; "Invoice Line")
            {
                XmlName = 'Lines';
                fieldelement(InvoiceNo; "Invoice Line"."Invoice No")
                {
                }
                fieldelement(LineNo; "Invoice Line"."Line No")
                {
                }
                fieldelement(Type; "Invoice Line".Type)
                {
                }
                fieldelement(No; "Invoice Line"."Account No")
                {
                }
                fieldelement(Quantity; "Invoice Line".Quantity)
                {
                }
                fieldelement(UnitPrice; "Invoice Line"."Unit Price")
                {
                }
                fieldelement(Amount; "Invoice Line".Amount)
                {
                }
                fieldelement(Status; "Invoice Line".Description)
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

