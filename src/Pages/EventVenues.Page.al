Page 52193943 "Event Venues"
{
    PageType = List;
    SourceTable = "Event Venues1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(VenueCode;"Venue Code")
                {
                    ApplicationArea = Basic;
                }
                field(VenueDescription;"Venue Description")
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

