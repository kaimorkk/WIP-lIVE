Page 52193815 "HOD Attendance Listings"
{
    PageType = ListPart;
    SourceTable = "Attendance Listing1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(FullNames;"Full Names")
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

