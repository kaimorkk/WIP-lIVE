Page 50058 "Director Appraisals List"
{
    ApplicationArea = Basic;
    CardPageID = "Appraisal Form";
    PageType = List;
    SourceTable = "Employee Appraisals1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(AppraisalNo;"Appraisal No")
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
                field(AppraisalType;"Appraisal Type")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
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
                field(AppraiserID;"Appraiser ID")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisersJobTitle;"Appraiser's Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseeName;"Appraisee Name")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseeID;"Appraisee ID")
                {
                    ApplicationArea = Basic;
                }
                field(JobID;"Job ID")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseesJobTitle;"Appraisee's Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(JobGroup;"Job Group")
                {
                    ApplicationArea = Basic;
                }
                field(DeapartmentCode;"Deapartment Code")
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
         //Emp.RESET;
         if Emp.Get(UserRec."Employee No.") then
           SetRange("Directorate Code",Emp."Global Dimension 1 Code");
    end;

    var
        UserRec: Record "User Setup";
        Emp: Record Employee;
}

