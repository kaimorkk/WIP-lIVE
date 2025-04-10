Page 52194244 "Vehicle Allocations"
{
    ApplicationArea = Basic;
    CardPageID = "Transport Request-Allocation";
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
                field(VehicleAllocated;"Vehicle Allocated")
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
        SetFilter("Trip Planned End Date",'>=%1',Today);
    end;
}

