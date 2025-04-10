Page 52194409 "Supplier Types"
{
    PageType = List;
    SourceTable = "Supplier Types";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(SupplierType;"Supplier Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
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

