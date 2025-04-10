Page 52193633 "checkoff new"
{
    PageType = List;
    SourceTable = "Check of New";

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
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Interest;Interest)
                {
                    ApplicationArea = Basic;
                }
                field(LoanFound;"Loan Found")
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

