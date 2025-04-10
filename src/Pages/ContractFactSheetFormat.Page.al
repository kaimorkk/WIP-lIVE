Page 52194258 "Contract Fact Sheet Format"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "3rd Party Contract Obligations";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

