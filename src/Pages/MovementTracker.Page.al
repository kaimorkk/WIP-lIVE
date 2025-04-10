Page 52193525 "Movement Tracker"
{
    PageType = List;
    SourceTable = "Movement Tracker";
    SourceTableView = sorting("Document No.","Approval Type","Entry No.",Stage);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Stage;Stage)
                {
                    ApplicationArea = Basic;
                }
                field(Station;Station)
                {
                    ApplicationArea = Basic;
                }
                field(CurrentLocation;"Current Location")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(DateTimeIn;"Date/Time In")
                {
                    ApplicationArea = Basic;
                }
                field(DateTimeOut;"Date/Time Out")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(UserId;"USER ID")
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

