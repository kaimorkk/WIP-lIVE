Page 52194092 "Off/Holiday Worked"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Employee Off/Holidays1";

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
                field(RecallDate;"Recall Date")
                {
                    ApplicationArea = Basic;
                }
                field(ReasonforRecall;"Reason for Recall")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(NoofOffDays;"No. of Off Days")
                {
                    ApplicationArea = Basic;
                }
                field(Approved;Approved)
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

