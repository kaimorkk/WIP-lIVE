Page 52193779 "Litigation Schedule"
{
    Editable = false;
    PageType = List;
    SourceTable = "Litigation Schedule1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Litigationschedulecode;"Litigation schedule code")
                {
                    ApplicationArea = Basic;
                }
                field(HearingDate;"Hearing Date")
                {
                    ApplicationArea = Basic;
                }
                field(LitigationCode;"Litigation Code")
                {
                    ApplicationArea = Basic;
                }
                field(Witness;Witness)
                {
                    ApplicationArea = Basic;
                }
                field(Time;Time)
                {
                    ApplicationArea = Basic;
                }
                field(Venue;Venue)
                {
                    ApplicationArea = Basic;
                }
                field(Details;Details)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
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

