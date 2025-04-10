Page 52193835 "Litigation Schedules"
{
    PageType = Card;
    SourceTable = "Litigation Schedule1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Litigationschedulecode;"Litigation schedule code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(LitigationCode;"Litigation Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(HearingDate;"Hearing Date")
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
                field(Witness;Witness)
                {
                    ApplicationArea = Basic;
                }
                field(Details;Details)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(OneMonthNotice;"One Month Notice")
                {
                    ApplicationArea = Basic;
                }
                field(TwoWeeksNotice;"Tow Weeks Notice")
                {
                    ApplicationArea = Basic;
                    Caption = 'Two Weeks Notice';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Litigation)
            {
                Caption = 'Litigation';
                action(AdditionalInformation)
                {
                    ApplicationArea = Basic;
                    Caption = 'Additional Information';
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name"=const(14),
                                  "No."=field("Litigation schedule code");
                }
            }
        }
    }
}

