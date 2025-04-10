Page 52193774 "Document Types"
{
    CardPageID = "Document Types form";
    Editable = false;
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
                field(DocumentName;"Document Name")
                {
                    ApplicationArea = Basic;
                }
                field(Book;Book)
                {
                    ApplicationArea = Basic;
                    Caption = 'Library?';
                }
                field(DuePerioddays;"DuePeriod (days)")
                {
                    ApplicationArea = Basic;
                }
                field(Rates;Rates)
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

