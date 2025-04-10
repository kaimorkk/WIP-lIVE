Page 52194039 "J. Responsiblities"
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
                CaptionClass = Text19035248;
                Style = Strong;
                StyleExpr = true;
            }
            part(KPA;"Job Responsibilities")
            {
                SubPageLink = Code=field("Job ID");
            }
        }
    }

    actions
    {
    }

    var
        Text19035248: label 'Key Responsibilities';
}

