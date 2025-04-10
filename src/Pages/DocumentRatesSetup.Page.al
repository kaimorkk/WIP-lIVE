Page 52193839 "Document Rates Setup"
{
    PageType = List;
    SourceTable = "Document Types1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(DocumentCode;"Document Code")
                {
                    ApplicationArea = Basic;
                }
                field(Book;Book)
                {
                    ApplicationArea = Basic;
                }
                field(DuePerioddays;"DuePeriod (days)")
                {
                    ApplicationArea = Basic;
                }
                field(Rates;Rates)
                {
                    ApplicationArea = Basic;
                }
                field(DocumentName;"Document Name")
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

