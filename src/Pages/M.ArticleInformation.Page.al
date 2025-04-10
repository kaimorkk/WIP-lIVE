Page 52194066 "M. Article Information"
{
    PageType = ListPart;
    SourceTable = "Misc. Article Information";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(MiscArticleCode;"Misc. Article Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(FromDate;"From Date")
                {
                    ApplicationArea = Basic;
                }
                field(ToDate;"To Date")
                {
                    ApplicationArea = Basic;
                }
                field(InUse;"In Use")
                {
                    ApplicationArea = Basic;
                }
                field(SerialNo;"Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
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

