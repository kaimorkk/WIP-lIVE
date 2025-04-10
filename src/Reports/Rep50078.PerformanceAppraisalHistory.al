report 50078 "Performance Appraisal History"
{
    ApplicationArea = All;
    Caption = 'Performance Appraisal History';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Performance Appraisal History.rdl';
    dataset
    {
        dataitem(Employee; Employee)
        {
            PrintOnlyIfDetail = true;
            column(No; "No.")
            {
            }
            column(FullName; Employee.FullName())
            {
            }
            column(JobTitle; "Job Title2")
            {
            }
            column(JobTitle2; "Job Title2")
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(ImplementingUnitName; "Implementing Unit Name")
            {
            }
            column(CompanyName; CompInfo.Name)
            {
            }
            column(CompanyPic; CompInfo.Picture)
            {
            }
            dataitem("Performance Appraisal History"; "Performance Appraisal History")
            {
                DataItemLink = "Employee No." = field("No.");
                column(Employee_No_; "Employee No.") { }
                column(Appraisers_Score_out_of_80_; "Appraisers Score out of 80%") { }
                column(Appraisal_Period; "Appraisal Period") { }
                column(Values_Score_out_of_20_; "Values Score out of 20%") { }
                column(TotalScore_PerformanceAppraisalHistory; "Total Score")
                {
                }
            }

            trigger OnPreDataItem()
            begin
                CompInfo.Get;
                CompInfo.CalcFields(Picture);
            end;
        }
    }

    var
        CompInfo: Record "Company Information";

}
