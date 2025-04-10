Page 52193944 "Event Schedule"
{
    PageType = ListPart;
    SourceTable = "Event Schedule1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(VenueDate;"Venue Date")
                {
                    ApplicationArea = Basic;
                }
                field(VenueCode;"Venue Code")
                {
                    ApplicationArea = Basic;
                }
                field(TimingCode;"Timing Code")
                {
                    ApplicationArea = Basic;
                }
                field(EventCode;"Event Code")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Approved Agenda Meeting";
                }
                field(Venuedescription;"Venue description")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        Endate: Date;
}

