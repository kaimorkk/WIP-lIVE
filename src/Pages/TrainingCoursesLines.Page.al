Page 52194121 "Training Courses Lines"
{
    PageType = ListPart;
    SourceTable = "HR Company or Other Training1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(CourseTitle;"Course Title")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(NeedSource;"Need Source")
                {
                    ApplicationArea = Basic;
                }
                field(CostIncurredByEmployee;"Cost Incurred By Employee")
                {
                    ApplicationArea = Basic;
                }
                field(Credits;"Training Credits")
                {
                    ApplicationArea = Basic;
                    Caption = 'Credits';
                }
                field(CertificateNumber;"Certificate Number")
                {
                    ApplicationArea = Basic;
                }
                field(Results;Results)
                {
                    ApplicationArea = Basic;
                }
                field(Competency;Competency)
                {
                    ApplicationArea = Basic;
                }
                field(Dateofreassessment;"Date of re-assessment")
                {
                    ApplicationArea = Basic;
                }
                field(TrainingEvaluation;"Training Evaluation")
                {
                    ApplicationArea = Basic;
                }
                field(Post;Post)
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        TrainingNeeds: Record "Training Needs1";
        Qualifications: Record Qualification;
}

