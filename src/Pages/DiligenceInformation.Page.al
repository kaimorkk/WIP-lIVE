Page 52194415 "Diligence Information"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Diligence Infomation";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(RequiredInformation;"Required Information")
                {
                    ApplicationArea = Basic;
                }
                field(PointDistribution;"Point Distribution")
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

