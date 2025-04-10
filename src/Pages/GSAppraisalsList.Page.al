Page 52194271 "GS Appraisals List"
{
    CardPageID = "Appraisal Form - GS";
    PageType = List;
    SourceTable = "Employee Appraisals1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalCategory; "Appraisal Category")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalPeriod; "Appraisal Period")
                {
                    ApplicationArea = Basic;
                }
                field(NoSupervisedDirectly; "No. Supervised (Directly)")
                {
                    ApplicationArea = Basic;
                }
                field(NoSupervisedInDirectly; "No. Supervised (In-Directly)")
                {
                    ApplicationArea = Basic;
                }
                field(JobID; "Job ID")
                {
                    ApplicationArea = Basic;
                }
                field(AgreementWithRating; "Agreement With Rating")
                {
                    ApplicationArea = Basic;
                }
                field(GeneralComments; "General Comments")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field(Rating; Rating)
                {
                    ApplicationArea = Basic;
                }
                field(RatingDescription; "Rating Description")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiserNo; "Appraiser No")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisersName; "Appraisers Name")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseeID; "Appraisee ID")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiserID; "Appraiser ID")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseeName; "Appraisee Name")
                {
                    ApplicationArea = Basic;
                }
                field(JobGroup; "Job Group")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisersJobTitle; "Appraiser's Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseesJobTitle; "Appraisee's Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalNo; "Appraisal No")
                {
                    ApplicationArea = Basic;
                }
                field(Noseries; "No. series")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(DeapartmentCode; "Deapartment Code")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalType; "Appraisal Type")
                {
                    ApplicationArea = Basic;
                }
                field(WizardStep; "Wizard Step")
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
        SetRange("Appraisee ID", UserId);
    end;

    var
        Employee: Record Employee;
        Jobs: Record "Company Jobs1";
        EmployeeApp: Record "Employee Appraisals1";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
}

