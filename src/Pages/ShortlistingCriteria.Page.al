Page 52193865 "Shortlisting Criteria"
{
    PageType = ListPart;
    SourceTable = "R. Shortlisting Criteria1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(StageCode;"Stage Code")
                {
                    ApplicationArea = Basic;
                }
                field(QualificationType;"Qualification Type")
                {
                    ApplicationArea = Basic;
                }
                field(Qualification;Qualification)
                {
                    ApplicationArea = Basic;
                }
                field(DesiredScore;"Desired Score")
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

