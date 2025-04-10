Page 50044 "Posted Stores Return"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Stores Return Header";
    SourceTableView = where("Requisition Type"=const("Stores Return"),
                            Posted=const(true));

    layout
    {
        area(content)
        {
            group("Stores Returns")
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
                field(GlobalDimension2Code;"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension3Code;"Global Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field(NoofApprovals;"No of Approvals")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000018;"Stores Return Lines")
            {
                SubPageLink = "Requisition No"=field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015;Notes)
            {
            }
            systempart(Control1000000016;MyNotes)
            {
            }
            systempart(Control1000000017;Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Requisition Type":="requisition type"::"Stores Return";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Requisition Type":="requisition type"::"Stores Return";
    end;
}

