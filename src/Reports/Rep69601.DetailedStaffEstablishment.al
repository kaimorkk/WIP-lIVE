report 69601 "Detailed Staff Establishment"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Detailed Staff Establishment.rdlc';

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
            dataitem("Establishment Planning Line"; "Establishment Planning Line")
            {
                DataItemLink = "Primary Key" = field(Code);
                column(EntryNo_EstablishmentPlanningLine; "Establishment Planning Line"."Entry No.")
                {
                }
                column(TaskNo_EstablishmentPlanningLine; "Establishment Planning Line"."Task No")
                {
                }
                column(PrimaryKey_EstablishmentPlanningLine; "Establishment Planning Line"."Primary Key")
                {
                }
                column(PositionID_EstablishmentPlanningLine; "Establishment Planning Line"."Position ID")
                {
                }
                column(JobTitleDesignation_EstablishmentPlanningLine; "Establishment Planning Line"."Job Title/Designation")
                {
                }
                column(DepartmentCode_EstablishmentPlanningLine; "Establishment Planning Line"."Department Code")
                {
                }
                column(DirectorateCode_EstablishmentPlanningLine; "Establishment Planning Line"."Directorate Code")
                {
                }
                column(OptimalStaffing_EstablishmentPlanningLine; "Establishment Planning Line"."Optimal Staffing")
                {
                }
                column(NoofActiveEmployees_EstablishmentPlanningLine; "Establishment Planning Line"."No. of Active Employees")
                {
                }
                column(Justification_EstablishmentPlanningLine; "Establishment Planning Line".Justification)
                {
                }
                column(DimensionSetID_EstablishmentPlanningLine; "Establishment Planning Line"."Dimension Set ID")
                {
                }
                column(RegionCode_EstablishmentPlanningLine; "Establishment Planning Line"."Region Code")
                {
                }
                column(DutyStationID_EstablishmentPlanningLine; "Establishment Planning Line"."Duty Station ID")
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

