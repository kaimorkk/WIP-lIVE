Page 52194037 "J. Specification"
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
                Editable = false;
                field(JobID;"Job ID")
                {
                    ApplicationArea = Basic;
                }
                field(JobDescription;"Job Description")
                {
                    ApplicationArea = Basic;
                }
                field(TotalScore;"Total Score")
                {
                    ApplicationArea = Basic;
                }
            }
            label(Control1000000006)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19024070;
                Style = Strong;
                StyleExpr = true;
            }
            part(KPA;"Job Requirement Lines")
            {
                SubPageLink = "Job Id"=field("Job ID");
            }
        }
    }

    actions
    {
    }

    var
        Text19024070: label 'Job Specification';
}

