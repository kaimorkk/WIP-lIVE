Page 52193470 "Group Imprest Lines"
{
    PageType = ListPart;
    SourceTable = "Group Imprest Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EmployeeNo; "Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(CustomerNo; "Customer No")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(AmountRequested; "Amount Requested")
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

