Page 52193827 "Employee Attendance"
{
    PageType = ListPart;
    SourceTable = "Employee Attendance1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(FullNames;"Full Names")
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

