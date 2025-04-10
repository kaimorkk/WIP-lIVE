Page 52193594 "Cheque Commissions Band"
{
    PageType = List;
    SourceTable = "Cheque Commissions Band";

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
                field(LowerLimit;"Lower Limit")
                {
                    ApplicationArea = Basic;
                }
                field(UpperLimit;"Upper Limit")
                {
                    ApplicationArea = Basic;
                }
                field(Commission;Commission)
                {
                    ApplicationArea = Basic;
                }
                field(OFAmount;"% OF Amount")
                {
                    ApplicationArea = Basic;
                }
                field(User;"User %")
                {
                    ApplicationArea = Basic;
                }
                field(UseBoth;"Use Both")
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

