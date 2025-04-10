Page 52194312 "Quote Evaluation List"
{
    CardPageID = "Levy Receipt Line List";
    Editable = false;
    PageType = List;
    SourceTable = "Quote Evaluation Header";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(QuoteNo;"Quote No")
                {
                    ApplicationArea = Basic;
                }
                field(Title;Title)
                {
                    ApplicationArea = Basic;
                }
                field(RequisitionNo;"Requisition No")
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

