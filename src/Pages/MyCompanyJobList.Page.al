Page 52193467 "My Company Job List"
{
    CardPageID = "Company Jobs";
    Editable = false;
    PageType = List;
    SourceTable = "Company Jobs1";

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
                field(Grade;Grade)
                {
                    ApplicationArea = Basic;
                }
                field(OccupiedEstablishments;"Occupied Establishments")
                {
                    ApplicationArea = Basic;
                }
                field(VacantEstablishments;"Vacant Establishments")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(DateActive;"Date Active")
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

