Page 52193826 "Visiting Stakeholders"
{
    PageType = ListPart;
    SourceTable = "Visiting StakeHolders1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(VisitNo;"Visit No")
                {
                    ApplicationArea = Basic;
                }
                field(StakeHolderNo;"StakeHolder No.")
                {
                    ApplicationArea = Basic;
                }
                field(StakeHolderName;"StakeHolder Name")
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

