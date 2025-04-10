Page 50043 "Posted Stores Return List"
{
    ApplicationArea = Basic;
    CardPageID = "Stores Return";
    Editable = false;
    PageType = List;
    SourceTable = "Stores Return Header";
    SourceTableView = where("Requisition Type"=const("Stores Return"),
                            Posted=const(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeCode;"Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(StoreRequisition;"Store Requisition")
                {
                    ApplicationArea = Basic;
                }
                field(ReturnDate;"Return Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Raisedby;"Raised by")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(User;User)
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code;"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension3Code;"Global Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field(NoofApprovals;"No of Approvals")
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

