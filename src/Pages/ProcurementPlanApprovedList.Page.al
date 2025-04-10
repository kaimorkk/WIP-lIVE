Page 52194248 "Procurement Plan Approved List"
{
    CardPageID = "Quotation Archived";
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Request1";
    SourceTableView = where("Process Type"=const(RFQ),
                            Status=const(Archived));

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
                field(Title;Title)
                {
                    ApplicationArea = Basic;
                }
                field(RequisitionNo;"Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementPlanNo;"Procurement Plan No")
                {
                    ApplicationArea = Basic;
                }
                field(CreationDate;"Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementMethod;"Procurement Method")
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

