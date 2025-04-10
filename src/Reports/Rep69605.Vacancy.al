report 69605 Vacancy
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Vacancy.rdlc';

    dataset
    {
        dataitem("Recruitment Requisition Header"; "Recruitment Requisition Header")
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
            column(DocumentNo_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Document No.")
            {
            }
            column(DocumentDate_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Document Date")
            {
            }
            column(RecruitmentPlanID_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Recruitment Plan ID")
            {
            }
            column(RecruitmentPlanType_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Recruitment Plan Type")
            {
            }
            column(PositionID_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Position ID")
            {
            }
            column(RequesterID_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Requester ID")
            {
            }
            column(RequesterStaffNo_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Requester Staff No")
            {
            }
            column(RequesterName_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Requester Name")
            {
            }
            column(Directorate_RecruitmentRequisitionHeader; "Recruitment Requisition Header".Directorate)
            {
            }
            column(Department_RecruitmentRequisitionHeader; "Recruitment Requisition Header".Department)
            {
            }
            column(Region_RecruitmentRequisitionHeader; "Recruitment Requisition Header".Region)
            {
            }
            column(FinacialYearCode_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Finacial Year Code")
            {
            }
            column(ApprovalStatus_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Approval Status")
            {
            }
            column(CreatedBy_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Created By")
            {
            }
            column(CreatedOn_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Created On")
            {
            }
            column(CreatedTime_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Created Time")
            {
            }
            column(StaffEstablishment_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Staff Establishment")
            {
            }
            column(CurrentHeadcount_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Current Headcount")
            {
            }
            column(NoofOpenings_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."No of Openings")
            {
            }
            column(PrimaryRecruitmentReason_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Primary Recruitment Reason")
            {
            }
            column(RecruitmentJustification_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Recruitment Justification")
            {
            }
            column(TargetCandidateSource_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Target Candidate Source")
            {
            }
            column(SourcingMethod_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Sourcing Method")
            {
            }
            column(RecruitmentCycleType_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Recruitment Cycle Type")
            {
            }
            column(RecruitmentLeadTime_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Recruitment Lead Time")
            {
            }
            column(PlannedRecruitmentStartDate_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Planned Recruitment Start Date")
            {
            }
            column(PlannedRecruitmentEndDate_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Planned Recruitment End Date")
            {
            }
            column(PlannedEmploymentStartDate_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Planned Employment Start Date")
            {
            }
            column(PlannedEmploymentEndDate_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Planned Employment End Date")
            {
            }
            column(JobNo_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Job No.")
            {
            }
            column(JobTaskNo_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Job Task No.")
            {
            }
            column(FundingSourceID_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Funding Source ID")
            {
            }
            column(RecruitmentLineBudgetCost_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Recruitment Line Budget Cost")
            {
            }
            column(AverageCostHire_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Average Cost/Hire")
            {
            }
            column(EstimateAnnualSalary_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Estimate Annual Salary")
            {
            }
            column(HierarchicallyReportsTo_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Hierarchically Reports To")
            {
            }
            column(FunctionallyReportsTo_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Functionally  Reports To")
            {
            }
            column(JobGradeID_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Job Grade ID")
            {
            }
            column(OverallAppointmentAuthority_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Overall Appointment Authority")
            {
            }
            column(SeniorityLevel_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Seniority Level")
            {
            }
            column(DefaultTermsofServiceCode_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Default Terms of Service Code")
            {
            }
            column(EmploymentType_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Employment Type")
            {
            }
            column(DimensionSetID_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Dimension Set ID")
            {
            }
            column(VacancyNo_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Vacancy No")
            {
            }
            column(VacancyStatus_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Vacancy Status")
            {
            }
            column(VacancyAnnouncementID_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Vacancy Announcement ID")
            {
            }
            column(DatePublished_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Date Published")
            {
            }
            column(ApplicationClosingDate_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Application Closing Date")
            {
            }
            column(ApplicationClosingTime_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Application Closing Time")
            {
            }
            column(NoofApplications_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."No. of Applications")
            {
            }
            column(NoofFilledPosts_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."No of Filled Posts")
            {
            }
            column(JobTitleDesignation_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Job Title/Designation")
            {
            }
            column(DutyStationID_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Duty Station ID")
            {
            }
            column(WorkLocationDetails_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Work Location Details")
            {
            }
            column(DocumentType_RecruitmentRequisitionHeader; "Recruitment Requisition Header"."Document Type")
            {
            }
            column(Published_RecruitmentRequisitionHeader; "Recruitment Requisition Header".Published)
            {
            }
            dataitem("Recruitment Req Requirement"; "Recruitment Req Requirement")
            {
                DataItemLink = "Document No." = field("Document No.");
                column(DocumentNo_RecruitmentReqRequirement; "Recruitment Req Requirement"."Document No.")
                {
                }
                column(DocumentType_RecruitmentReqRequirement; "Recruitment Req Requirement"."Document Type")
                {
                }
                column(RequirementID_RecruitmentReqRequirement; "Recruitment Req Requirement"."Requirement ID")
                {
                }
                column(QualificationCategory_RecruitmentReqRequirement; "Recruitment Req Requirement"."Qualification Category")
                {
                }
                column(Description_RecruitmentReqRequirement; "Recruitment Req Requirement".Description)
                {
                }
                column(RequirementType_RecruitmentReqRequirement; "Recruitment Req Requirement"."Requirement Type")
                {
                }
                column(SubstituteQualificationExist_RecruitmentReqRequirement; "Recruitment Req Requirement"."Substitute Qualification Exist")
                {
                }
                column(LineNo_RecruitmentReqRequirement; "Recruitment Req Requirement"."Line No.")
                {
                }
                column(QualificationCode_RecruitmentReqRequirement; "Recruitment Req Requirement"."Qualification Code")
                {
                }
            }
            dataitem("Recruitment Req Work Condition"; "Recruitment Req Work Condition")
            {
                DataItemLink = "Document No" = field("Document No.");
                column(DocumentNo_RecruitmentReqWorkCondition; "Recruitment Req Work Condition"."Document No")
                {
                }
                column(DocumentType_RecruitmentReqWorkCondition; "Recruitment Req Work Condition"."Document Type")
                {
                }
                column(LineNo_RecruitmentReqWorkCondition; "Recruitment Req Work Condition"."Line No")
                {
                }
                column(WorkingConditionCategory_RecruitmentReqWorkCondition; "Recruitment Req Work Condition"."Working Condition Category")
                {
                }
                column(Description_RecruitmentReqWorkCondition; "Recruitment Req Work Condition".Description)
                {
                }
            }
            dataitem("Recruitment Req Responsibility"; "Recruitment Req Responsibility")
            {
                DataItemLink = "Document No." = field("Document No.");
                column(DocumentNo_RecruitmentReqResponsibility; "Recruitment Req Responsibility"."Document No.")
                {
                }
                column(DocumentType_RecruitmentReqResponsibility; "Recruitment Req Responsibility"."Document Type")
                {
                }
                column(LineNo_RecruitmentReqResponsibility; "Recruitment Req Responsibility"."Line No.")
                {
                }
                column(Description_RecruitmentReqResponsibility; "Recruitment Req Responsibility".Description)
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

