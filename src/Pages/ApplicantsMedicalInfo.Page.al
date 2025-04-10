Page 52193880 "Applicants Medical Info"
{
    PageType = ListPart;
    SourceTable = "Applicants Medical Info.1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Results;Results)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
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

