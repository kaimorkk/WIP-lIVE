Page 52193863 "Board Of Directors-List"
{
    PageType = Card;
    SourceTable = "Board Of Directors1";

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
                field(SurName;SurName)
                {
                    ApplicationArea = Basic;
                }
                field(OtherNames;"Other Names")
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

