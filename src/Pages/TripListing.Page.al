Page 52194143 "Trip Listing"
{
    ApplicationArea = Basic;
    CardPageID = "Transport Request HR";
    Editable = false;
    PageType = List;
    SourceTable = "Transport Request1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(RequestNo;"Request No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Destination;Destination)
                {
                    ApplicationArea = Basic;
                }
                field(TripPlannedStartDate;"Trip Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(TripPlannedEndDate;"Trip Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field(ReasonforTravel;"Reason for Travel")
                {
                    ApplicationArea = Basic;
                }
                field(DriverName;"Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field(CompanyVehicleAllocated;"Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                    Caption = 'Company Vehicle Allocated';
                }
                field(Taxi;Taxi)
                {
                    ApplicationArea = Basic;
                }
                field(NoofEmployees;"No. of Personnel")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Employees';
                }
                field(NoofNonEmployees;"No. of Non Employees")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
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
        ///filter for form
        //SETFILTER("Trip Planned End Date",'>=%1',TODAY);
    end;
}

