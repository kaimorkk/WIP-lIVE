report 56205 "Annual Appraisal Form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Annual Appraisal Form.rdlc';

    dataset
    {
        dataitem("Annual Appraisal"; "Annual Appraisal")
        {
            RequestFilterFields = No;
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
            column(No_AnnualAppraisal; "Annual Appraisal".No)
            {
            }
            column(Datecreated_AnnualAppraisal; "Annual Appraisal"."Date created")
            {
            }
            column(TimeCreated_AnnualAppraisal; "Annual Appraisal"."Time Created")
            {
            }
            column(CreatedBy_AnnualAppraisal; "Annual Appraisal"."Created By")
            {
            }
            column(EmployeeNo_AnnualAppraisal; "Annual Appraisal"."Employee No")
            {
            }
            column(EmployeeName_AnnualAppraisal; "Annual Appraisal"."Employee Name")
            {
            }
            column(GlobalDimension1Code_AnnualAppraisal; "Annual Appraisal"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_AnnualAppraisal; "Annual Appraisal"."Global Dimension 2 Code")
            {
            }
            column(Quarter_AnnualAppraisal; "Annual Appraisal".Quarter)
            {
            }
            column(FinancialYear_AnnualAppraisal; "Annual Appraisal"."Financial Year")
            {
            }
            column(OverallQuartelyscore_AnnualAppraisal; "Annual Appraisal"."Overall Quartely score")
            {
            }
            column(AdditionalAssignment_AnnualAppraisal; "Annual Appraisal"."Additional Assignment")
            {
            }
            column(Remarks_AnnualAppraisal; "Annual Appraisal".Remarks)
            {
            }
            column(SupervisorCode_AnnualAppraisal; "Annual Appraisal"."Supervisor Code")
            {
            }
            column(SupervisorName_AnnualAppraisal; "Annual Appraisal"."Supervisor Name")
            {
            }
            column(SupervisorDesignation_AnnualAppraisal; "Annual Appraisal"."Supervisor Designation")
            {
            }
            column(Status_AnnualAppraisal; "Annual Appraisal".Status)
            {
            }
            column(NoSeries_AnnualAppraisal; "Annual Appraisal"."No. Series")
            {
            }
            column(CurrentDesignation_AnnualAppraisal; "Annual Appraisal"."Current Designation")
            {
            }
            column(Termsofservice_AnnualAppraisal; "Annual Appraisal"."Terms of service")
            {
            }
            column(ActingAppointment_AnnualAppraisal; "Annual Appraisal"."Acting Appointment")
            {
            }
            column(Appraiseecomments_AnnualAppraisal; "Annual Appraisal"."Appraisee comments")
            {
            }
            column(SupervisorComments_AnnualAppraisal; "Annual Appraisal"."Supervisor Comments")
            {
            }
            column(RewardTypeRecommended_AnnualAppraisal; "Annual Appraisal"."Reward Type Recommended")
            {
            }
            column(OtherInterventions_AnnualAppraisal; "Annual Appraisal"."Other Interventions")
            {
            }
            dataitem("Annual  Appraisal Lines"; "Annual  Appraisal Lines")
            {
                DataItemLink = "Appraisal No" = field(No);
                column(AppraisalNo_AnnualAppraisalLines; "Annual  Appraisal Lines"."Appraisal No")
                {
                }
                column(LineNo_AnnualAppraisalLines; "Annual  Appraisal Lines"."Line No.")
                {
                }
                column(AgreedPerformanceTargets_AnnualAppraisalLines; "Annual  Appraisal Lines"."Agreed Performance Targets")
                {
                }
                column(AcheivedTargetsofAnnual_AnnualAppraisalLines; "Annual  Appraisal Lines"."Achieved Targets  of Annual")
                {
                }
                column(PerformanceIndicator_AnnualAppraisalLines; "Annual  Appraisal Lines"."Performance Indicator")
                {
                }
                column(PercentageCumulativeAchievem_AnnualAppraisalLines; "Annual  Appraisal Lines"."Percentage Cumulative Achievem")
                {
                }
                column(AppraisalScore_AnnualAppraisalLines; "Annual  Appraisal Lines"."Appraisal Score")
                {
                }
            }
            dataitem("Staff Training Appraisal"; "Staff Training Appraisal")
            {
                DataItemLink = "Appraisal No" = field(No);
                column(TrainingDevelopmentNeed_StaffTrainingAppraisal; "Staff Training Appraisal"."Training & Development Need")
                {
                }
                column(AppraisalNo_StaffTrainingAppraisal; "Staff Training Appraisal"."Appraisal No")
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

    trigger OnInitReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}

