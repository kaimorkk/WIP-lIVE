Page 52193482 "Job Applications List"
{
    ApplicationArea = Basic;
    CardPageID = "Job Application Card";
    PageType = List;
    SourceTable = "Job Applications Table";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ApplicationNo; ApplicationNo)
                {
                    ApplicationArea = Basic;
                }
                field(JobAppliedFor; JobAppliedFor)
                {
                    ApplicationArea = Basic;
                }
                field(RecruitmentNeedCode; "Recruitment Need Code")
                {
                    ApplicationArea = Basic;
                }
                field(TotalScore; TotalScore)
                {
                    ApplicationArea = Basic;
                }
                field(Shortlist; Shortlist)
                {
                    ApplicationArea = Basic;
                }
                field(Stage; Stage)
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationDate; "Application Date")
                {
                    ApplicationArea = Basic;
                }
                field(JobDescription; JobDescription)
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries; NoSeries)
                {
                    ApplicationArea = Basic;
                }
                field(ApplicantID; ApplicantID)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

