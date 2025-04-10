report 59012 "Fleet Requisition Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fleet Requisition Report.rdlc';

    dataset
    {
        dataitem("Transport Requisition"; "Transport Requisition")
        {
            column(TransportRequisitionNo_TransportRequisition; "Transport Requisition"."Transport Requisition No")
            {
            }
            column(Commencement_TransportRequisition; "Transport Requisition".Commencement)
            {
            }
            column(Destination_TransportRequisition; "Transport Requisition".Destination)
            {
            }
            column(VehicleAllocated_TransportRequisition; "Transport Requisition"."Vehicle Allocated")
            {
            }
            column(DriverAllocated_TransportRequisition; "Transport Requisition"."Driver Allocated")
            {
            }
            column(RequestedBy_TransportRequisition; "Transport Requisition"."Requested By")
            {
            }
            column(DateofRequest_TransportRequisition; "Transport Requisition"."Date of Request")
            {
            }
            column(VehicleAllocatedby_TransportRequisition; "Transport Requisition"."Vehicle Allocated by")
            {
            }
            column(OpeningOdometerReading_TransportRequisition; "Transport Requisition"."Opening Odometer Reading")
            {
            }
            column(Status_TransportRequisition; "Transport Requisition".Status)
            {
            }
            column(DateofTrip_TransportRequisition; "Transport Requisition"."Date of Trip")
            {
            }
            column(PurposeofTrip_TransportRequisition; "Transport Requisition"."Purpose of Trip")
            {
            }
            column(NoSeries_TransportRequisition; "Transport Requisition"."No. Series")
            {
            }
            column(Comments_TransportRequisition; "Transport Requisition".Comments)
            {
            }
            column(Department_TransportRequisition; "Transport Requisition".Department)
            {
            }
            column(DriverName_TransportRequisition; "Transport Requisition"."Driver Name")
            {
            }
            column(ResponsibilityCenter_TransportRequisition; "Transport Requisition"."Responsibility Center")
            {
            }
            column(LoadedtoWorkTicket_TransportRequisition; "Transport Requisition"."Loaded to WorkTicket")
            {
            }
            column(Timeout_TransportRequisition; "Transport Requisition"."Time out")
            {
            }
            column(TimeIn_TransportRequisition; "Transport Requisition"."Time In")
            {
            }
            column(JourneyRoute_TransportRequisition; "Transport Requisition"."Journey Route")
            {
            }
            column(TimeRequested_TransportRequisition; "Transport Requisition"."Time Requested")
            {
            }
            column(ClosingOdometerReading_TransportRequisition; "Transport Requisition"."Closing Odometer Reading")
            {
            }
            column(WorkTicketNo_TransportRequisition; "Transport Requisition"."Work Ticket No")
            {
            }
            column(NoofDaysRequested_TransportRequisition; "Transport Requisition"."No of Days Requested")
            {
            }
            column(AuthorizedBy_TransportRequisition; "Transport Requisition"."Authorized  By")
            {
            }
            column(Position_TransportRequisition; "Transport Requisition".Position)
            {
            }
            column(UserId_TransportRequisition; "Transport Requisition"."User Id")
            {
            }
            column(AddedOn_TransportRequisition; "Transport Requisition"."Added On")
            {
            }
            column(HOD_TransportRequisition; "Transport Requisition".HOD)
            {
            }
            column(ExternalVehicleAlloc_TransportRequisition; "Transport Requisition"."Non KeRRA Vehicle Alloc.")
            {
            }
            column(DepartmentCode_TransportRequisition; "Transport Requisition"."Department Code")
            {
            }
            column(DirectorateCode_TransportRequisition; "Transport Requisition"."Directorate Code")
            {
            }
            column(Division_TransportRequisition; "Transport Requisition".Division)
            {
            }
            column(EmployeeNo_TransportRequisition; "Transport Requisition"."Employee No")
            {
            }
            column(DateClosed_TransportRequisition; "Transport Requisition"."Date Closed")
            {
            }
            column(ClosedBy_TransportRequisition; "Transport Requisition"."Closed By")
            {
            }
            column(CI_Picture; CI.Picture)
            {
            }
            column(CI_Address; CI.Address)
            {
            }
            column(CI__Address_2______CI__Post_Code_; CI."Address 2" + ' ' + CI."Post Code")
            {
            }
            column(CI_City; CI.City)
            {
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CI.Get;
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
}

