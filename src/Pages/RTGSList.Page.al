Page 52193729 "RTGS List"
{
    PageType = List;
    SourceTable = "RTGS Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field(StatementNo;"Statement No.")
                {
                    ApplicationArea = Basic;
                }
                field(Cashier;Cashier)
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount;"Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Dateposted;"Date posted")
                {
                    ApplicationArea = Basic;
                }
                field(TimePosted;"Time Posted")
                {
                    ApplicationArea = Basic;
                }
                field(PostedBy;"Posted By")
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

