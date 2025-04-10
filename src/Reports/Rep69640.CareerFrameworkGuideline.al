report 69640 "Career Framework Guideline"
{

    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Career Framework Guideline.rdlc';

    dataset
    {
        dataitem("Company Positions"; "Company Positions")
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
            column(JobID_CompanyPositions; "Company Positions"."Position ID")
            {
            }
            column(JobDescription_CompanyPositions; "Company Positions"."Job Title")
            {
            }
            column(DirectlyReportsTo_CompanyPositions; "Company Positions"."Directly Reports To")
            {
            }
            column(IndirectlyReportsTo_CompanyPositions; "Company Positions"."Indirectly Reports To")
            {
            }
            column(ExecutiveSummaryJobPurpose_CompanyPositions; "Company Positions"."Executive Summary/Job Purpose")
            {
            }
            column(DesignationGroup_CompanyPositions; "Company Positions"."Designation Group")
            {
            }
            column(JobGradeID_CompanyPositions; "Company Positions"."Job Grade ID")
            {
            }
            column(OverallAppointmentAuthority_CompanyPositions; "Company Positions"."Overall Appointment Authority")
            {
            }
            column(SeniorityLevel_CompanyPositions; "Company Positions"."Seniority Level")
            {
            }
            column(DefaultTermsofService_CompanyPositions; "Company Positions"."Default Terms of Service")
            {
            }
            column(EmploymentType_CompanyPositions; "Company Positions"."Employment Type")
            {
            }
            column(Directorate_CompanyPositions; "Company Positions".Directorate)
            {
            }
            column(Department_CompanyPositions; "Company Positions".Department)
            {
            }
            column(MinimumAcademicQualification_CompanyPositions; "Company Positions"."Minimum Academic Qualification")
            {
            }
            column(MinimumWorkExperience_CompanyPositions; "Company Positions"."Minimum Work Experience")
            {
            }
            column(MinimumMngmntExperience_CompanyPositions; "Company Positions"."Minimum Mngmnt Experience")
            {
            }
            column(DefaultProbationPeriod_CompanyPositions; "Company Positions"."Default Probation Period")
            {
            }
            column(DefaultDutyStation_CompanyPositions; "Company Positions"."Default Duty Station")
            {
            }
            column(EffectiveDate_CompanyPositions; "Company Positions"."Effective Date")
            {
            }
            column(TravelFrequency_CompanyPositions; "Company Positions"."Travel Frequency")
            {
            }
            column(DefaultWorkShift_CompanyPositions; "Company Positions"."Default Work Shift")
            {
            }
            column(WorkShiftDescription_CompanyPositions; "Company Positions"."Work Shift Description")
            {
            }
            column(AdditionalResponsibilities_CompanyPositions; "Company Positions"."Additional Responsibilities")
            {
            }
            column(LocRelocationTransfers_CompanyPositions; "Company Positions"."Loc Relocation/Transfers")
            {
            }
            column(IntRelocationTransfers_CompanyPositions; "Company Positions"."Int Relocation/Transfers")
            {
            }
            column(QualifiesforOvertime_CompanyPositions; "Company Positions"."Qualifies for Overtime")
            {
            }
            column(DirectHireUnitCost_CompanyPositions; "Company Positions"."Direct Hire Unit Cost")
            {
            }
            column(AverageMonthlySalaryLCY_CompanyPositions; "Company Positions"."Average Monthly Salary (LCY)")
            {
            }
            column(ApprovedEstablishment_CompanyPositions; "Company Positions"."Approved Establishment")
            {
            }
            column(NoofActiveContracts_CompanyPositions; "Company Positions"."No of Active Contracts")
            {
            }
            column(NoofTerminatedContracts_CompanyPositions; "Company Positions"."No. of Terminated Contracts")
            {
            }
            column(DimensionSetID_CompanyPositions; "Company Positions"."Dimension Set ID")
            {
            }
            column(Blocked_CompanyPositions; "Company Positions".Blocked)
            {
            }
            column(AcademicHierarchyCode_CompanyPositions; "Company Positions"."Academic Hierarchy Code")
            {
            }
            dataitem("Positions Responsibility"; "Positions Responsibility")
            {
                DataItemLink = "Position ID" = field("Position ID");
                column(PositionID_PositionsResponsibility; "Positions Responsibility"."Position ID")
                {
                }
                column(LineNo_PositionsResponsibility; "Positions Responsibility"."Line No")
                {
                }
                column(Description_PositionsResponsibility; "Positions Responsibility".Description)
                {
                }
            }
            dataitem("Position Requirement"; "Position Requirement")
            {
                DataItemLink = "Position ID" = field("Position ID");
                column(PositionID_PositionRequirement; "Position Requirement"."Position ID")
                {
                }
                column(RequirementID_PositionRequirement; "Position Requirement"."Requirement ID")
                {
                }
                column(QualificationCategory_PositionRequirement; "Position Requirement"."Qualification Category")
                {
                }
                column(Description_PositionRequirement; "Position Requirement".Description)
                {
                }
                column(RequirementType_PositionRequirement; "Position Requirement"."Requirement Type")
                {
                }
                column(SubstituteQualification_PositionRequirement; "Position Requirement"."Substitute Qualification")
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

