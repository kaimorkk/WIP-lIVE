Page 52194233 "Job Responsibilties List"
{
    ApplicationArea = Basic;
    CardPageID = "J. Responsiblities";
    Editable = false;
    PageType = List;
    SourceTable = "Company Jobs1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(JobID;"Job ID")
                {
                    ApplicationArea = Basic;
                }
                field(JobDescription;"Job Description")
                {
                    ApplicationArea = Basic;
                }
                field(NoofPosts;"No of Posts")
                {
                    ApplicationArea = Basic;
                }
                field(OccupiedEstablishments;"Occupied Establishments")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Job)
            {
                Caption = 'Job';
                action(Card)
                {
                    ApplicationArea = Basic;
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Page "Company Jobs";
                    RunPageLink = "Job ID"=field("Job ID");
                }
            }
        }
    }
}

