Page 52194068 "Emp Confidential Information"
{
    PageType = ListPart;
    SourceTable = "Confidential Information";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(ConfidentialCode;"Confidential Code")
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

