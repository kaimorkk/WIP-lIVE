report 59010 "Fleet Vehicles List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fleet Vehicles List.rdlc';

    dataset
    {
        dataitem("Fleet Vehicles."; "Fleet Vehicles.")
        {
            column(Description_FleetVehicles; "Fleet Vehicles.".Description)
            {
            }
            column(Type_FleetVehicles; "Fleet Vehicles.".Type)
            {
            }
            column(Make_FleetVehicles; "Fleet Vehicles.".Make)
            {
            }
            column(Model_FleetVehicles; "Fleet Vehicles.".Model)
            {
            }
            column(YearOfManufacture_FleetVehicles; "Fleet Vehicles."."Year Of Manufacture")
            {
            }
            column(CountryOfOrigin_FleetVehicles; "Fleet Vehicles."."Country Of Origin")
            {
            }
            column(StartReading_FleetVehicles; "Fleet Vehicles."."Start Reading")
            {
            }
            column(Ownership_FleetVehicles; "Fleet Vehicles.".Ownership)
            {
            }
            column(ChassisSerialNo_FleetVehicles; "Fleet Vehicles."."Chassis Serial No.")
            {
            }
            column(EngineSerialNo_FleetVehicles; "Fleet Vehicles."."Engine Serial No.")
            {
            }
            column(HorsePower_FleetVehicles; "Fleet Vehicles."."Horse Power")
            {
            }
            column(IgnitionKeyCode_FleetVehicles; "Fleet Vehicles."."Ignition Key Code")
            {
            }
            column(DoorKeyCode_FleetVehicles; "Fleet Vehicles."."Door Key Code")
            {
            }
            column(BodyColor_FleetVehicles; "Fleet Vehicles."."Body Color")
            {
            }
            column(InteriorColor_FleetVehicles; "Fleet Vehicles."."Interior Color")
            {
            }
            column(Cylinders_FleetVehicles; "Fleet Vehicles.".Cylinders)
            {
            }
            column(WheelSizeRear_FleetVehicles; "Fleet Vehicles."."Wheel Size Rear")
            {
            }
            column(WheelSizeFront_FleetVehicles; "Fleet Vehicles."."Wheel Size Front")
            {
            }
            column(TireSizeRear_FleetVehicles; "Fleet Vehicles."."Tire Size Rear")
            {
            }
            column(TireSizeFront_FleetVehicles; "Fleet Vehicles."."Tire Size Front")
            {
            }
            column(RegistrationNo_FleetVehicles; "Fleet Vehicles."."Registration No.")
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

