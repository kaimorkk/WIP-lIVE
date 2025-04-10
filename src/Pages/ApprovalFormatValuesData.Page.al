Page 52194194 "Approval Format Values Data"
{
    Editable = true;
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

