Page 52194035 "J. Position Supervised"
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
                CaptionClass = Text19055674;
                Style = Strong;
                StyleExpr = true;
            }
            part(KPA;"Position Supervised")
            {
                SubPageLink = "Job ID"=field("Job ID");
            }
        }
    }

    actions
    {
    }

    var
        Text19055674: label 'Positions Supervised';
}

