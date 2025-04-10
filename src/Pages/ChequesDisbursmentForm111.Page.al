Page 52193611 "Cheques Disbursment Form111"
{
    PageType = List;
    SourceTable = "Cheque Disbursment Table";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ChequeNumber;"Cheque Number")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeAmount;"Cheque Amount")
                {
                    ApplicationArea = Basic;
                }
                field(AccountType;"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(PostingDate;"Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(BankAccount;"Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(DedactFrom;"Dedact From")
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

