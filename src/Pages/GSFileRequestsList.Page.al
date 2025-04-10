Page 52194273 "GS File  Requests List"
{
    CardPageID = "File Requests";
    PageType = List;
    SourceTable = "File Requests1";
    SourceTableView = where("Send Status"=const(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(RequestNo;"Request No")
                {
                    ApplicationArea = Basic;
                }
                field(FileNo;"File No")
                {
                    ApplicationArea = Basic;
                }
                field(FileName;"File Name")
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
                field(User;User)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
          SetRange(User,UserId);
    end;
}

