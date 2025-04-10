Page 52193992 "Clearing Lines"
{
    PageType = ListPart;
    SourceTable = "Separation Lines1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(ItemDescription;"Item Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Cleared;Cleared)
                {
                    ApplicationArea = Basic;
                }
                field(ClearedDate;"Cleared Date")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode;"Department Code")
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

