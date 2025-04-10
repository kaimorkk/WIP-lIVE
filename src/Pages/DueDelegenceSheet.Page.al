Page 52194416 "Due Delegence Sheet"
{
    PageType = List;
    SourceTable = "Due Delegence Sheet";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(RequiredInfomation;"Required Infomation")
                {
                    ApplicationArea = Basic;
                }
                field(PointDistribution;"Point Distribution")
                {
                    ApplicationArea = Basic;
                }
                field(PointsAwarded;"Points Awarded")
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

