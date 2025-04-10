report 50186 "Perfomance Rewards"
{
    ApplicationArea = All;
    Caption = 'Perfomance Rewards';
    RDLCLayout = './Layouts/Perfomance Rewards.rdlc';
    DefaultLayout = RDLC;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(PerfomanceEvaluation; "Perfomance Evaluation")
        {
            PrintOnlyIfDetail=true;
            column(EmployeeNo; "Employee No.")
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(CurrentDesignation; "Current Designation")
            {
            }
            column(Directorate; Directorate)
            {
            }
            column(DutyStation_PerfomanceEvaluation; "Duty Station")
            {
            }
            dataitem("Appraisal Award Recomm"; "Appraisal Award Recomm")
            {
                DataItemLink = "Appraisal No" = field(No);
                //DataItemTableView = where("Award type" = filter(<> ''));
                //RequestFilterFields="Award type";

                column(Awardtype_AppraisalAwardRecomm; "Award type")
                {
                }
                column(AwardsName_AppraisalAwardRecomm; "Awards Name")
                {
                }
                column(Comment_AppraisalAwardRecomm; Comment)
                {
                }
            }
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
}
