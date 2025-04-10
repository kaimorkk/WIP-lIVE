Page 52194046 "Company Job List"
{
    ApplicationArea = Basic;
    CardPageID = "Company Jobs";
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
                field(Dimension1;"Dimension 1")
                {
                    ApplicationArea = Basic;
                }
                field(DirectorateName;"Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field(Dimension2;"Dimension 2")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentName;"Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(NoticePeriod;"Notice Period")
                {
                    ApplicationArea = Basic;
                }
                field(ProbationPeriod;"Probation Period")
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

