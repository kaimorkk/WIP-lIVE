Page 52193922 Attendance
{
    PageType = ListPart;
    SourceTable = "Commisioner Attendance1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(CommissionerCode;"Commissioner Code")
                {
                    ApplicationArea = Basic;
                }
                field(CommissionersName;"Commissioners Name")
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

