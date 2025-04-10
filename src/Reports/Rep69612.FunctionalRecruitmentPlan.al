report 69612 "Functional Recruitment Plan"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Functional Recruitment Plan.rdlc';

    dataset
    {
        dataitem("Recruitment Plan"; "Recruitment Plan")
        {
            DataItemTableView = where("Recruitment Plan Type" = filter("Functional Plan"));
            column(Logo; CompanyInformation.Picture)
            {
            }
            column(Name; CompanyInformation.Name)
            {
            }
            column(CreatedOn_RecruitmentPlan; "Recruitment Plan"."Created On")
            {
            }
            column(Posted_RecruitmentPlan; "Recruitment Plan".Posted)
            {
            }
            column(PostedBy_RecruitmentPlan; "Recruitment Plan"."Posted By")
            {
            }
            column(PostedOn_RecruitmentPlan; "Recruitment Plan"."Posted On")
            {
            }
            column(RecruitmentPlanType_RecruitmentPlan; "Recruitment Plan"."Recruitment Plan Type")
            {
            }
            column(JobNo_RecruitmentPlan; "Recruitment Plan"."Job No")
            {
            }
            column(AverageCostHire_RecruitmentPlan; "Recruitment Plan"."Average Cost/Hire")
            {
            }
            column(EstimatedAnnualSalary_RecruitmentPlan; "Recruitment Plan"."Estimated Annual Salary")
            {
            }
            column(NoofVacancies_RecruitmentPlan; "Recruitment Plan"."No. of Vacancies")
            {
            }
            column(DocumentNo_RecruitmentPlan; "Recruitment Plan"."Document No.")
            {
            }
            column(DocumentDate_RecruitmentPlan; "Recruitment Plan"."Document Date")
            {
            }
            column(FinancialYearCode_RecruitmentPlan; "Recruitment Plan"."Financial Year Code")
            {
            }
            column(Description_RecruitmentPlan; "Recruitment Plan".Description)
            {
            }
            column(ExternalDocumentNo_RecruitmentPlan; "Recruitment Plan"."External Document No")
            {
            }
            column(PlanningStartDate_RecruitmentPlan; "Recruitment Plan"."Planning Start Date")
            {
            }
            column(PlanningEndDate_RecruitmentPlan; "Recruitment Plan"."Planning End Date")
            {
            }
            column(CorporateStrategicPlanID_RecruitmentPlan; "Recruitment Plan"."Corporate Strategic Plan ID")
            {
            }
            column(FunctionalPlannedHires_RecruitmentPlan; "Recruitment Plan"."Functional Planned Hires")
            {
            }
            column(ApprovedStaffEstablishment_RecruitmentPlan; "Recruitment Plan"."Approved Staff Establishment")
            {
            }
            column(NoofPlannedNewHires_RecruitmentPlan; "Recruitment Plan"."No. of Planned New Hires")
            {
            }
            column(TotalRecruitmentBudgetLCY_RecruitmentPlan; "Recruitment Plan"."Total Recruitment Budget (LCY)")
            {
            }
            column(NoofRecruitmentRequisition_RecruitmentPlan; "Recruitment Plan"."No. of Recruitment Requisition")
            {
            }
            column(ApprovalStatus_RecruitmentPlan; "Recruitment Plan"."Approval Status")
            {
            }
            column(CreatedBY_RecruitmentPlan; "Recruitment Plan"."Created BY")
            {
            }
            dataitem("Recruitment Plan Position"; "Recruitment Plan Position")
            {
                DataItemLink = "Recruitment Plan ID" = field("Document No.");
                column(RecruitmentPlanID_RecruitmentPlanPosition; "Recruitment Plan Position"."Recruitment Plan ID")
                {
                }
                column(PositionID_RecruitmentPlanPosition; "Recruitment Plan Position"."Position ID")
                {
                }
                column(JobTitleDesignation_RecruitmentPlanPosition; "Recruitment Plan Position"."Job Title/Designation")
                {
                }
                column(DesignationGroup_RecruitmentPlanPosition; "Recruitment Plan Position"."Designation Group")
                {
                }
                column(Directorate_RecruitmentPlanPosition; "Recruitment Plan Position".Directorate)
                {
                }
                column(Department_RecruitmentPlanPosition; "Recruitment Plan Position".Department)
                {
                }
                column(StaffEstablishment_RecruitmentPlanPosition; "Recruitment Plan Position"."Staff Establishment")
                {
                }
                column(CurrentHeadcount_RecruitmentPlanPosition; "Recruitment Plan Position"."Current Headcount")
                {
                }
                column(TotalPlannedNewHires_RecruitmentPlanPosition; "Recruitment Plan Position"."Total Planned New Hires")
                {
                }
                column(RecruitmentBudgetCostLCY_RecruitmentPlanPosition; "Recruitment Plan Position"."Recruitment Budget Cost (LCY)")
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
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
}

