Page 52193822 "Employee Attendees"
{
    PageType = ListPart;
    SourceTable = "Empoyee Attendees1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(SegmentNo;"Segment No")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(EmployeeNo;"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(Employeename;"Employee name")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeEMail;"Employee E-Mail")
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

