Page 52194136 "Travelling Employees"
{
    PageType = ListPart;
    SourceTable = "Travelling Employees1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(EmployeeNo;"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
            }
        }
    }

    actions
    {
    }
}

