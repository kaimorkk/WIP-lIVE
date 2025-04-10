Page 52194210 "Employment Contract"
{
    PageType = List;
    SourceTable = "Employment Contract";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(NoofContracts;"No. of Contracts")
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

