Page 52193877 "Applicants Document Link"
{
    PageType = ListPart;
    SourceTable = "Applicants Document Link1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(DocumentDescription;"Document Description")
                {
                    ApplicationArea = Basic;
                }
                field(Attached;Attached)
                {
                    ApplicationArea = Basic;
                }
                field(DocumentLink;"Document Link")
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

