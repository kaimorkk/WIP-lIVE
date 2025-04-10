Page 52193812 "Approved Agenda Meeting"
{
    PageType = Card;
    SourceTable = Campaign;
    SourceTableView = where("Meeting Type"=const(" "));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000006;"Board Committees")
            {
                SubPageLink = "Meeting Code"=field("No.");
            }
        }
    }

    actions
    {
    }
}

