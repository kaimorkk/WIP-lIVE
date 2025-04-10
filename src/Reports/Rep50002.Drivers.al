namespace ALProjectLIWPA.ALProjectLIWPA;
using Microsoft.Foundation.Company;


report 50002 "Drivers"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Drivers.rdl';

    dataset
    {
        dataitem(VehicleDrivers; "Vehicle Drivers")
        {
            column(CompanyName; CompanyInformation.Name)
            {
            }
            column(CompanyPicture; CompanyInformation.Picture)
            {
            }
            column(CompanyAddress; CompanyInformation.Address)
            {
            }
            column(CompanyPhone; CompanyInformation."Phone No.")
            {
            }
            column(CompanyLocation; CompanyInformation."Location Code")
            {
            }
            column(CompanyEmail; CompanyInformation."E-Mail")
            {
            }
            column(CompanyWebsite; CompanyInformation."Home Page")
            {
            }
            column(CompanyPostCode; CompanyInformation."Post Code")
            {
            }
            column(No; VehicleDrivers.Driver)
            {

            }
            column(Name; VehicleDrivers."Driver Name")
            {

            }
            column(DutyStationName; VehicleDrivers."Duty Station Name")
            {

            }
            column(TypeOfDriver; VehicleDrivers."Type Of Driver")
            {

            }
            column(DriverLicenseNumber; VehicleDrivers."Driver License Number")
            {

            }
            column(PhoneNumber; VehicleDrivers."Phone Number")
            {

            }
            column(LastLicenseRenewal; VehicleDrivers."Last License Renewal")
            {

            }
            column(NextLicenseRenewal; VehicleDrivers."Next License Renewal")
            {

            }
            column(Licence_Type; License)
            {

            }
            trigger OnPreDataItem()
            begin
                CompanyInformation.get;
                CompanyInformation.CalcFields(Picture);
            end;

            trigger OnAfterGetRecord()
            var
                DriverLines: Record "Vehicle Drivers Line";
            begin
                License := '';
                DriverLines.Reset();
                DriverLines.SetRange("driver Code", VehicleDrivers.Driver);
                if DriverLines.FindSet then begin
                    License := '';
                    repeat
                        License += DriverLines."Licence Type" + ' ,  ';
                    until DriverLines.Next = 0;
                    if License <> '' then
                        License := DelStr(License, StrLen(License) - 1, 1);
                end;
            end;
        }
    }
    var
        CompanyInformation: Record "Company Information";
        License: text;
}