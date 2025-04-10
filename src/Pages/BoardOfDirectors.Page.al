Page 52194031 "Board Of Directors"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Board Of Directors1";
    UsageCategory = Lists;

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

