XmlPort 50006 "Invoice Header"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Invoice Header"; "Invoice Header")
            {
                XmlName = 'Batch';
                fieldelement(InvoiceNo; "Invoice Header"."Invoice No")
                {
                }
                fieldelement(VendorNo; "Invoice Header"."Vendor No")
                {
                }
                fieldelement(Description; "Invoice Header"."Posting Description")
                {
                }
                fieldelement(PostingDate; "Invoice Header"."Posting Date")
                {
                }
                fieldelement(DocumentDate; "Invoice Header"."Document Date")
                {
                }
                fieldelement(DimensionOne; "Invoice Header"."Global Dimension 1 Code")
                {
                }
                fieldelement(DimensionTwo; "Invoice Header"."Global Dimension 2 Code")
                {
                }
                fieldelement(DueDate; "Invoice Header"."Due Date")
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

