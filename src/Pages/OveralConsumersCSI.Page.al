Page 52193852 "Overal Consumers CSI"
{
    PageType = ListPart;
    SourceTable = "Overall Consumer CSI1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Section;Section)
                {
                    ApplicationArea = Basic;
                }
                field(SatisfactionIndex;"Satisfaction Index")
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

