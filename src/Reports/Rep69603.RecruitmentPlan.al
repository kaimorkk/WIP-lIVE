report 69603 "Recruitment Plan"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Recruitment Plan.rdlc';

    dataset
    {
        dataitem("Recruitment Plan"; "Recruitment Plan")
        {
            DataItemTableView = where("Recruitment Plan Type" = filter("Annual HR Plan"));
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
            dataitem("Recruitment Planning Line"; "Recruitment Planning Line")
            {
                DataItemLink = "Recruitment Plan ID" = field("Document No.");
                column(RecruitmentPlanID_RecruitmentPlanningLine; "Recruitment Planning Line"."Recruitment Plan ID")
                {
                }
                column(PositionID_RecruitmentPlanningLine; "Recruitment Planning Line"."Position ID")
                {
                }
                column(DutyStationID_RecruitmentPlanningLine; "Recruitment Planning Line"."Duty Station ID")
                {
                }
                column(StaffEstablishment_RecruitmentPlanningLine; "Recruitment Planning Line"."Staff Establishment")
                {
                }
                column(CurrentHeadcount_RecruitmentPlanningLine; "Recruitment Planning Line"."Current Headcount")
                {
                }
                column(NoofPlannedNewHires_RecruitmentPlanningLine; "Recruitment Planning Line"."No. of Planned New Hires")
                {
                }
                column(SourcingMethod_RecruitmentPlanningLine; "Recruitment Planning Line"."Sourcing Method")
                {
                }
                column(RecruitmentCycleType_RecruitmentPlanningLine; "Recruitment Planning Line"."Recruitment Cycle Type")
                {
                }
                column(RecruitmentLeadTime_RecruitmentPlanningLine; "Recruitment Planning Line"."Recruitment Lead Time")
                {
                }
                column(PlannedStartDate_RecruitmentPlanningLine; "Recruitment Planning Line"."Planned Start Date")
                {
                }
                column(PlannedEndDate_RecruitmentPlanningLine; "Recruitment Planning Line"."Planned End Date")
                {
                }
                column(PrimaryRecruitmentReason_RecruitmentPlanningLine; "Recruitment Planning Line"."Primary Recruitment Reason")
                {
                }
                column(TargetCandidateSource_RecruitmentPlanningLine; "Recruitment Planning Line"."Target Candidate Source")
                {
                }
                column(DirectHireUnitCost_RecruitmentPlanningLine; "Recruitment Planning Line"."Direct Hire Unit Cost")
                {
                }
                column(AverageMonthlySalaryLCY_RecruitmentPlanningLine; "Recruitment Planning Line"."Average Monthly Salary (LCY)")
                {
                }
                column(NoofMonthsRecruiterFees_RecruitmentPlanningLine; "Recruitment Planning Line"."No. of Months Recruiter Fees")
                {
                }
                column(RecruiterFees_RecruitmentPlanningLine; "Recruitment Planning Line"."Recruiter Fees %")
                {
                }
                column(RecLineBudgetCostLCY_RecruitmentPlanningLine; "Recruitment Planning Line"."Rec Line Budget Cost (LCY)")
                {
                }
                column(DesignationGroup_RecruitmentPlanningLine; "Recruitment Planning Line"."Designation Group")
                {
                }
                column(Directorate_RecruitmentPlanningLine; "Recruitment Planning Line".Directorate)
                {
                }
                column(Department_RecruitmentPlanningLine; "Recruitment Planning Line".Department)
                {
                }
                column(RegionID_RecruitmentPlanningLine; "Recruitment Planning Line"."Region ID")
                {
                }
                column(LineNo_RecruitmentPlanningLine; "Recruitment Planning Line"."Line No")
                {
                }
                column(PlannedEmploymentStartDate_RecruitmentPlanningLine; "Recruitment Planning Line"."Planned Employment Start Date")
                {
                }
                column(PlannedEmploymentEndDate_RecruitmentPlanningLine; "Recruitment Planning Line"."Planned Employment End Date")
                {
                }
                column(JobNo_RecruitmentPlanningLine; "Recruitment Planning Line"."Job No.")
                {
                }
                column(JobTaskNo_RecruitmentPlanningLine; "Recruitment Planning Line"."Job Task No.")
                {
                }
                column(FundingSourceID_RecruitmentPlanningLine; "Recruitment Planning Line"."Funding Source ID")
                {
                }
                column(RecruitmentLineBudgetCost_RecruitmentPlanningLine; "Recruitment Planning Line"."Recruitment Line Budget Cost")
                {
                }
                column(AverageCostHire_RecruitmentPlanningLine; "Recruitment Planning Line"."Average Cost/Hire")
                {
                }
                column(EstimateAnnualSalary_RecruitmentPlanningLine; "Recruitment Planning Line"."Estimate Annual Salary")
                {
                }
                column(HierarchicallyReportsTo_RecruitmentPlanningLine; "Recruitment Planning Line"."Hierarchically Reports To")
                {
                }
                column(FunctionallyReportsTo_RecruitmentPlanningLine; "Recruitment Planning Line"."Functionally  Reports To")
                {
                }
                column(JobGradeID_RecruitmentPlanningLine; "Recruitment Planning Line"."Job Grade ID")
                {
                }
                column(OverallAppointmentAuthority_RecruitmentPlanningLine; "Recruitment Planning Line"."Overall Appointment Authority")
                {
                }
                column(SeniorityLevel_RecruitmentPlanningLine; "Recruitment Planning Line"."Seniority Level")
                {
                }
                column(DefaultTermsofServiceCode_RecruitmentPlanningLine; "Recruitment Planning Line"."Default Terms of Service Code")
                {
                }
                column(EmploymentType_RecruitmentPlanningLine; "Recruitment Planning Line"."Employment Type")
                {
                }
                column(JobTitleDesignation_RecruitmentPlanningLine; "Recruitment Planning Line"."Job Title/Designation")
                {
                }
                column(WorkLocationDetails_RecruitmentPlanningLine; "Recruitment Planning Line"."Work Location Details")
                {
                }
                column(RecruitmentJustification_RecruitmentPlanningLine; "Recruitment Planning Line"."Recruitment Justification")
                {
                }
                column(RecruitmentPlanType_RecruitmentPlanningLine; "Recruitment Planning Line"."Recruitment Plan Type")
                {
                }
                column(DimensionSetID_RecruitmentPlanningLine; "Recruitment Planning Line"."Dimension Set ID")
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

