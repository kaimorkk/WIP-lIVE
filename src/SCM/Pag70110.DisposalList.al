page 70110 "Disposal List"
{
    CardPageID = "Disposal Header";
    Editable = false;
    PageType = List;
    SourceTable = "Disposal Header";
    SourceTableView = where(Status = filter("Pending Approval" | Open));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Title)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedDate; "Created Date")
                {
                    ApplicationArea = Basic;
                }
                field(DisposalPlan; "Disposal Plan")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
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

