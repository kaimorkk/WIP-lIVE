Page 52194077 "Document Link"
{
    PageType = ListPart;
    SourceTable = "Document Link1";

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
                field(Attachement;Attachement)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }


    procedure GetDocument() Document: Text[200]
    begin
        Document:="Document Description";
    end;
}

