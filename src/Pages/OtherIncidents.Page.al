Page 52194104 "Other Incidents"
{
    PageType = ListPart;
    SourceTable = "Other Incidents1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(IncidentDate;"Incident Date")
                {
                    ApplicationArea = Basic;
                }
                field(Incident;Incident)
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
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

