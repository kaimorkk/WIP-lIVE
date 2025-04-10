Page 52194182 "Recall List"
{
    CardPageID = "Leave Recall";
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
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(RecallDate;"Recall Date")
                {
                    ApplicationArea = Basic;
                }
                field(RecalledBy;"Recalled By")
                {
                    ApplicationArea = Basic;
                }
                field(ReasonforRecall;"Reason for Recall")
                {
                    ApplicationArea = Basic;
                }
                field(RecalledFrom;"Recalled From")
                {
                    ApplicationArea = Basic;
                }
                field(RecalledTo;"Recalled To")
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

