Page 52194074 "HR Linked Docs"
{
    AutoSplitKey = true;
    PageType = Card;
    SourceTable = "Document Link1";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(DocumentDescription;"Document Description")
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

