Page 52193574 "Cheque Register"
{
    PageType = List;
    SourceTable = "Banker Cheque Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(BookNo;"Book No.")
                {
                    ApplicationArea = Basic;
                }
                field(BankerChequeNo;"Banker Cheque No.")
                {
                    ApplicationArea = Basic;
                }
                field(SelectedLeaf;"Selected Leaf")
                {
                    ApplicationArea = Basic;
                }
                field(LeafIssued;"Leaf Issued")
                {
                    ApplicationArea = Basic;
                }
                field(LeafCancelled;"Leaf Cancelled")
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

