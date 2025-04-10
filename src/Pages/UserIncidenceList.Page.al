Page 52193830 "User Incidence List"
{
    CardPageID = "User Incidences Card";
    PageType = List;
    SourceTable = "User Support Incidences1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(IncidentReference;"Incident Reference")
                {
                    ApplicationArea = Basic;
                }
                field(IncidentDescription;"Incident Description")
                {
                    ApplicationArea = Basic;
                }
                field(IncidentDate;"Incident Date")
                {
                    ApplicationArea = Basic;
                }
                field(IncidentStatus;"Incident Status")
                {
                    ApplicationArea = Basic;
                }
                field(Actiontaken;"Action taken")
                {
                    ApplicationArea = Basic;
                }
                field(ActionDate;"Action Date")
                {
                    ApplicationArea = Basic;
                }
                field(User;User)
                {
                    ApplicationArea = Basic;
                }
                field(SystemSupportEmailAddress;"System Support Email Address")
                {
                    ApplicationArea = Basic;
                }
                field(UseremailAddress;"User email Address")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(FileNo;"File No")
                {
                    ApplicationArea = Basic;
                }
                field(IncidentTime;"Incident Time")
                {
                    ApplicationArea = Basic;
                }
                field(ActionTime;"Action Time")
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
                field(Sent;Sent)
                {
                    ApplicationArea = Basic;
                }
                field(UserInformed;"User Informed?")
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

