Page 52193621 "PV Lines111"
{
    PageType = List;
    SourceTable = "PV Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Applyto;"Apply to")
                {
                    ApplicationArea = Basic;
                }
                field(PECode;"PE Code")
                {
                    ApplicationArea = Basic;
                }
                field(ExternalDocumentNo;"External Document No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(RemainingAmount;"Remaining Amount")
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

