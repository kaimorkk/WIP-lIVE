Page 50059 "Dir Appraisal Objectives List"
{
    ApplicationArea = Basic;
    CardPageID = "Employee Appraisal Objectives";
    PageType = List;
    SourceTable = "Employee Appraisal Objectives1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalCategory;"Appraisal Category")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalPeriod;"Appraisal Period")
                {
                    ApplicationArea = Basic;
                }
                field(NoSupervisedDirectly;"No. Supervised (Directly)")
                {
                    ApplicationArea = Basic;
                }
                field(NoSupervisedInDirectly;"No. Supervised (In-Directly)")
                {
                    ApplicationArea = Basic;
                }
                field(JobID;"Job ID")
                {
                    ApplicationArea = Basic;
                }
                field(AgreementWithRating;"Agreement With Rating")
                {
                    ApplicationArea = Basic;
                }
                field(GeneralComments;"General Comments")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(Rating;Rating)
                {
                    ApplicationArea = Basic;
                }
                field(RatingDescription;"Rating Description")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiserNo;"Appraiser No")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisersName;"Appraisers Name")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseeID;"Appraisee ID")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiserID;"Appraiser ID")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseeName;"Appraisee Name")
                {
                    ApplicationArea = Basic;
                }
                field(JobGroup;"Job Group")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisersJobTitle;"Appraiser's Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseesJobTitle;"Appraisee's Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(ObjectiveNo;"Objective No")
                {
                    ApplicationArea = Basic;
                }
                field(Noseries;"No. series")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode;"Department Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        UserRec.Reset;
        if UserRec.Get(UserId) then
        // Emp.RESET;
         if Emp.Get(UserRec."Employee No.") then
           SetRange("Directorate Code",Emp."Global Dimension 1 Code");
    end;

    var
        UserRec: Record "User Setup";
        Emp: Record Employee;
}

