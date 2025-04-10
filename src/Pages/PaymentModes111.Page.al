Page 52193758 "Payment Modes111"
{
    Caption = 'Payment Modes';
    PageType = List;
    SourceTable = "Payment ModesPS";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

