Page 52194276 "GS Resources/Keys Requests"
{
    CardPageID = "Resources Req. Header";
    PageType = List;
    SourceTable = "Resource Req. Header1";
    SourceTableView = where("Request Status"=filter(Open|"Pending Allocation"|Allocated));

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
                field(EmployeeCode;"Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(USER;USER)
                {
                    ApplicationArea = Basic;
                }
                field(RequestStatus;"Request Status")
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
                field(Returneddate;"Returned date")
                {
                    ApplicationArea = Basic;
                }
                field(IssuerID;"Issuer ID")
                {
                    ApplicationArea = Basic;
                }
                field(IssuerName;"Issuer Name")
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries;"No. Series")
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

    trigger OnOpenPage()
    begin
            SetRange(USER,UserId);
    end;
}

