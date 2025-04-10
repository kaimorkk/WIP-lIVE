Page 52193635 "Staff Number IESA"
{
    PageType = List;
    SourceTable = "staff number";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(number;number)
                {
                    ApplicationArea = Basic;
                }
                field(staffnumber;"staff number")
                {
                    ApplicationArea = Basic;
                }
                field(name;name)
                {
                    ApplicationArea = Basic;
                }
                field(membernum;"member num")
                {
                    ApplicationArea = Basic;
                }
                field(deposit;deposit)
                {
                    ApplicationArea = Basic;
                }
                field(loanamount;"loan amount")
                {
                    ApplicationArea = Basic;
                }
                field(intamount;intamount)
                {
                    ApplicationArea = Basic;
                }
                field(loannumber;"loan number")
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

