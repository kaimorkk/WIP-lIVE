Page 50065 "Dir Probation Appraisals List"
{
    ApplicationArea = Basic;
    CardPageID = "Probation Appraisal Form";
    PageType = List;
    SourceTable = "Employee Appraisals-Probation";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field(AppraisalNo;"Appraisal No")
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
                field(DeapartmentCode;"Deapartment Code")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalType;"Appraisal Type")
                {
                    ApplicationArea = Basic;
                }
                field(DateofFirstAppointment;"Date of First Appointment")
                {
                    ApplicationArea = Basic;
                }
                field(PostonFirstAppointment;"Post on First Appointment")
                {
                    ApplicationArea = Basic;
                }
                field(PresentSubstantivePost;"Present Substantive Post")
                {
                    ApplicationArea = Basic;
                }
                field(DateofPromotion;"Date of Promotion")
                {
                    ApplicationArea = Basic;
                }
                field(MainResposibilitiesFunctions;"Main Resposibilities/Functions")
                {
                    ApplicationArea = Basic;
                }
                field(ActingAppointmentIfany;"Acting Appointment(If any)")
                {
                    ApplicationArea = Basic;
                }
                field(StartofActing;"Start of Acting")
                {
                    ApplicationArea = Basic;
                }
                field(EndofActing;"End of Acting")
                {
                    ApplicationArea = Basic;
                }
                field(OverallGrading;"Overall Grading")
                {
                    ApplicationArea = Basic;
                }
                field(OverallScore;"Overall Score(%)")
                {
                    ApplicationArea = Basic;
                }
                field(TotalScoreSelfEval;"Total Score(Self Eval)")
                {
                    ApplicationArea = Basic;
                }
                field(TotalScoreAppraiserEval;"Total Score(Appraiser Eval)")
                {
                    ApplicationArea = Basic;
                }
                field(SelfEvalTotalScore;"Self Eval Total Score (%)")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiserEvalTotalScore;"Appraiser Eval Total Score (%)")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalEndDate;"Appraisal End Date")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalStartDate;"Appraisal Start Date")
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

