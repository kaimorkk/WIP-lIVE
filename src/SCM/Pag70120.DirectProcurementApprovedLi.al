Page 70120 "Direct Procurement Approved Li"
{
    Caption = 'Direct Procurement Approved List';
    CardPageID = "Direct Procurement Card";
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Request";
    SourceTableView = where("Process Type" = const(Direct),
                            Status = const(Released),
                            Closed = const(false));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Title)
                {
                    ApplicationArea = Basic;
                }
                field("Requisition No"; "Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan No"; "Procurement Plan No")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; "Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; "User ID")
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

