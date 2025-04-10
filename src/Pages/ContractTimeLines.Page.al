Page 50105 "Contract Time Lines"
{
    PageType = ListPart;
    SourceTable = "Contracts Time line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(TimeLineDescription;"Time Line Description")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
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

