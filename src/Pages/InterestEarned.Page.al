Page 52193575 "Interest Earned"
{
    PageType = List;
    SourceTable = "Interest Buffer";

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
                field(InterestDate;"Interest Date")
                {
                    ApplicationArea = Basic;
                }
                field(InterestAmount;"Interest Amount")
                {
                    ApplicationArea = Basic;
                }
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                }
                field(Transferred;Transferred)
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

