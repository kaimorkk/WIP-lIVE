Page 52193634 "Checkoff New IESA"
{
    PageType = List;
    SourceTable = "Check of";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(StaffNumber;"Staff Number")
                {
                    ApplicationArea = Basic;
                }
                field(Loan1;"Loan 1")
                {
                    ApplicationArea = Basic;
                }
                field(BBF;BBF)
                {
                    ApplicationArea = Basic;
                }
                field(Loan2;Loan2)
                {
                    ApplicationArea = Basic;
                }
                field(IntLoan1;"Int Loan 1")
                {
                    ApplicationArea = Basic;
                }
                field(IntLoan2;"Int Loan 2")
                {
                    ApplicationArea = Basic;
                }
                field(Shares;Shares)
                {
                    ApplicationArea = Basic;
                }
                field(Investment;Investment)
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

