Page 52194041 "J. Working Relationships"
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
            }
            label(Control1000000006)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19007263;
                Style = Strong;
                StyleExpr = true;
            }
            part(KPA;"Job Working Relationships")
            {
                SubPageLink = "Job ID"=field("Job ID");
            }
        }
    }

    actions
    {
    }

    var
        Text19007263: label 'Working Relationships';
}

