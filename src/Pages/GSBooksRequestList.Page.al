Page 52194266 "GS Books Request List"
{
    CardPageID = "Books Request";
    PageType = List;
    SourceTable = "Book Issue1";
    SourceTableView = where(Requested=const(false));

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field(Requested;Requested)
                {
                    ApplicationArea = Basic;
                }
                field(SystemSupportEmailAddress;"System Support Email Address")
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries;"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(User;User)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
         SetRange(User,UserId);
    end;
}

