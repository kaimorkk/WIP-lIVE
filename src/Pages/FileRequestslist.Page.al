Page 52193761 "File Requests list"
{
    CardPageID = "File Requests";
    Editable = false;
    PageType = List;
    SourceTable = "File Requests1";
    SourceTableView = sorting(Date);

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(RequestNo;"Request No")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(Time;Time)
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
                field(SendStatus;"Send Status")
                {
                    ApplicationArea = Basic;
                }
                field(SystemSupportEmailAddress;"System Support Email Address")
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

