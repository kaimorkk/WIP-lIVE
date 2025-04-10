Page 52193881 "Applicants Comments/Views"
{
    PageType = ListPart;
    SourceTable = "Applicants Comments/Views1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(ViewsComments;"Views/Comments")
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

