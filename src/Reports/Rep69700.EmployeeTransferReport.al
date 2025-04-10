report 69700 "Employee Transfer Report"
{

    Caption = 'Employee Transfer Report';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Transfer Report.rdlc';
    dataset
    {
        dataitem(EmployeeTransfers; "Employee Transfers")
        {
            // DataItemTableView = WHERE(Posted = CONST(true));
            // PrintOnlyIfDetail = true;
            RequestFilterFields = "Employee No", Type, Designation, Status;
            column(CreatedBy; "Created By")
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }


            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax; CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite; CompanyInfo."Home Page")
            {
            }
            column(DateCreated; "Date Created")
            {
            }
            column(Distance; Distance)
            {
            }
            column(DocumentNo; "Document No")
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(EmployeeNo; "Employee No")
            {
            }
            column(EntryNo; "Entry No")
            {
            }
            column(NewSattionName; "New Sattion Name")
            {
            }
            column(NewStation; "New Station")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(OriginalStation; "Original Station")
            {
            }
            column(OriginalStationName; "Original Station Name")
            {
            }

            column(Posted; Posted)
            {
            }
            column(PostedOn; "Posted On")
            {
            }
            column(Status; Status)
            {
            }
            column(SystemCreatedAt; SystemCreatedAt)
            {
            }
            column(SystemCreatedBy; SystemCreatedBy)
            {
            }
            column(SystemId; SystemId)
            {
            }
            column(SystemModifiedAt; SystemModifiedAt)
            {
            }
            column(SystemModifiedBy; SystemModifiedBy)
            {
            }
            column(TimeCreated; "Time Created")
            {
            }
            column(ToHardshipArea; "To Hardship Area?")
            {
            }
            column(Gender; Gender)
            {

            }

            column(Designation; Designation)
            {

            }

            column(Grade; "Job Grade")
            {

            }
            column(TransferDate; "Transfer Date")
            {
            }
            column(TransferedBy; "Transfered By")
            {
            }
            column(Type; "Type")
            {
            }

            column(ReportingDate; "Reporting Date")
            {

            }
            column(ActualReportingDate; "Actual Reporting Date")
            {

            }
            column(CurrentHOSRemarks; "Current HOS Remarks")
            {

            }

            column(ReleaseDate; "Mobility Release Date")
            {

            }
            trigger OnAfterGetRecord()
            begin

                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {



                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        CompanyInfo: Record "Company Information";
}


