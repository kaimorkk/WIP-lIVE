Page 52193660 "SMS Setup1"
{
    PageType = Card;
    SourceTable = "SMS Setup1";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(URL;URL)
                {
                    ApplicationArea = Basic;
                }
                field(MessageParameter;"Message Parameter")
                {
                    ApplicationArea = Basic;
                }
                field(PhoneParameter;"Phone Parameter")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(PhonePrefix;"Phone Prefix")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000009;Links)
            {
            }
            systempart(Control1000000008;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
    }
}

