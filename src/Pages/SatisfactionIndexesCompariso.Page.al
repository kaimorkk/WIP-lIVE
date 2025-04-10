Page 52193853 "Satisfaction Indexes Compariso"
{
    PageType = ListPart;
    SourceTable = "SI Comparison1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Consumers;Consumers)
                {
                    ApplicationArea = Basic;
                }
                field(GeneralSI;"General SI")
                {
                    ApplicationArea = Basic;
                }
                field(CoreFunctionSI;"Core Function SI")
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

