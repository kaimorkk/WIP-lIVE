page 70116 "Disposal List-Approved"
{
    CardPageID = "Disposal Header";
    PageType = List;
    SourceTable = "Disposal Header";
    SourceTableView = where(Status = const(Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Title)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(ReasonForDisposal; "Reason For Disposal")
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

