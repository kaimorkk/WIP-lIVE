Page 52194405 "Required Documents"
{
    PageType = List;
    SourceTable = "Required Documents";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(RecruitmentReqNo;"Recruitment Req. No")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDescription;"Document Description")
                {
                    ApplicationArea = Basic;
                }
                field(Attached;Attached)
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

