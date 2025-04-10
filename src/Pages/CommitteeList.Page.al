Page 52193896 "Committee List"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Procurement Commitee1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(MinimumMembers;"Minimum Members")
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

