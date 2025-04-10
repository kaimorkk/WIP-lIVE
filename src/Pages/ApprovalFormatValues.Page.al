Page 52194193 "Approval Format Values"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Appraisal Header Values1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Value;Value)
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

