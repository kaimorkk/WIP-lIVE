Page 52193776 "Document Management List"
{
    CardPageID = "Document Management";
    PageType = List;
    SourceTable = "Document Management1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(FolioNo;"Folio No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Category;Category)
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
                field(File;File)
                {
                    ApplicationArea = Basic;
                }
                field(Volume;Volume)
                {
                    ApplicationArea = Basic;
                }
                field(AvailableInRegistry;"Available In Registry?")
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

