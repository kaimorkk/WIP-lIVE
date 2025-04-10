report 50110 "Performance Appraisal System"
{
    ApplicationArea = All;
    Caption = 'Performance Appraisal System';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = PASRDLC;

    dataset
    {
        dataitem(PerfomanceContractHeader; "Perfomance Contract Header")
        {
            column(No; No)
            {
            }
            column(DirectorateName_PerfomanceContractHeader; "Directorate Name")
            {
            }
            column(Court; Employee."Court Levels")
            {
            }
            column(DutyStation; Employee."Current Duty Station")
            {
            }
            column(TermsofService; Employee."Current Terms of Service")
            {
            }
            column(ActingAppointment; Employee.Position)
            {
            }
            column(EmployeeNo; Employee."No.")
            {
            }
            column(EmployeeName_PerfomanceContractHeader; "Employee Name")
            {
            }
            column(Position_PerfomanceContractHeader; Position)
            {
            }
            column(Grade; Employee."Current Job Grade")
            {
            }
            column(SupervisorsEmployeeNo_PerfomanceContractHeader; "Supervisors Employee No.")
            {
            }
            column(SupervisorsEmployeeName_PerfomanceContractHeader; "Supervisors Employee Name.")
            {
            }

            column(ResponsibleEmployeeNo_PerfomanceContractHeader; "Responsible Employee No.")
            {
            }
            column(ActingJobID_PerfomanceContractHeader; "Acting Job ID")
            {
            }
            column(AnnualReportingCode_PerfomanceContractHeader; "Annual Reporting Code")
            {
            }
            column(Designation_PerfomanceContractHeader; Designation)
            {
            }
            column(DepartmentCenterPCID_PerfomanceContractHeader; "Department/Center PC ID")
            {
            }
            column(StartDate_PerfomanceContractHeader; "Start Date")
            {
            }
            column(EndDate_PerfomanceContractHeader; "End Date")
            {
            }
            column(CompanyPic; CompanyInformation.Picture)
            {
            }
            column(CompanyName; CompanyInformation.Name)
            {
            }
            column(Filters; Filters)
            {
            }
            column(Responsibility_Center_Name; "Responsibility Center Name")
            {

            }

            dataitem("Performance Targets"; "Performance Targets")
            {
                DataItemLink = "Contract No." = field(No), "PMMU No." = field("Department/Center PC ID");

                column(PASActivity_PerformanceTargets; "PAS Activity")
                {
                }
                column(PerformanceIndicator_PerformanceTargets; "Performance Indicator")
                {
                }
                column(UnitofMeasure_PerformanceTargets; "Unit of Measure")
                {
                }
                column(Activity_PerformanceTargets; Activity)
                {
                }
                column(IndividualTarget_PerformanceTargets; "Individual Target")
                {
                }
                column(Score_PerformanceTargets; Score)
                {
                }
                column(Target_PerformanceTargets; Target)
                {
                }
                column(Weight_PerformanceTargets; Weight)
                {
                }
                column(SelfAssessmentTarget_PerformanceTargets; "Self Assessment Target")
                {
                }
                column(JointAgreedTarget_PerformanceTargets; "Joint/Agreed Target")
                {
                }
                column(WeightedScore_PerformanceTargets; "Weighted Score")
                {
                }
            }
            dataitem("PAS Core Values"; "PAS Core Values")
            {
                DataItemLink = "Performance Contract Header" = field(No);

                column(CoreValueCount; CoreValueCount)
                {
                }
                column(CoreValue_PASCoreValues; "Core Value")
                {
                }
                column(Behaviouralexpectation_PASCoreValues; "Behavioural expectation")
                {
                }
                column(KeyPerformanceIndicator_PASCoreValues; "Key Performance Indicator")
                {
                }
                column(Weight_PASCoreValues; Weight)
                {
                }
                column(Target_PASCoreValues; Target)
                {
                }
                column(SelfAssessment_PASCoreValues; "Self Assessment")
                {
                }
                column(JointAssessment_PASCoreValues; "Joint Assessment")
                {
                }
                column(WeightedScore_PASCoreValues; "Weighted Score")
                {
                }
                column(Scale_PASCoreValues; Scale)
                {
                }
                column(AppraiseeComments_PASCoreValues; "Appraisee Comments")
                {
                }
                column(Score_PASCoreValues; Score)
                {
                }

                column(AppraisersComments_PASCoreValues; "Appraisers Comments")
                {
                }

                column(Description_PASCoreValues; Description)
                {

                }

                trigger OnAfterGetRecord()
                begin
                    if "PAS Core Values"."Core Value" = '' then
                        CurrReport.Skip();
                    CoreValueCount += 1;
                end;
            }

            dataitem("PAS Training Needs"; "PAS Training Needs")
            {
                DataItemLink = "PAS No." = field(No);
                column(Training_Need; "Training Need")
                {

                }
                column(SupervisorsRemarks_PASTrainingNeeds; "Supervisors Remarks")
                {
                }
                trigger OnAfterGetRecord()
                begin
                    if "Training Need" = '' then
                        CurrReport.Skip();
                end;
            }


            trigger OnAfterGetRecord()
            begin
                if Employee.Get("Responsible Employee No.") then;
            end;

            trigger OnPreDataItem()
            begin
                CompanyInformation.Get;
                CompanyInformation.CalcFields(Picture);
                Filters := PerfomanceContractHeader.GetFilters;
            end;
        }

    }
    rendering
    {
        layout(PASRDLC)
        {
            Type = RDLC;
            LayoutFile = './Layouts/PASRDLC.rdlc';
        }
        // layout(PASWord)
        // {
        //     Type = Word;
        //     LayoutFile = './Layouts/PASWord.docx';
        // }
    }

    var
        CompanyInformation: Record "Company Information";
        Employee: Record "Employee";
        Filters: Text;
        CoreValueCount: Integer;
}
