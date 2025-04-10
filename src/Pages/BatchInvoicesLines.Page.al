Page 50069 "Batch Invoices Lines"
{
    PageType = ListPart;
    SourceTable = "Batch Invoice Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(InvoiceNo;"Invoice No")
                {
                    ApplicationArea = Basic;
                }
                field(SchemeNo;"Scheme No")
                {
                    ApplicationArea = Basic;
                }
                field(SchemeName;"Scheme Name")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(AutomaticallyPost;"Automatically Post")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

