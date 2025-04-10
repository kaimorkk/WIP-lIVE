Page 52194070 "Medical Info"
{
    PageType = ListPart;
    SourceTable = "Medical History1";

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

