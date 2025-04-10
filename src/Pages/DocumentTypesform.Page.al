Page 52193777 "Document Types form"
{
    PageType = Card;
    SourceTable = "Document Types1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(DocumentCode;"Document Code")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentName;"Document Name")
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
                field(Book;Book)
                {
                    ApplicationArea = Basic;
                    Caption = 'Library';
                }
            }
        }
    }

    actions
    {
    }
}

