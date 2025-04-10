Page 52194265 "GS Transport Request List"
{
    CardPageID = "Transport Request";
    PageType = List;
    SourceTable = "Transport Request1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(RequestNo;"Request No.")
                {
                    ApplicationArea = Basic;
                }
                field(RequestDate;"Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(RequestID;"Request ID")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
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
                field(Destination;Destination)
                {
                    ApplicationArea = Basic;
                }
                field(GeographicalTerrain;"Geographical Terrain")
                {
                    ApplicationArea = Basic;
                }
                field(NoofPersonnel;"No. of Personnel")
                {
                    ApplicationArea = Basic;
                }
                field(PredictedWeatherConditions;"Predicted Weather Conditions")
                {
                    ApplicationArea = Basic;
                }
                field(VehicleAllocated;"Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                }
                field(OutsourcedVehicleRegNo;"Outsourced Vehicle Reg No.")
                {
                    ApplicationArea = Basic;
                }
                field(VehicleOwner;"Vehicle Owner")
                {
                    ApplicationArea = Basic;
                }
                field(OdometerReadingBefore;"Odometer Reading Before")
                {
                    ApplicationArea = Basic;
                }
                field(OdometerReadingAfter;"Odometer Reading After")
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries;"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Country;Country)
                {
                    ApplicationArea = Basic;
                }
                field(TownCity;"Town/City")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(NoofApprovals;"No. of Approvals")
                {
                    ApplicationArea = Basic;
                }
                field(ReasonforTravel;"Reason for Travel")
                {
                    ApplicationArea = Basic;
                }
                field(StartDate;"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(ReturnDate;"Return Date")
                {
                    ApplicationArea = Basic;
                }
                field(StartTime;"Start Time")
                {
                    ApplicationArea = Basic;
                }
                field(ReturnTime;"Return Time")
                {
                    ApplicationArea = Basic;
                }
                field(VehicleDescription;"Vehicle Description")
                {
                    ApplicationArea = Basic;
                }
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                }
                field(TravelDetails;"Travel Details")
                {
                    ApplicationArea = Basic;
                }
                field(Driver;Driver)
                {
                    ApplicationArea = Basic;
                }
                field(DriverName;"Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field(Taxi;Taxi)
                {
                    ApplicationArea = Basic;
                }
                field(Cancelled;Cancelled)
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
        SetRange("Request ID",UserId);
    end;
}

