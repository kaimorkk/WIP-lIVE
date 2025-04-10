Page 52193709 "Commitment Entries11"
{
    PageType = List;
    SourceTable = "Commitment Entries";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(CommitmentNo;"Commitment No")
                {
                    ApplicationArea = Basic;
                }
                field(CommitmentDate;"Commitment Date")
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
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(EntryNo;"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2;"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(LineNo;"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(UncommittmentDate;"Uncommittment Date")
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

