Page 52193768 "Book request list"
{
    CardPageID = "Received Books Request";
    Editable = false;
    PageType = List;
    SourceTable = "Book Issue1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(RequestNo;"Request No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(RequestDate;"Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(IssueDate;"Issue Date")
                {
                    ApplicationArea = Basic;
                }
                field(DueDate;"Due Date")
                {
                    ApplicationArea = Basic;
                }
                field(IssuerNo;"Issuer No.")
                {
                    ApplicationArea = Basic;
                }
                field(IssuerName;"Issuer Name.")
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

