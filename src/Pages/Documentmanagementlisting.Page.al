Page 52193793 "Document management listing"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = ListPart;
    SourceTable = "Document Management1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(File;File)
                {
                    ApplicationArea = Basic;
                }
                field(Volume;Volume)
                {
                    ApplicationArea = Basic;
                }
                field(FolioNo;"Folio No.")
                {
                    ApplicationArea = Basic;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(DateReceived;"Date Received")
                {
                    ApplicationArea = Basic;
                }
                field(TimeReceived;"Time Received")
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

