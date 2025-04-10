Page 52194230 "Resource Issue List"
{
    ApplicationArea = Basic;
    CardPageID = "Resources Issue. Header";
    PageType = List;
    SourceTable = "Resource Req. Header1";
    UsageCategory = Lists;

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
}

