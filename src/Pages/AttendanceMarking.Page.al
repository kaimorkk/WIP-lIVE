Page 52193940 "Attendance Marking"
{
    PageType = List;
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
                field(Attended;Attended)
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

