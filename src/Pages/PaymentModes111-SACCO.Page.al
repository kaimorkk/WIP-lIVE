Page 52193623 "Payment Modes111-SACCO"
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

