report 80020 "Performance Appraisal Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Performance Appraisal Report.rdlc';

    dataset
    {
        dataitem("Perfomance Evaluation"; "Perfomance Evaluation")
        {
            RequestFilterFields = "Document Status", "Approval Status";
            column(EmployeeNo_PerfomanceEvaluation; "Perfomance Evaluation"."Employee No.")
            {
            }
            column(EmployeeName_PerfomanceEvaluation; "Perfomance Evaluation"."Employee Name")
            {
            }
            column(CurrentDesignation_PerfomanceEvaluation; "Perfomance Evaluation"."Current Designation")
            {
            }
            column(CurrentGrade_PerfomanceEvaluation; "Perfomance Evaluation"."Current Grade")
            {
            }
            column(SupervisorStaffNo_PerfomanceEvaluation; "Perfomance Evaluation"."Supervisor Staff No.")
            {
            }
            column(SupervisorName_PerfomanceEvaluation; "Perfomance Evaluation"."Supervisor Name")
            {
            }
            column(DocumentDate_PerfomanceEvaluation; "Perfomance Evaluation"."Document Date")
            {
            }
            column(EvaluationStartDate_PerfomanceEvaluation; "Perfomance Evaluation"."Evaluation Start Date")
            {
            }
            column(EvaluationEndDate_PerfomanceEvaluation; "Perfomance Evaluation"."Evaluation End Date")
            {
            }
            column(PersonalScorecardID_PerfomanceEvaluation; "Perfomance Evaluation"."Personal Scorecard ID")
            {
            }
            column(TotalWeight_PerfomanceEvaluation; "Perfomance Evaluation"."Total Weight %")
            {
            }
            column(Directorate_PerfomanceEvaluation; "Perfomance Evaluation".Directorate)
            {
            }
            column(Department_PerfomanceEvaluation; "Perfomance Evaluation".Department)
            {
            }
            column(ApprovalStatus_PerfomanceEvaluation; "Perfomance Evaluation"."Approval Status")
            {
            }
            column(DocumentStatus_PerfomanceEvaluation; "Perfomance Evaluation"."Document Status")
            {
            }
            column(TotalFinalWeightedScore_PerfomanceEvaluation; "Perfomance Evaluation"."Total Final Weighted Score")
            {
            }
            column(TotalProficiencyScore_PerfomanceEvaluation; "Perfomance Evaluation"."Total Proficiency Score")
            {
            }
            column(TotalRawScore_PerfomanceEvaluation; "Perfomance Evaluation"."Total Raw Score")
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
}

