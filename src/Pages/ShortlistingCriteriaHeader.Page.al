Page 52193867 "Shortlisting Criteria Header"
{
    PageType = Card;
    SourceTable = "Recruitment Needs1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(JobID;"Job ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Positions;Positions)
                {
                    ApplicationArea = Basic;
                }
            }
            label(Control1000000010)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19055415;
                Style = Strong;
                StyleExpr = true;
            }
            part(KPA;"Shortlisting Criteria")
            {
                SubPageLink = "Need Code"=field("No."),
                              "Job ID"=field("Job ID");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(RequiredDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Required Documents';
                RunObject = Page "Required Documents";
                RunPageLink = "Recruitment Req. No"=field("No.");
            }
        }
    }

    var
        Text19055415: label 'Shortlisting Criteria';
}

