Page 52194399 "Performance Indicators"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Performance Indicators";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(PICode;"PI Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(DesiredScore;"Desired Score")
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

