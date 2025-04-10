Page 52194397 "Contract Renewal Clause"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Contract Renewal Clause";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(RenewalCode;"Renewal Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Duration;Duration)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000006;Notes)
            {
            }
            systempart(Control1000000007;MyNotes)
            {
            }
            systempart(Control1000000008;Links)
            {
            }
        }
    }

    actions
    {
    }
}

