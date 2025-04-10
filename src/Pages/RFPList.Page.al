Page 52194249 "RFP List"
{
    ApplicationArea = Basic;
    CardPageID = RFP;
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Request1";
    SourceTableView = where("Process Type"=const(RFP));
    UsageCategory = Lists;

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
                field(ReturnDate;"Return Date")
                {
                    ApplicationArea = Basic;
                }
                field(ReturnTime;"Return Time")
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

