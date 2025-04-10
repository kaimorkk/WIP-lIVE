report 59011 "Vehicles Assignment Per Driver"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Vehicles Assignment Per Driver.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Vehicle Drivers"; "Vehicle Drivers")
        {
            column(Driver_VehicleDrivers; "Vehicle Drivers".Driver)
            {
            }
            column(DriverName_VehicleDrivers; "Vehicle Drivers"."Driver Name")
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
            column(DriverLicenseNumber_VehicleDrivers; "Vehicle Drivers"."Driver License Number")
            {
            }
            dataitem("Vehicle Driver Allocation"; "Vehicle Driver Allocation")
            {
                DataItemLink = "Driver Code" = field(Driver);
                column(RequisitionNumber_VehicleDriverAllocation; "Vehicle Driver Allocation"."Requisition Number")
                {
                }
                column(NumberofDays_VehicleDriverAllocation; "Vehicle Driver Allocation"."Number of Days")
                {
                }
                column(DateofTrip_VehicleDriverAllocation; "Vehicle Driver Allocation"."Date of Trip")
                {
                }
                column(TripEndDate_VehicleDriverAllocation; "Vehicle Driver Allocation"."Trip End Date")
                {
                }
                dataitem("Transport Requisition"; "Transport Requisition")
                {
                    DataItemLink = "Transport Requisition No" = field("Requisition Number");
                    column(VehicleAllocated_TransportRequisition; "Transport Requisition"."Vehicle Allocated")
                    {
                    }
                }
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

