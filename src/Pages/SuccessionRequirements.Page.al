Page 52194081 "Succession Requirements"
{
    PageType = ListPart;
    SourceTable = "HR Company or Other Training1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(NeedSource;"Need Source")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Competency;Competency)
                {
                    ApplicationArea = Basic;
                }
                field(Dateofreassessment;"Date of re-assessment")
                {
                    ApplicationArea = Basic;
                }
                field(Approved;Approved)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

