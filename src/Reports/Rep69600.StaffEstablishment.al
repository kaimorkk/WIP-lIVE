report 69600 "Staff Establishment"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Staff Establishment.rdlc';

    dataset
    {
        dataitem("Staff Establishment Plan"; "Staff Establishment Plan")
        {
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
            column(Code_StaffEstablishmentHeader; "Staff Establishment Plan".Code)
            {
            }
            column(Description_StaffEstablishmentHeader; "Staff Establishment Plan".Description)
            {
            }
            column(CSPID_StaffEstablishmentHeader; "Staff Establishment Plan"."External Document No.")
            {
            }
            column(StartDate_StaffEstablishmentHeader; "Staff Establishment Plan"."Effective Date")
            {
            }
            column(CreatedBy_StaffEstablishmentHeader; "Staff Establishment Plan"."Created By")
            {
            }
            column(CreatedOn_StaffEstablishmentHeader; "Staff Establishment Plan"."Created On")
            {
            }
            column(ApprovedQuantity_StaffEstablishmentHeader; "Staff Establishment Plan"."Total Staff Establishment")
            {
            }
            dataitem("Establishment Plan Position"; "Establishment Plan Position")
            {
                DataItemLink = "Staff Establishment Code" = field(Code);
                column(EntryNo_EstablishmentPlanPosition; "Establishment Plan Position"."Approved No.")
                {
                }
                column(JobID_EstablishmentPlanPosition; "Establishment Plan Position"."Job ID")
                {
                }
                column(JobTitle_EstablishmentPlanPosition; "Establishment Plan Position"."Job Title")
                {
                }
                column(ActualActive_EstablishmentPlanPosition; "Establishment Plan Position"."Actual Active")
                {
                }
                column(ActualTerminated_EstablishmentPlanPosition; "Establishment Plan Position"."Actual Terminated")
                {
                }
                column(ActualSuspended_EstablishmentPlanPosition; "Establishment Plan Position"."Actual Suspended")
                {
                }
                column(StaffEstablishmentCode_EstablishmentPlanPosition; "Establishment Plan Position"."Staff Establishment Code")
                {
                }
                column(YearCode_EstablishmentPlanPosition; "Establishment Plan Position"."Year Code")
                {
                }
                column(ApprovedNo_EstablishmentPlanPosition; "Establishment Plan Position"."Approved No.")
                {
                }
                column(DepartmentCode_EstablishmentPlanPosition; "Establishment Plan Position"."Directorate Code")
                {
                }
                column(DirectorateCode_EstablishmentPlanPosition; "Establishment Plan Position"."Designation Group")
                {
                }
                column(DesignationGroup_EstablishmentPlanPosition; "Establishment Plan Position"."Designation Group")
                {
                }
                column(Variance_EstablishmentPlanPosition; "Establishment Plan Position".Variance)
                {
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

