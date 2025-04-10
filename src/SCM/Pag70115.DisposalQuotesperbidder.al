page 70115 "Disposal Quotes per bidder"
{
    PageType = List;
    SourceTable = "Disposal Bids Per Line 1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(DisposalNo; "Disposal No")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentNo; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Award; Award)
                {
                    ApplicationArea = Basic;
                }
                field(Customer; Customer)
                {
                    ApplicationArea = Basic;
                }
                field(QuotedAmount; "Quoted Amount")
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

