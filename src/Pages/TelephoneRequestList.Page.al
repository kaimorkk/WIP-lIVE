Page 52194184 "Telephone Request List"
{
    ApplicationArea = Basic;
    CardPageID = "Telephone Request HR";
    PageType = List;
    SourceTable = "Telephone Request1";
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
                field(RequestDate;"Request Date")
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
                field(NoSeries;"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(ContactNo;"Contact No")
                {
                    ApplicationArea = Basic;
                }
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                }
                field(NoofApproval;"No of Approval")
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

