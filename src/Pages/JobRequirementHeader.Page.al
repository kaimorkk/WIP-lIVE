Page 52194045 "Job Requirement Header"
{
    PageType = Card;
    SourceTable = "Company Jobs1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(JobID;"Job ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(JobDescription;"Job Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoofPosts;"No of Posts")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000008;"Job Requirement Lines")
            {
                // SubPageLink = "Qualification Type"=field("Job ID");
            }
        }
    }

    actions
    {
    }
}

