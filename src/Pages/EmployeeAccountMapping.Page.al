Page 52193918 "Employee Account Mapping"
{
    PageType = Card;
    SourceTable = "Employee Account Mapping1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(EmployeeNo;"Employee No.")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(LoanType;"Loan Type")
                {
                    ApplicationArea = Basic;
                }
                field(CustomerAc;"Customer A/c")
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

