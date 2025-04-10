Page 52193905 "Commitment Register"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Commitment Register";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(CommitmentNo;"Commitment No")
                {
                    ApplicationArea = Basic;
                }
                field(CommitmentDate;"Commitment Date")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1;"Global Dimension 1")
                {
                    ApplicationArea = Basic;
                }
                field(CommitmentType;"Commitment Type")
                {
                    ApplicationArea = Basic;
                }
                field(Account;Account)
                {
                    ApplicationArea = Basic;
                }
                field(CommittedAmount;"Committed Amount")
                {
                    ApplicationArea = Basic;
                }
                field(User;User)
                {
                    ApplicationArea = Basic;
                }
                field(DocumentNo;"Document No")
                {
                    ApplicationArea = Basic;
                }
                field(InvoiceNo;InvoiceNo)
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries;"No. Series")
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

