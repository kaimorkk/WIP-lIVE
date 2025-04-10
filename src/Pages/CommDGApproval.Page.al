Page 52193823 "Comm D/G Approval"
{
    PageType = Card;
    SourceTable = "Segment Header";
    SourceTableView = where(Status=filter(Canceled));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(InitiatedBy;"Initiated By")
                {
                    ApplicationArea = Basic;
                }
                field(CampaignDescription;"Campaign Description")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                    Caption = 'Start Date';
                }
                field(EndDate;"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(StartTime;"Start Time")
                {
                    ApplicationArea = Basic;
                }
                field(EndTime;"End Time")
                {
                    ApplicationArea = Basic;
                }
                field(VenueCide;"Venue Cide")
                {
                    ApplicationArea = Basic;
                }
                field(Venue;Venue)
                {
                    ApplicationArea = Basic;
                }
                field(EventStatus;"Event Status")
                {
                    ApplicationArea = Basic;
                }
                field(Completed;Completed)
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

